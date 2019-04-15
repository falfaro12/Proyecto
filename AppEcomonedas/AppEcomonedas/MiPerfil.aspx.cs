using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Contexto;


namespace AppEcomonedas
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarDatos();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnContrasenha_Click(object sender, EventArgs e)
        {
            lblContrasenha.Visible = true;
            txtContrasenha.Visible = true;
            txtContrasenha.Enabled = true;
        }

        protected void cargarDatos()
        {
            var miUsuario = LogIn.SesionUsr.Instancia;
            txtNombre.Text = miUsuario.Nombre;
            txtApellido1.Text = miUsuario.Apellido1;
            txtApellido2.Text = miUsuario.Apellido2;
            txtDireccion.Text = miUsuario.Direccion;
            txtTelefono.Text = miUsuario.telefono;
            txtCorreo.Text = miUsuario.Id_Usuario;
        }
    }
}