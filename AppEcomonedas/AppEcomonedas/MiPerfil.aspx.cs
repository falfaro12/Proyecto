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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("InicioSesio.aspx");
            cargarDatos();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            txtNombre.Enabled = true;
            txtApellido1.Enabled = true;
            txtApellido2.Enabled = true;
            txtDireccion.Enabled = true;
            txtTelefono.Enabled = true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Usuario urs = (Usuario)Session["usuario"];
            int rol = urs.Rol.Id_Rol;
            string contrasenha = txtContrasenha.Text;
            if (contrasenha.Equals(""))
                contrasenha = urs.contrasenna;
            UsuarioLN.AgregarUsuario(txtNombre.Text, txtApellido1.Text, txtApellido2.Text, txtDireccion.Text, rol, txtTelefono.Text, contrasenha, txtCorreo.Text);
                
        }

        protected void btnContrasenha_Click(object sender, EventArgs e)
        {
            lblContrasenha.Visible = true;
            txtContrasenha.Visible = true;
            txtContrasenha.Enabled = true;
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
    }
}