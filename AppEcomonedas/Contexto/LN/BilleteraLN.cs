using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class BilleteraLN
    {
        public static bool AgregarBilletera(string id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            var miBilletera = new Billetera();

            //Creacion de la billetera
            miBilletera.Id_Billetera = id;
            miBilletera.Total_Disponible = 0;
            miBilletera.Total_Generada = 0;
            miBilletera.Total_Canjeadas = 0;

            db.Billetera.Add(miBilletera);
            db.SaveChanges();

            // Confirmacion
            return true;
        }

        public static Billetera obtenerBilletera(string id)
        {
            EcomonedasContexto db = new EcomonedasContexto();
            Billetera billetera = db.Billetera.
                    Where(p => p.Id_Billetera == id).
                    First<Billetera>();
            return billetera;
        }
    }
}
