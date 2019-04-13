using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Contexto;
using Contexto.LN;

namespace AppEcomonedas.LogIn
{
    public class SesionUsr
    {

        //Implementación Singleton

        // Las propiedades de solo lectura solo se pueden establecer en la inicialización o en un constructor
        public static readonly  Usuario Instancia;

   

        // Se llama al constructor estático tan pronto como la clase se carga en la memoria
        static SesionUsr()
        {
            // Si el carrito no está en la sesión, cree uno y guarde los items.
            if (HttpContext.Current.Session["usuario"] == null)
            {
                Instancia = new Usuario();            
               HttpContext.Current.Session["usuario"] = Instancia;
            }
            else
            {
                // De lo contrario, obténgalo de la sesión.
                Instancia = (Usuario)HttpContext.Current.Session["usuario"];
            }
        }

        // Un constructor protegido asegura que un objeto no se puede crear desde el exterior
        protected SesionUsr() { }

        public static bool iniciarSesion(string id, string password)
        {
            Usuario miUsuario = UsuarioLN.obtenerUsuario(id);
            if (miUsuario.contrasenna.Equals(password))
            {
                HttpContext.Current.Session["usuario"] = miUsuario;               
                return true;
            }else
            {
                return false;
            }

        }


    }
}