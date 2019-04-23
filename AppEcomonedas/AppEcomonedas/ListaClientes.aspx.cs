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
    public partial class ListaClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarGrid();
        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            string termino = txtBuscarCliente.Text;
            IEnumerable<Usuario> lista = (IEnumerable<Usuario>)UsuarioLN.listaUsuariosClientes();
            grvListado.DataSource = lista.ToList().Where(x => x.Id_Usuario.Contains(termino));
            grvListado.DataBind();
        }

    
        public void cargarGrid()
        {          
            IEnumerable<Usuario> lista = (IEnumerable<Usuario>)UsuarioLN.listaUsuariosClientes();
            grvListado.DataSource = lista.ToList();
            grvListado.DataBind();
        }
    }
}