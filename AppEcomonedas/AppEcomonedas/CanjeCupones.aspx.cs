using Contexto;
using Contexto.LN;
using Contexto.LN;
using Microsoft.Reporting.WebForms;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppEcomonedas
{
    public partial class CanjeCupones : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            string accioncarrito = Request.QueryString["accion"];
            if (accioncarrito == "registro")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Cupon Obtenido con éxito";
            }
            Usuario usuario2 = (Usuario)Session["usuario"];
           Billetera billetera = BilleteraLN.obtenerBilletera(usuario2.Billetera.Id_Billetera);
            lblTotalEcomonedas.Text = billetera.Total_Disponible.ToString();
        }
        public IEnumerable<Cupon> listadoCupon()
        {
            return CuponLN.listaCupones();
        }


       
        protected void linkAgregar_Click(object sender, EventArgs e)
        {
            Usuario usuario2 = (Usuario)Session["usuario"];
            

            //Otra forma de obtener el id del producto
            ListViewDataItem fila = (ListViewDataItem)(sender as Control).Parent;
            HiddenField hi =(HiddenField) fila.FindControl("hiddenID");
            int idCupon =Convert.ToInt32(hi.Value);

            if (idCupon != 0)
            {
                Cupon cupon = CuponLN.obtenerCupon(idCupon);
                Billetera billetera = BilleteraLN.obtenerBilletera(usuario2.Billetera.Id_Billetera);

                if (billetera.Total_Disponible >= cupon.Precio_Canje)
                {
                    // Cambiamos la billetera

                    BilleteraLN.ObtenerCupon(billetera.Id_Billetera, cupon.Precio_Canje);
                    lblTotalEcomonedas.Text = billetera.Total_Disponible.ToString();

                    //Cambiamos el estado del cupon
                    CuponLN.agregarCupones(cupon.nombre, cupon.descripcion, cupon.Precio_Canje.ToString(), cupon.imagen, false,cupon.Id_Cupon.ToString());   


                    //Agregamos el cupon a la bd
                    Cupon_UsuarioLN.registrarCupon_Usuario(usuario2.Id_Usuario, cupon.Id_Cupon, cupon.activo.Value);




                    //Creamos un qr

                    var txtQRCode = cupon.imagen;
                    QRCodeGenerator qrGenerator = new QRCodeGenerator();
                    QRCodeData qrCodeData = qrGenerator.CreateQrCode(txtQRCode, QRCodeGenerator.ECCLevel.Q);
                    QRCode qrCode = new QRCode(qrCodeData);
                    Bitmap qrCodeImage = qrCode.GetGraphic(20);

                    //guardamos la imagen 
                    var folder = "images/Qrs/";
                    var path = System.Web.HttpContext.Current.Server.MapPath(folder);
                    qrCodeImage.Save(path + cupon.nombre + "qr.Jpeg", ImageFormat.Jpeg);


                    //Asignamos la ruta de las imagenes
                    System.Drawing.Image imagen = System.Drawing.Image.FromFile(Server.MapPath("~/images/cupones/"+cupon.imagen));


                    //Hacemos las imagenes en byte 
                    CanjeCupon Canje = new CanjeCupon();
                    Canje.cliente = usuario2.NombreCompleto;
                    Canje.id = cupon.Id_Cupon;
                    Canje.imagenQR = CanjeCuponLN.ImagenByte(qrCodeImage);
                    Canje.imagenCupon = CanjeCuponLN.ImagenByte(imagen);
                    Canje.nombreCupon = cupon.nombre;
                 


                    //llamamos al reporte 
                    LocalReport report = new LocalReport();
                    report.DataSources.Clear();

                    ReportDataSource rdc = new ReportDataSource("DataSet1", CanjeCuponLN.canjeCupon(Canje));
                    report.DataSources.Add(rdc);
                    report.ReportPath = Server.MapPath("~/Reportes/CuponObtenido.rdlc");
                    report.EnableExternalImages = true;


                    string FileName = "Cupon-" + cupon.nombre.Trim() + ".pdf";
                    string extension;
                    string encoding;
                    string mimeType;
                    string[] streams;
                    Warning[] warnings;



                    Byte[] mybytes = report.Render("PDF", null,
                                    out extension, out encoding,
                                    out mimeType, out streams, out warnings); //for exporting to PDF  
                    using (FileStream fs = File.Create(Server.MapPath("~/images/DescargasCupones/") + FileName))
                    {
                        fs.Write(mybytes, 0, mybytes.Length);
                    }




                    Response.Buffer = true;

                    Response.ContentType = "application/pdf";

                    Response.AddHeader("content-disposition", "inline;filename=" + FileName + ".pdf");
                    Response.WriteFile(Server.MapPath(Path.Combine("~/images/DescargasCupones/" + FileName)));
                    Response.End();


                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Lo sentimos, no le alcanza para este cupón";
                    lblMensaje.ForeColor = Color.Red;
                }
            }



        }

        protected void btnDescarga_Click(object sender, EventArgs e)
        {

        }
    }
}