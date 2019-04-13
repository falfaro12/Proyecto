using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Contexto;
using Contexto.LN;

namespace AppEcomonedas
{
    public partial class mantUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string accioncentro = Request.QueryString["accion"];
            if (accioncentro == "guardar")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Usuario guardado";
            }
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*ddlCentroAcopio.Items.Clear();
            string id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);
            Usuario usr = UsuarioLN.obtenerUsuario()
            txtNombre.Text = centro.nombre;
            Usuario usu = UsuarioLN.obtenerUsuario(centro.Id_Usuario);
            IEnumerable<Usuario> listaAdmi = UsuarioLN.listaAdministradores();
            List<Usuario> lista2 = (List<Usuario>)listaAdmi.ToList();
            lista2.Add(usu);
            ddlAdministrador.DataSource = lista2;
            ddlAdministrador.DataBind();
            ddlAdministrador.SelectedValue = centro.Id_Usuario.ToString();
            hiddenID.Value = centro.Id_Centro.ToString();
            txtDireccion.Text = centro.direccionExacta;


            btnGuardar.Text = "Actualizar"; */

        }


        public void cargarGrid()
        {
            IEnumerable<Usuario> lista = (IEnumerable<Usuario>)UsuarioLN.ListaUsuarioAdmiCentro();
            grvListado.DataSource = lista.ToList();
            grvListado.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //guardar Usuario
            bool confirmarGuardar = UsuarioLN.AgregarUsuario(txtNombre.Text, txtApellido1.Text, txtApellido2.Text, txtDireccion.Text, 2, txtTelefono.Text,"Bienvenido1", txtCorreo.Text);
            if (confirmarGuardar)
            {
                //recarga la pagina
                Response.Redirect("mantUsuarios.aspx?accion=guardar");

            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "No se puede guardar el usuario administador";
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtDireccion.Text = "";
            txtNombre.Text = "";
            txtApellido1.Text = "";
            txtApellido2.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            btnGuardar.Text = "Guardar";
        }
    }
}