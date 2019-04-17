using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
   public class Cupon_UsuarioLN
    {
        public static bool registrarCupon_Usuario(
             string idCliente, int id_Cupon, bool estado
                )
        {
            EcomonedasContexto db = new EcomonedasContexto();

            Cupon_Usuario micupon_usuario = new Cupon_Usuario();
            micupon_usuario.Fecha = DateTime.Now;
            micupon_usuario.estado = estado;
            micupon_usuario.Id_Cupon = id_Cupon;
            micupon_usuario.Id_Usuario = idCliente;

            //Agregar orden a la BD
            db.Cupon_Usuario.Add(micupon_usuario);
            db.SaveChanges();


            return true;
        }

        public static IQueryable queryCupon_Usuario()
        {
            var db = new EcomonedasContexto();
            IQueryable query = db.Cupon_Usuario;
            return query;
        }
        public static IEnumerable<Cupon_Usuario> listaCupon_UsuarioporUsuario(string id_Usuario)
        {
            IEnumerable<Cupon_Usuario> lista = ((IEnumerable<Cupon_Usuario>)queryCupon_Usuario()).Where(p => p.Id_Usuario == id_Usuario);
            return lista;
        }
    }
}
