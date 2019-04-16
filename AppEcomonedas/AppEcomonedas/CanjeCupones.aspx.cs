using Contexto;
using Contexto.LN;
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
            //Usuario usuario2 = (Usuario)Session["usuario"];
            //Otra forma de obtener el id del producto
            ListViewDataItem fila = (ListViewDataItem)(sender as Control).Parent;
            int idCupon = Convert.ToInt32(lvCupon.DataKeys[fila.DataItemIndex].Values[0]);

            Cupon cupon = CuponLN.obtenerCupon(idCupon);
            // Cambiamos la billetera
            //BilleteraLN.ObtenerCupon(usuario2.Billetera.Id_Billetera, cupon.Precio_Canje);

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
            qrCodeImage.Save(path + cupon.nombre+"qr", ImageFormat.Jpeg);

            //llamamos al reporte




            ////descarga la imagen 
            //FileInfo fileInfo = new FileInfo("C:/Users/FaBii/Desktop/Nueva carpeta (2)/Proyecto/AppEcomonedas/AppEcomonedas/images/cupones/" + cupon.imagen);
            //Response.Clear();
            //Response.AddHeader("Content-Disposition", "attachment;filename=" + fileInfo.Name);
            //Response.AddHeader("Content-Length", fileInfo.Length.ToString());
            //Response.ContentType = "application/octet-stream";
            //Response.Flush();
            //Response.WriteFile(fileInfo.FullName);
            //Response.End();

            

        }
    }
}