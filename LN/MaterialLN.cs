using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class MaterialLN
    {

        public static bool agregarMateriales(
            string nombre,
            string descripcion,
            string precio,
            string imagen,
            string color,
            string id = ""
            )
        {
            EcomonedasContexto db = new EcomonedasContexto();
            var miMaterial = new Material();
            int idMaterial = 0;
            bool esNumero = int.TryParse(id, out idMaterial);

            if (esNumero || idMaterial > 0)
            {
                //Buscar
                miMaterial = db.Material.Where(p => p.Id_Material == idMaterial).First<Material>();
            }

            miMaterial.nombre = nombre;
            miMaterial.descripcion = descripcion;
            miMaterial.imagen = imagen;
            miMaterial.color = color;
            miMaterial.Precio_Material = Convert.ToInt32(precio);
           

            if (id.Equals("") || !esNumero)
            {//agrega
                db.Material.Add(miMaterial);
            }

            db.SaveChanges();

            //Confirmacion
            return true;
        }

        public static IQueryable queryListaMateriales()
        {
            var db = new EcomonedasContexto();
            IQueryable query = db.Material;
            return query;
        }

        public static IEnumerable<Material> listaMateriales()
        {
            IEnumerable<Material> lista = (IEnumerable<Material>)
                MaterialLN.queryListaMateriales();
            return lista;
        }
        public static Material obtenerMaterial(int id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            Material Material = db.Material.
                    Where(p => p.Id_Material == id).
                    First<Material>();
            return Material;
        }
    }
}
