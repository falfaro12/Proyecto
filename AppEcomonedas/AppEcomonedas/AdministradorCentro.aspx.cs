using appLibros.CarritosLN;
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
    public partial class AdministradorCentro : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string accioncarrito = Request.QueryString["accion"];
            if (accioncarrito == "registro")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Canje guardado con éxito";
            }
        }
        public IEnumerable<Material> listadoMateriales()
        {
            return MaterialLN.listaMateriales();
        }

        protected void linkAgregar_Click(object sender, EventArgs e)
        {
            ListViewDataItem fila = (ListViewDataItem)(sender as Control).Parent;
            int idMaterial = Convert.ToInt32(lvMaterial.DataKeys[fila.DataItemIndex].Values[0]);          
            TextBox txtCantidad = (TextBox)fila.FindControl("txtCantidad");                  
            Carrito.Instancia.AgregarItem(idMaterial,Convert.ToInt32(txtCantidad.Text));
            txtCantidad.Text = "1";
        }
   


        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}