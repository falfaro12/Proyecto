using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class UsuarioLN
    {
        public static bool AgregarUsuario(
            string nombre,
            int idRol,
            int telefono,
            string idUsr = ""
            )
        {
            EcomonedasContexto db = new EcomonedasContexto();
            var miUsuario = new Usuario();
            int idUser = 0;
            string idUsuario = "";
            bool esNumero = int.TryParse(idUsr, out idUser);
            if (esNumero)
                idUsuario = idUser.ToString();

            if (esNumero || idUser> 0)
            {
                // Busca Usuario en la DB
                miUsuario = db.Usuario.Where(p => p.Id_Usuario == idUsuario).First<Usuario>();
            }
            //Creacion del libro
            miUsuario.Nombre = nombre;
            miUsuario.Id_Usuario = idUsr;
            miUsuario.Id_Rol = idRol;

            if (idUsr.Equals("") || !esNumero)
            { //agrega
                db.Usuario.Add(miUsuario);
            }
            db.SaveChanges();

            // Confirmacion
            return true;
        }



        public static IQueryable queryListaUsuario()
        {
            var db = new EcomonedasContexto();
            IQueryable query = db.Usuario;
            return query;
        }

        public static IEnumerable<Usuario> listaUsuarios()
        {
            IEnumerable<Usuario> lista = (IEnumerable<Usuario>)
                UsuarioLN.queryListaUsuario();
            return lista;
        }
        public static Usuario obtenerUsuario(string id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            Usuario Usuario = db.Usuario.
                    Where(p => p.Id_Usuario == id).
                    First<Usuario>();
            return Usuario;
        }

        public static IEnumerable<Usuario> ListaUsuarioAdmiCentro()
        {

            IEnumerable<Usuario> lista = ((IEnumerable<Usuario>)
                UsuarioLN.queryListaUsuario()).Where(p => p.Id_Rol == 2);

            return lista;
        }

        public static IEnumerable<Usuario> listaAdministradores()
        {
          
            IEnumerable<Usuario> listaAdmi = ListaUsuarioAdmiCentro();
            IEnumerable<Usuario> listausuariosCentro = CentroAcopioLN.ObtenerUsuarios();
            List<Usuario> lista2 = (List<Usuario>)listaAdmi;

            foreach (Usuario usuario in listaAdmi)
            {
                foreach (Usuario usuarioCentro in listausuariosCentro)
                {
                    if(usuario.Id_Usuario== usuarioCentro.Id_Usuario)
                    {
                        lista2.Remove(usuario);
                    }
                }
            }



            return lista2;

        }


    }
}
