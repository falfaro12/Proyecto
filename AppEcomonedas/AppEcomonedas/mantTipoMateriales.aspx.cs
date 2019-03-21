using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppEcomonedas
{
    public partial class mantTipoMateriales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void llenarColores()
        {
            Array Color = Enum.GetValues(typeof(ConsoleColor));
            
        }

        protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}