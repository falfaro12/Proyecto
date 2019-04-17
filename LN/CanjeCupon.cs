using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto.LN
{
    public class CanjeCupon
    {
        public int id { get; set; }
        public string cliente { get; set; }
        public string nombreCupon { get; set; }

        public byte[] imagenQR { get; set; }
        
        public byte[] imagenCupon { get; set; }

        public CanjeCupon()
        {

        }
       
        
    }
}
