namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Detall_Factura
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id_detall { get; set; }

        public int? Id_Enca { get; set; }

        public int? Id_Material { get; set; }

        public int? Id_Cupon { get; set; }

        public int? Cantidad { get; set; }

        public decimal? SubTotal { get; set; }

        public virtual Enca_Factura Enca_Factura { get; set; }

        public virtual Material Material { get; set; }
    }
}
