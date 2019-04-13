using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appLibros.CarritosLN
{
    /**
* 
* Contiene los libros que están en el carrito y 
* proporciona métodos para su gestión.
*/
    public class Carrito
    {
        public List<CarritoCanje> Items { get; private set; }

        //Implementación Singleton

        // Las propiedades de solo lectura solo se pueden establecer en la inicialización o en un constructor
        public static readonly Carrito Instancia;

        // Se llama al constructor estático tan pronto como la clase se carga en la memoria
        static Carrito()
        {
            // Si el carrito no está en la sesión, cree uno y guarde los items.
            if (HttpContext.Current.Session["carrito"] == null)
            {
                Instancia = new Carrito();
                Instancia.Items = new List<CarritoCanje>();
                HttpContext.Current.Session["carrito"] = Instancia;
            }
            else
            {
                // De lo contrario, obténgalo de la sesión.
                Instancia = (Carrito)HttpContext.Current.Session["carrito"];
            }
        }

        // Un constructor protegido asegura que un objeto no se puede crear desde el exterior
        protected Carrito() { }

        /**
         * AgregarItem (): agrega un artículo a la compra
         */
        public void AgregarItem(int materialId, int cantidad)
        {
            // Crear un nuevo artículo para agregar al carrito
            CarritoCanje nuevoItem = new CarritoCanje(materialId);
            // Si este artículo ya existe en lista de libros, aumente la cantidad
            // De lo contrario, agregue el nuevo elemento a la lista

            if (Items.Exists(x => x.Id_Material == materialId))
            {
                CarritoCanje item = Items.Find(x => x.Id_Material == materialId);
                item.cantidad+= cantidad;
                return;
            }

            nuevoItem.cantidad = cantidad;
            Items.Add(nuevoItem);

        }

        /**
         * SetItemcantidad(): cambia la cantidad de un artículo en el carrito
         */
        public void SetItemcantidad(int libroId, int cantidad)
        {
            // Si estamos configurando la cantidad a 0, elimine el artículo por completo
            if (cantidad == 0)
            {
                EliminarItem(libroId);
                return;
            }

            // Encuentra el artículo y actualiza la cantidad
            CarritoCanje actualizarItem = new CarritoCanje(libroId);
            if (Items.Exists(x => x.Id_Material == libroId))
            {
                CarritoCanje item = Items.Find(x => x.Id_Material == libroId);
                item.cantidad = cantidad;
            
                return;
            }
           
        }

        /**
         * EliminarItem (): elimina un artículo del carrito de compras
         */
        public void EliminarItem(int materialId)
        {
            if (Items.Exists(x => x.Id_Material == materialId))
            {
                var itemEliminar = Items.Single(x => x.Id_Material == materialId);
                Items.Remove(itemEliminar);
            }

        }

        /**
         * GetTotal() - Devuelve el precio total de todos los libros.
         */
        public decimal GetTotal()
        {
            decimal total = 0;
            total = Items.Sum(x => x.subTotal);

            return total;
        }
        
        public void eliminarCarrito()
        {
            Items.Clear();

        }
    }
}