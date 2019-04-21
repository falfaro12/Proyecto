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
           
        }

        protected void logIN_Click(object sender, EventArgs e)
        {
            if(LogIn.SesionUsr.iniciarSesion(usrID.Text, senha.Text))
            {
                Usuario usuario = (Usuario)Session["usuario"];
                CentroAcopio centro = CentroAcopioLN.obtenerUsuariodeCentroAcopio(usuario.Id_Usuario);
                if (usuario.Rol.Id_Rol == 1)
                {
                    Response.Redirect("PerfilAdmin.aspx");
                }
                else
                {
                    if (usuario.Rol.Id_Rol == 2)
                    {
                        if (centro != null && centro.activo==true) {
                            Response.Redirect("PerfilAdmnCA.aspx");
                        }
                        else
                        {
                            mensaje.Visible = true;
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
                mensaje.Visible = true;
                mensaje.Text = "Usuario on contraseña incorrectos. Intentelo de nuevo.";
            }
        }

      
    }
}