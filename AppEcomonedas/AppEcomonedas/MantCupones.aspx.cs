using Contexto;
using Contexto.LN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppEcomonedas
{
    public partial class MantCupones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string accion = Request.QueryString["accion"];
            if (accion != "")
            {
                lblMensaje.Visible = true;
                switch (accion)
                {
                    case "nuevo":
                        lblMensaje.Text = "Cupón de canje registrado satisfactoriamente!";
                        break;
                    case "actu":
                        lblMensaje.Text = "Cupón de canje actualizado satisfactoriamente!";
                        break;
                    default:
                        lblMensaje.Visible = false;
                        lblMensaje.Text = "";
                        break;
                }

            }
            if (!IsPostBack)
            {
                cargarGrid();
            }
        }

        public void cargarGrid()
        {
            IEnumerable<Cupon> lista = (IEnumerable<Cupon>)CuponLN.listaCuponesMantenimiento();
            grvListado.DataSource = lista.ToList();
            grvListado.DataBind();
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);

            Cupon mat =
                   CuponLN.listaCuponesActivos().
                   Where(p => p.Id_Cupon == id).FirstOrDefault<Cupon>();
            txtNombre.Text = mat.nombre;
            txtDescripcion.Text = mat.descripcion;
            txtPrecio.Text = mat.Precio_Canje.ToString();          
            hiddenID.Value = mat.Id_Cupon.ToString();
            imgLibro.ImageUrl = "~/images/cupones/" + mat.imagen;
            btnGuardar.Text = "Actualizar";
            rfImagen.Enabled = false;
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);

            Cupon mat =
                   CuponLN.listaCupones().
                   Where(p => p.Id_Cupon == id).FirstOrDefault<Cupon>();
            txtNombre.Text = mat.nombre;
            txtDescripcion.Text = mat.descripcion;
            txtPrecio.Text = mat.Precio_Canje.ToString();          
            hiddenID.Value = mat.Id_Cupon.ToString();
            imgLibro.ImageUrl = "~/images/cupones/" + mat.imagen;
            btnGuardar.Text = "Actualizar";
            rfImagen.Enabled = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            bool estado = true;
            if (RadioButton1.Checked)
            {
                estado = true;
            }
            else
            {
                if (RadioButton2.Checked)
                {
                    estado = false;
                }
            }
            Boolean archivoOK = false;
            String path = Server.MapPath("~/images/");
            if (archivoImagen.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(archivoImagen.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        archivoOK = true;
                    }
                }


                if (archivoOK)
                {
                    try
                    {
                        // Guardar imagen en la carpeta materiales
                        archivoImagen.PostedFile.SaveAs(path + "cupones/" + archivoImagen.FileName);
                    }
                    catch (Exception ex)
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = ex.Message;
                    }
                }
                else
                {

                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No se puede aceptar el tipo de archivo.";
                    return;
                }
            }

            // Agregar producto a la BD

            bool confirmar = CuponLN.agregarCupones(txtNombre.Text, txtDescripcion.Text, txtPrecio.Text, archivoImagen.FileName, estado,hiddenID.Value);
            if (confirmar)
            {

                // Recargar la pagina
                string accion = (hiddenID.Value == "" || hiddenID.Value == "0") ? "nuevo" : "actu";
                Response.Redirect("MantCupones.aspx?accion=" + accion);
            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "No se puedo agregar un nuevo cupón, por favor intentar de nuevo";
            }
        }
    }
}