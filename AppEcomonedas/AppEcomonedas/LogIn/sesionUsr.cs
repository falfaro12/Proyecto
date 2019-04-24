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
            // Si el usuario no está en la sesión, cree uno 
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
            if (miUsuario != null && miUsuario.contrasenna.Equals(password))
            {
                HttpContext.Current.Session["usuario"] = miUsuario;               
                return true;
            }else
            {
                return false;
            }

        }

        public static void actualizarSesion(string nombre, string apellido1, string apellido2, string direccion, string telefono, string contrasenha)
        {
            Usuario usr = new Usuario();
            usr.Nombre = nombre;
            usr.Apellido1 = apellido1;
            usr.Apellido2 = apellido2;
            usr.Direccion = direccion;
            usr.telefono = telefono;
            usr.contrasenna = contrasenha;
            HttpContext.Current.Session["usuario"] = usr;
        }

        public static bool CerrarSesion()
        {
            if (HttpContext.Current.Session["usuario"] != null)
            {
                HttpContext.Current.Session["usuario"] = null;
                return true;
            }
            else
            {
                return false;
            }

        }


    }
}