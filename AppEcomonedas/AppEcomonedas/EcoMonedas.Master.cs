using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppEcomonedas
{
    public partial class EcoMonedas : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario2 = (Usuario)Session["usuario"];
            txtUsuario.Text = usuario2.NombreCompleto;
        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //Cerrar           
            LogIn.SesionUsr.CerrarSesion();
            Response.Redirect("Inicio.aspx");
        }
    }
}