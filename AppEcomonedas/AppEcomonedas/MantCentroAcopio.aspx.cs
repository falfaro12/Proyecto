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
    public partial class Centro_de_acopio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
    }
}