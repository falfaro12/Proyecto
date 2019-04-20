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
    public partial class PerfilAdmnCA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDatos();
            }
            
            string accioncentro = Request.QueryString["accion"];
            if (accioncentro == "guardar")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Datos guardados";
            }
        }

        protected void cargarDatos()
        {
            Usuario miUsuario = (Usuario)Session["usuario"];
            txtNombre.Text = miUsuario.Nombre;
            txtApellido1.Text = miUsuario.Apellido1;
            txtApellido2.Text = miUsuario.Apellido2;
            txtDireccion.Text = miUsuario.Direccion;
            txtTelefono.Text = miUsuario.telefono;
            txtCorreo.Text = miUsuario.Id_Usuario;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Usuario urs = (Usuario)Session["usuario"];
            string contrasenha = txtContrasenha.Text;
            if (contrasenha.Equals(""))
                contrasenha = urs.contrasenna;
            string nombre = txtNombre.Text;
            UsuarioLN.AgregarUsuario(txtNombre.Text, txtApellido1.Text, txtApellido2.Text, txtDireccion.Text, 2, txtTelefono.Text, contrasenha, txtCorreo.Text);
            LogIn.SesionUsr.actualizarSesion(txtNombre.Text, txtApellido1.Text, txtApellido2.Text, txtDireccion.Text, txtTelefono.Text, contrasenha);
            Response.Redirect("PerfilAdmnCA.aspx?accion=guardar");

        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Enabled)
            {
                txtNombre.Enabled = false;
                txtApellido1.Enabled = false;
                txtApellido2.Enabled = false;
                txtDireccion.Enabled = false;
                txtTelefono.Enabled = false;
            }
            else
            {
                txtNombre.Enabled = true;
                txtApellido1.Enabled = true;
                txtApellido2.Enabled = true;
                txtDireccion.Enabled = true;
                txtTelefono.Enabled = true;
            }
        }

        protected void btnContrasenha_Click(object sender, EventArgs e)
        {
            if (lblContrasenha.Visible)
            {
                lblContrasenha.Visible = false;
                txtContrasenha.Visible = false;
                txtContrasenha.Enabled = false;
            }
            else
            {
                lblContrasenha.Visible = true;
                txtContrasenha.Visible = true;
                txtContrasenha.Enabled = true;
            }
        }
    }
}