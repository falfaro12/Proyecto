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
            Usuario usuario2 = (Usuario)Session["usuario"];
          

            IEnumerable<Cupon_Usuario> lista = (IEnumerable<Cupon_Usuario>)Cupon_UsuarioLN.listaCupon_UsuarioporUsuario(usuario2.Id_Usuario);
            if (lista != null || lista.Any())
            {
                grvListado.DataSource = lista.ToList();
                grvListado.DataBind();
            }else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Aún no tienes cupones canjeados";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Usuario usuario2 = (Usuario)Session["usuario"];
            string termino = txtBuscarCliente.Text;

            IEnumerable<Cupon_Usuario> lista = (IEnumerable<Cupon_Usuario>)Cupon_UsuarioLN.listaCupon_UsuarioporUsuario(usuario2.Id_Usuario);
            if (lista != null || lista.Any())
            {
                grvListado.DataSource = lista.ToList().Where(x => x.Cupon.nombre.Contains(termino));
                grvListado.DataBind();
            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Aún no tienes cupones canjeados";
            }
        }
    }
}