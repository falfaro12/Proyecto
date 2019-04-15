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
          
        }
    }
}