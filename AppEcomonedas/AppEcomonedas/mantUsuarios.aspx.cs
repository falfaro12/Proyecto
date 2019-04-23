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
            cargarGrid();
            string accioncentro = Request.QueryString["accion"];
            if (accioncentro == "guardar")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Usuario guardado";
            }
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = grvListado.DataKeys[grvListado.SelectedIndex].Values[0].ToString();
            Usuario usr = UsuarioLN.obtenerUsuario(id);
            txtNombre.Text = usr.Nombre;
            txtApellido1.Text = usr.Apellido1;
            txtApellido2.Text = usr.Apellido2;
            txtDireccion.Text = usr.Direccion;
            txtTelefono.Text = usr.telefono;
            txtCorreo.Text = usr.Id_Usuario;

            hiddenID.Value = usr.Id_Usuario;


            btnGuardar.Text = "Actualizar"; 

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