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
    public partial class CarritoCanje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                llenarListaCarrito();
                llenarComboClientes();
            }
            if (Session["encabezadoOrden"] != null)
           {
               Enca_Factura enca = (Enca_Factura)Session["encabezadoOrden"];
               ddlClientes.SelectedValue = enca.Usuario.Id_Usuario;

            }
        }

        private void llenarComboClientes()
        {
            ddlClientes.DataSource = UsuarioLN.listaUsuariosClientes().ToList();
            ddlClientes.DataBind();
        }

        private void llenarListaCarrito()
        {
            List<Contexto.CarritoCanje> items = Carrito.Instancia.Items;
            grvCarrito.DataSource = items.ToList();
            grvCarrito.DataBind();           
            lblTotal.Text = String.Format("${0:N2}", Carrito.Instancia.GetTotal());
        }

       

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Enca_Factura enca = new Enca_Factura();
            enca.Usuario = UsuarioLN.obtenerUsuario(ddlClientes.SelectedValue);
            Session["encabezadoOrden"] = enca;
        }

        protected void grvCarrito_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void CantidadComprar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnOrdenar_Click(object sender, EventArgs e)
        {

        }
    }
}