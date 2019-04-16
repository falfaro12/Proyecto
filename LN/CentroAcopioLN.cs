using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
   public class CentroAcopioLN
    {

        public static bool AgregarCentroAcopio(
            string nombre,
            string direccion,
            string idUsr,
            string idProvincia,
            string id = ""
            )
        {
            EcomonedasContexto db = new EcomonedasContexto();
            var miCentro = new CentroAcopio();
            int idCentro = 0;
            bool esNumero = int.TryParse(id, out idCentro);

            if(esNumero || idCentro > 0)
            {
                // Busca centro en la DB
                miCentro = db.CentroAcopio.Where(p => p.Id_Centro == idCentro).First<CentroAcopio>();
            }
            //Creacion del centro
            miCentro.nombre = nombre;
            miCentro.Id_Provincia = Convert.ToInt32(idProvincia);
            miCentro.Id_Usuario = idUsr;
            miCentro.direccionExacta = direccion;
            
            if(id.Equals("")|| !esNumero)
            { //agrega
                db.CentroAcopio.Add(miCentro);
            }
            db.SaveChanges();

            // Confirmacion
            return true;
        }



        public static IQueryable queryListaCentroAcopio()
        {
            var db = new EcomonedasContexto();
            IQueryable query = db.CentroAcopio;
            return query;
        }

        public static IEnumerable<CentroAcopio> listaCentros()
        {
            IEnumerable<CentroAcopio> lista = (IEnumerable<CentroAcopio>)
                CentroAcopioLN.queryListaCentroAcopio();
            return lista;
        }


        public static CentroAcopio obtenerCentroAcopio(int id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            CentroAcopio centro = db.CentroAcopio.
                    Where(p => p.Id_Centro == id).
                    First<CentroAcopio>();
            return centro;
        }
        public static CentroAcopio obtenerUsuariodeCentroAcopio(string id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            CentroAcopio centro = db.CentroAcopio.
                    Where(p => p.Id_Usuario == id).
                    First<CentroAcopio>();
            return centro;
        }

        public static IEnumerable<Usuario> ObtenerUsuarios()
        {
            var db = new EcomonedasContexto();
            IQueryable query = queryListaCentroAcopio();
            IEnumerable<Usuario> lista;
            List<Usuario> lista2 = new List<Usuario>();

            foreach (CentroAcopio cen in query)
            {
                lista2.Add(cen.Usuario);
            }
            lista = (IEnumerable<Usuario>)lista2;

            return lista;
        }
    }
}
