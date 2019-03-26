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

        }
        public IEnumerable<Material> listadoMateriales()
        {
            return MaterialLN.listaMateriales();
        }

        protected void linkAgregar_Click(object sender, EventArgs e)
        {

        }
    }
}