using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Contexto.LN;

namespace AppEcomonedas
{
    public partial class AutoRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonReg_Click(object sender, EventArgs e)
        {
            UsuarioLN.AgregarUsuario(nombre.Text, apellido1.Text, apellido2.Text, direccion.Text, 3, telefono.Text, int.Parse(id.Text));
        }
    }
}