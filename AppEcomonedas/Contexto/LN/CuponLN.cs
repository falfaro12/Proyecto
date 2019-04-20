using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class CuponLN
    {
        public static bool agregarCupones(
            string nombre,
            string descripcion,
            string precio,
            string imagen, bool activo,
            string id = "" 
            )
        {
            EcomonedasContexto db = new EcomonedasContexto();
            var miCupon = new Cupon();
            int idCupon = 0;
            bool esNumero = int.TryParse(id, out idCupon);

            if(esNumero||idCupon > 0)
            {
                //Buscar
                miCupon = db.Cupon.Where(p => p.Id_Cupon == idCupon).First<Cupon>();
            }

            miCupon.nombre = nombre;
            miCupon.descripcion = descripcion;
            miCupon.activo = activo;
            if (imagen != "")
            {
                miCupon.imagen = imagen;
            }
            miCupon.Precio_Canje = Convert.ToInt32(precio);

            if(id.Equals("") || !esNumero)
            {//agrega
                db.Cupon.Add(miCupon);
            }

            db.SaveChanges();

            //Confirmacion
            return true;
        }


        public static IQueryable queryListaCupones()
        {
            var db = new EcomonedasContexto();
            IQueryable query = db.Cupon;
            return query;
        }

        public static IEnumerable<Cupon> listaCupones()
        {
            IEnumerable<Cupon> lista = ((IEnumerable<Cupon>)
                CuponLN.queryListaCupones()).Where(p => p.activo == true);
            return lista;
        }
        public static IEnumerable<Cupon> listaCuponesMantenimiento()
        {
            IEnumerable<Cupon> lista = ((IEnumerable<Cupon>)
                CuponLN.queryListaCupones());
            return lista;
        }
        public static Cupon obtenerCupon(int id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            Cupon cupon = db.Cupon.
                    Where(p => p.Id_Cupon == id).
                    First<Cupon>();
            return cupon;
        }
    }
}
