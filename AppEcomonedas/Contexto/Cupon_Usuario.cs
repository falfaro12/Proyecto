namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Cupon_Usuario
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id_Cupon { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string Id_Usuario { get; set; }

        public DateTime? Fecha { get; set; }

    

        public bool? estado { get; set; }

        public virtual Cupon Cupon { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
