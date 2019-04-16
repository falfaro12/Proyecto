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
        int idCupon = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string accioncarrito = Request.QueryString["accion"];
            if (accioncarrito == "registro")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Cupon Obtenido con éxito";
            }
        }
        public IEnumerable<Cupon> listadoCupon()
        {
            return CuponLN.listaCupones();
        }


        protected void linkOntener_Click(object sender, EventArgs e) {
            ListViewDataItem fila = (ListViewDataItem)(sender as Control).Parent;
            idCupon = Convert.ToInt32(lvCupon.DataKeys[fila.DataItemIndex].Values[0]);

        }
        protected void linkAgregar_Click(object sender, EventArgs e)
        {
            Usuario usuario2 = (Usuario)Session["usuario"];

            //Otra forma de obtener el id del producto

            if (idCupon != 0)
            {
                Cupon cupon = CuponLN.obtenerCupon(idCupon);
                Billetera billetera = BilleteraLN.obtenerBilletera(usuario2.Billetera.Id_Billetera);

                if (billetera.Total_Disponible >= cupon.Precio_Canje)
                {
                    // Cambiamos la billetera

                    BilleteraLN.ObtenerCupon(billetera.Id_Billetera, cupon.Precio_Canje);






                    //Agregamos el cupon a la bd




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
                    var rutaImagen = Server.MapPath("/images/cupones/" + cupon.imagen);
                    var rutaQr = Server.MapPath("~/images/Qrs/" + cupon.nombre + "qr.Jpeg");

                    //Hacemos las imagenes en byte 
                    CanjeCupon Canje = new CanjeCupon();
                    Canje.cliente = usuario2.NombreCompleto;
                    Canje.id = cupon.Id_Cupon;
                    Canje.imagenQR = CanjeCuponLN.ImagenByte(CanjeCuponLN.GeneraImagen(rutaQr));
                    Canje.imagenCupon = CanjeCuponLN.ImagenByte(CanjeCuponLN.GeneraImagen(rutaImagen));


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
                    Response.WriteFile(Server.MapPath("~/images/DescargasCupones/" + FileName));
                    Response.Flush();


                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Lo sentimos, no le alcanza para este cupón";
                    lblMensaje.ForeColor = Color.Red;
                }
            }



        }
       
    }
}