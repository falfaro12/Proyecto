using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class Enca_FacturaLN
    {
        public static IQueryable queryListaEnca_Factura()
        {
            var db = new EcomonedasContexto();
            IQueryable query = db.Enca_Factura;
            return query;
        }

        public static IEnumerable<Enca_Factura> listaEnca_Factura()
        {
            IEnumerable<Enca_Factura> lista = (IEnumerable<Enca_Factura>)queryListaEnca_Factura();               
            return lista;
        }
        public static IEnumerable<Enca_Factura> listaEnca_FacturaporCentro(int id)
        {
            IEnumerable<Enca_Factura> lista = ((IEnumerable<Enca_Factura>)queryListaEnca_Factura()).Where(p => p.Id_Centro == id);
            return lista;
        }



        public static Enca_Factura obtenerEnca_Factura(int id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            Enca_Factura enca = db.Enca_Factura.
                    Where(p => p.Id_Enca == id).
                    First<Enca_Factura>();
            return enca;
        }
    }
}
