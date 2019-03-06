using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class RolLN
    {
        public static IQueryable queryListaRoles()
        {
            var db = new EcomonedasContexto();
            IQueryable query = db.Rol;
            return query;
        }

        public static IEnumerable<Rol> listaRoles()
        {
            IEnumerable<Rol> lista = (IEnumerable<Rol>)
                RolLN.queryListaRoles();
            return lista;
        }
        public static Rol obtenerRol(int id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            Rol rol = db.Rol.
                    Where(p => p.Id_Rol == id).
                    First<Rol>();
            return rol;
        }
    }
}
