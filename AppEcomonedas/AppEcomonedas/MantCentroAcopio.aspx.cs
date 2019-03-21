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
    public partial class Centro_de_acopio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string accioncentro = Request.QueryString["accion"];
            if (accioncentro == "guardar")
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Centro de Acopio Guardado";
            }
            cargarGrid();
            if (!IsPostBack)
            {
                cargarAdministradores();
                cargarProvincias();
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            // si ninguna provincia es seleccionada
            if (ddlProvincia.SelectedValue == null || ddlProvincia.SelectedValue == "")
            {
                ddlProvincia.SelectedValue = "1";
            }

            Provincia cate = ProvinciaLN.obtenerProvincia(Convert.ToInt32(ddlProvincia.SelectedValue));          
        }
        public void cargarProvincias()
        {
            ddlProvincia.DataSource = ProvinciaLN.listaCategorias().ToList();
            ddlProvincia.DataBind();
        }

        public void cargarAdministradores()
        {
            ddlAdministrador.DataSource = UsuarioLN.listaAdministradores().ToList();
            ddlAdministrador.DataBind();
        }

        protected void ddlAdministrador_SelectedIndexChanged(object sender, EventArgs e)
        {
            // si ninguna provincia es seleccionada
            if (ddlAdministrador.SelectedValue == null || ddlAdministrador.SelectedValue == "")
            {
                ddlAdministrador.SelectedValue = "1";
            }

            Usuario cate = UsuarioLN.obtenerUsuario(ddlAdministrador.SelectedValue);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //guardar Centro
            CentroAcopioLN centro = new CentroAcopioLN();
            bool confirmarGuardar = CentroAcopioLN.AgregarCentroAcopio(txtNombre.Text, txtDireccion.Text, ddlAdministrador.SelectedValue, ddlProvincia.SelectedValue,hiddenID.Value);
            if (confirmarGuardar)
            {
                //recarga la pagina
                Response.Redirect("MantCentroAcopio.aspx?accion=guardar");

            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "No se puede guardar el centro de acopio";
            }
        }
        public void cargarGrid()
        {
            IEnumerable<CentroAcopio> lista = (IEnumerable<CentroAcopio>)CentroAcopioLN.listaCentros();
            grvListado.DataSource = lista.ToList();
            grvListado.DataBind();
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlAdministrador.Items.Clear();
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]
               );
            CentroAcopio centro = CentroAcopioLN.obtenerCentroAcopio(id);
            txtNombre.Text = centro.nombre;
            ddlProvincia.SelectedValue = centro.Id_Provincia.ToString();
            Usuario usu = UsuarioLN.obtenerUsuario(centro.Id_Usuario);
            IEnumerable<Usuario> listaAdmi = UsuarioLN.listaAdministradores();
            List<Usuario> lista2 = (List<Usuario>)listaAdmi.ToList();
            lista2.Add(usu);
            ddlAdministrador.DataSource = lista2;
            ddlAdministrador.DataBind();
            ddlAdministrador.SelectedValue = centro.Id_Usuario;
            hiddenID.Value = centro.Id_Centro.ToString();              
            txtDireccion.Text = centro.direccionExacta;
          

            btnGuardar.Text = "Actualizar";
            
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            ddlAdministrador.Items.Clear();
            ddlProvincia.Items.Clear();
            cargarAdministradores();
            cargarProvincias();
            txtDireccion.Text = "";
            txtNombre.Text = "";
            hiddenID.Value = "";
            btnGuardar.Text = "Guardar";
        }
    }
}