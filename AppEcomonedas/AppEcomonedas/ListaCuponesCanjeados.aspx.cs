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
    public partial class ListaCuponesCanjeados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarGrid();
        }
        private void cargarGrid()
        {
            //Usuario usuario2 = (Usuario)Session["usuario"];
            Usuario usuario2 = UsuarioLN.obtenerUsuario("albin24mv@gmail.com");

            IEnumerable<Cupon_Usuario> lista = (IEnumerable<Cupon_Usuario>)Cupon_UsuarioLN.listaCupon_UsuarioporUsuario(usuario2.Id_Usuario);
            grvListado.DataSource = lista.ToList();
            grvListado.DataBind();
        }

      
    }
}