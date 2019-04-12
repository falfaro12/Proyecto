using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class BilleteraLN
    {
        public static bool AgregarBilletera(string id, int Total_Canjeadas, int Total_Disponible)
        {

            EcomonedasContexto db = new EcomonedasContexto();
            var miBilletera = new Billetera();
            miBilletera = db.Billetera.Where(u => u.Id_Billetera == id).FirstOrDefault<Billetera>();


            if (miBilletera == null)
            {
                //Creacion de la billetera
            miBilletera.Id_Billetera = id;
            miBilletera.Total_Disponible = 0;
            miBilletera.Total_Generada = 0;
            miBilletera.Total_Canjeadas = 0;

            db.Billetera.Add(miBilletera);       
          
            // Confirmacion
            return true;
            }else
            {
                miBilletera.Total_Canjeadas += Total_Canjeadas;
                // yo canjeo 
                miBilletera.Total_Disponible += Total_Disponible; 
                //suma
                miBilletera.Total_Generada = miBilletera.Total_Canjeadas + miBilletera.Total_Disponible;

            }

            db.SaveChanges();

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
