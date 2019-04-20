using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Contexto.LN;
using Contexto;

namespace AppEcomonedas
{
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Nombre.Visible = false;
            Nombre.Text = "";
            Apellido.Visible = false;
            Apellido.Text = "";
            Telefono.Visible = false;
            Telefono.Text = "";
            Direccion.Visible = false;
            Direccion.Text = "";
            Rol.Visible = false;
            Rol.Text = "";
        }

        protected void logIN_Click(object sender, EventArgs e)
        {
            if(LogIn.SesionUsr.iniciarSesion(usrID.Text, senha.Text))
            {
                Usuario usuario = (Usuario)Session["usuario"];
                Nombre.Text = usuario.Nombre;
                Apellido.Text = usuario.Apellido1;
                Telefono.Text = usuario.telefono;
                Direccion.Text = usuario.Direccion;
                Rol.Text = usuario.Rol.descripcion;
                mensaje.Text = "Sesión iniciada con éxito.";
                Nombre.Visible = true;
                Apellido.Visible = true;
                Telefono.Visible = true;
                Direccion.Visible = true;
                Rol.Visible = true;
                CentroAcopio centro = CentroAcopioLN.obtenerUsuariodeCentroAcopio(usuario.Id_Usuario);
                if (Rol.Text.Equals("Administrador"))
                {
                    Response.Redirect("PerfilAdmin.aspx");
                }
                else
                {
                    if (Rol.Text.Equals("AdministradorCentro"))
                    {
                        if (centro.activo==true) {
                            Response.Redirect("PerfilAdmnCA.aspx");
                        }
                        else
                        {
                            mensaje.Text = "El centro de acopio al que pertenece ya no se encuentra activo";
                        }
                    }
                    else
                    {
                        Response.Redirect("MiPerfil.aspx");
                    }
                }
                //Response.Redirect()
       
            }
            else
            {
                mensaje.Text = "Usuario on contraseña incorrectos. Intentelo de nuevo.";
            }
        }

      
    }
}