using Contexto;
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
            int idCupon = Convert.ToInt32(lvCupon.DataKeys[fila.DataItemIndex].Values[0]);

            Cupon cupon = CuponLN.obtenerCupon(idCupon);
            Billetera billetera = BilleteraLN.obtenerBilletera(usuario2.Billetera.Id_Billetera);

            if (billetera.Total_Disponible >= cupon.Precio_Canje) { 
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

            //llamamos al reporte
            ReportParameter[] p = new ReportParameter[4];
            p[0] = new ReportParameter("Cliente", usuario2.NombreCompleto);
            p[1] = new ReportParameter("nombre_Cupon", cupon.nombre);
            p[2] = new ReportParameter("QR", rutaQr);
            p[3] = new ReportParameter("Imagen", rutaImagen);

            LocalReport report = new LocalReport();
            report.ReportPath = Server.MapPath("~/Reportes/CuponObtenido.rdlc");
            report.EnableExternalImages = true;
            report.SetParameters(p);

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

        }else{
                lblMensaje.Visible = true;
                lblMensaje.Text = "Lo sentimos, no le alcanza para este cupón";
                lblMensaje.ForeColor = Color.Red;
        }



        }
       
    }
}