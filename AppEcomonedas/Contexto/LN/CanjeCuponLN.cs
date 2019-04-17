using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Net;
using System.Drawing.Imaging;
using System.Drawing;

namespace Contexto.LN
{
    public class CanjeCuponLN
    {
        public static byte[] ImagenByte(Image imagen)
        {
            string stemp = Path.GetTempFileName();
            FileStream fs = new FileStream(stemp, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            imagen.Save(fs, ImageFormat.Png);
            fs.Position = 0;

            int imagenLargo = Convert.ToInt32(fs.Length);
            byte[] bytes = new byte[imagenLargo];
            fs.Read(bytes, 0, imagenLargo);
            fs.Close();
            return bytes;
        }
        public static Image GeneraImagen(String ruta)
        {
            using (var wc = new WebClient())
            {
                using (var imagenSteam = new MemoryStream(wc.DownloadData("~/images/cupones/" + ruta)))
                {
                    using(var imagen = Image.FromStream(imagenSteam))
                    {
                        return imagen;
                    }
                }
            }
        }

        public static List<CanjeCupon> canjeCupon(CanjeCupon canjes)
        {
            List<CanjeCupon> canje = new List<CanjeCupon>();
            canje.Add(canjes);
            return canje;
        }
      
        }
}
