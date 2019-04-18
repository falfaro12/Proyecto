using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
   public class OrdenCompraLN
    {
        public static bool registrarOrden(
           string idCliente,int idCentro , List<CarritoCanjes> carritoItems
              )
        {
            EcomonedasContexto db = new EcomonedasContexto();
            //Orden
            var miOrden = new Enca_Factura();

            miOrden.Fecha =Convert.ToDateTime( DateTime.Now.ToShortDateString());
            miOrden.Id_Usuario = idCliente;
            miOrden.Id_Centro = idCentro;
            //Calcular total
            decimal calculoTotal = carritoItems.Sum(x => x.subTotal);
            miOrden.Total = calculoTotal;
           
            //Agregar orden a la BD
            db.Enca_Factura.Add(miOrden);
            db.SaveChanges();

            //Detalle orden
            for (int i = 0; i < carritoItems.Count; i++)
            {
                var miDetalle = new Detall_Factura();
                miDetalle.Id_Enca = miOrden.Id_Enca;
                miDetalle.Id_Material = carritoItems[i].Id_Material;
                miDetalle.Cantidad = carritoItems[i].cantidad;
                miDetalle.SubTotal = carritoItems[i].precioMaterial;
            
                //Agregar orden detalle a la BD
                db.Detall_Factura.Add(miDetalle);
                db.SaveChanges();
            }

            return true;
        }


    }
}
