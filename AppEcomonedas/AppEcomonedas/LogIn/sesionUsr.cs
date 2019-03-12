using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Contexto;

namespace AppEcomonedas.LogIn
{
    public class SesionUsr
    {

        //Implementación Singleton

        // Las propiedades de solo lectura solo se pueden establecer en la inicialización o en un constructor
        public static readonly Usuario Instancia;

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

        public void iniciarSesion(int id, string password)
        {

        }

    }
}