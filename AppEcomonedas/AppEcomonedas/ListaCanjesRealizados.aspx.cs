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
    public partial class ListaCanjesRealizados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarGrid();
        }

        private void cargarGrid()
        {
            Usuario usuario2 = (Usuario)Session["usuario"];
            CentroAcopio centro = CentroAcopioLN.obtenerUsuariodeCentroAcopio(usuario2.Id_Usuario);

            IEnumerable<Enca_Factura> lista = (IEnumerable<Enca_Factura>)Enca_FacturaLN.listaEnca_FacturaporCentro(centro.Id_Centro);
            grvListado.DataSource = lista.ToList();
            grvListado.DataBind();
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}