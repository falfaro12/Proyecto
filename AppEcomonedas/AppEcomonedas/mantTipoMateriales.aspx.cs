﻿using Contexto;
using Contexto.LN;
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
            string accion = Request.QueryString["accion"];
            if (accion != "")
            {
                lblMensaje.Visible = true;
                switch (accion)
                {
                    case "nuevo":
                        lblMensaje.Text = "Libro registrado satisfactoriamente!";
                        break;
                    case "actu":
                        lblMensaje.Text = "Libro actualizado satisfactoriamente!";
                        break;
                    default:
                        lblMensaje.Visible = false;
                        lblMensaje.Text = "";
                        break;
                }



            }
            if (!IsPostBack)
            {
                cargarGrid();
            }
        }
      

        public void cargarGrid()
        {
            IEnumerable<Material> lista = (IEnumerable<Material>)MaterialLN.listaMateriales();
            grvListado.DataSource = lista.ToList();
            grvListado.DataBind();
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);

            Material mat =
                   MaterialLN.listaMateriales().
                   Where(p => p.Id_Material == id).FirstOrDefault<Material>();
            txtNombre.Text=mat.nombre;
            txtDescripcion.Text=mat.descripcion;
            txtPrecio.Text=mat.Precio_Material.ToString();
            txtColor.Value = mat.color;
            imgLibro.ImageUrl = "~/imagenes/materiales/" + mat.imagen;
            btnGuardar.Text = "Actualizar";
           
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Boolean archivoOK = false;
            String path = Server.MapPath("~/images/");
            if (archivoImagen.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(archivoImagen.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        archivoOK = true;
                    }
                }
            }

            if (archivoOK)
            {
                try
                {
                    // Guardar imagen en la carpeta manteriales
                    archivoImagen.PostedFile.SaveAs(path + "materiales/" + archivoImagen.FileName);
                }
                catch (Exception ex)
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = ex.Message;
                }

                // Agregar producto a la BD

                bool confirmar = MaterialLN.agregarMateriales(
                    txtNombre.Text,
                    txtDescripcion.Text,               
                    txtPrecio.Text,
                    archivoImagen.FileName,
                    txtColor.Value, 
                    hiddenID.Value);
                if (confirmar)
                {

                    // Recargar la pagina
                    string accion = (hiddenID.Value == "" || hiddenID.Value == "0") ? "nuevo" : "actu";
                    Response.Redirect("mantTipoMateriales.aspx?accion=" + accion);
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No se puedo guardar material, intentelo de nuevo";
                }
            }
            else
            {

                lblMensaje.Visible = true;
                lblMensaje.Text = "No se puede aceptar el tipo de archivo.";
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtNombre.Text = "";
                    txtDescripcion.Text = "";
            txtPrecio.Text = "";           
            txtColor.Value = "";
            hiddenID.Value = "";
            archivoImagen = null;
            btnGuardar.Text = "Guardar";
        }
    }
}