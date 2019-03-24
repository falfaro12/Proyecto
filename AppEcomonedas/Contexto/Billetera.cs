namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Billetera")]
    public partial class Billetera
    {
        [Key]
        [StringLength(50)]
        public string Id_Billetera { get; set; }

        public decimal? Total_Disponible { get; set; }

        public decimal? Total_Canjeadas { get; set; }

        public decimal? Total_Generada { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
