﻿using AppEcomonedas.LogIn;
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
            int idMaterial = Convert.ToInt32(grvCarrito.DataKeys[e.RowIndex].Values[0]);
            Carrito.Instancia.EliminarItem(idMaterial);
            llenarListaCarrito();
        }

        protected void CantidadComprar_TextChanged(object sender, EventArgs e)
        {
            //Obtener fila actual
            GridViewRow currentRow = (GridViewRow)((TextBox)sender).Parent.Parent;
            TextBox txtCantidad = (TextBox)currentRow.FindControl("CantidadComprar");
            if (txtCantidad.Text != "")
            {
                int cantidad = Convert.ToInt32(txtCantidad.Text);
                int idMaterial = Convert.ToInt32(grvCarrito.DataKeys[currentRow.RowIndex].Values[0]);
                //Actualizar cantidad en la sesión del carrito
                Carrito.Instancia.SetItemcantidad(idMaterial, cantidad);
                llenarListaCarrito();
            }

        }

        protected void btnOrdenar_Click(object sender, EventArgs e)
        {
            //buscar el centro que tenga el usuario logeado 
            string idAdmi = SesionUsr.Instancia.Id_Usuario;
            CentroAcopio centro = CentroAcopioLN.obtenerUsuariodeCentroAcopio(idAdmi);

            if (grvCarrito.Rows.Count >= 1)
            {
                if (OrdenCompraLN.registrarOrden
                    (ddlClientes.SelectedValue,centro.Id_Centro,
                    Carrito.Instancia.Items))
                {
                    Carrito.Instancia.eliminarCarrito();
                    Response.Redirect("listaOrdenesCompra.aspx?accion=registro");
                }
            }

        }
    }
}