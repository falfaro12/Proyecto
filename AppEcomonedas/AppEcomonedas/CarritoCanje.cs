using Contexto.LN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto
{
  public  class CarritoCanje
    {
        public int Id_Cliente { get; set; }
        public int Id_CentroAcopio { get; set; }

        public int Id_Material { get; set; }

        public int cantidad { get; set; }

        public int precioMaterial
        {
            get { return Convert.ToInt32(material.Precio_Material); }

        }

        public virtual Material material { get; set; }


        public decimal subTotal
        {
            get
            {
                return calculoSubtotal();
            }
        }

        private decimal calculoSubtotal()
        {
            return precioMaterial * cantidad;
        }

        public CarritoCanje()
        {

        }
        public CarritoCanje(int idMaterial)
        {
            this.Id_Material = idMaterial;
            this.material = new Material();
            material = MaterialLN.obtenerMaterial(idMaterial);
        }
    }
}
