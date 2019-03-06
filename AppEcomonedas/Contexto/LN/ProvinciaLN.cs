using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class ProvinciaLN
    {
        public static IQueryable queryListaProvincias()
        {
            var db = new EcomonedasContexto();
            IQueryable query = db.Provincia;
            return query;
        }

        public static IEnumerable<Provincia> listaCategorias()
        {
            IEnumerable<Provincia> lista = (IEnumerable<Provincia>)
                ProvinciaLN.queryListaProvincias();
            return lista;
        }
        public static Provincia obtenerProvincia(int id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            Provincia cat = db.Provincia.
                    Where(p => p.Id_Provincia == id).
                    First<Provincia>();
            return cat;
        }
    }
}
