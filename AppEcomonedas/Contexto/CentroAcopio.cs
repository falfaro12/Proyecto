namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CentroAcopio")]
    public partial class CentroAcopio
    {
        [Key]
        public int Id_Centro { get; set; }

        [StringLength(100)]
        public string nombre { get; set; }

        [StringLength(100)]
        public string direccionExacta { get; set; }

        [StringLength(50)]
        public string Id_Usuario { get; set; }

        public int? Id_Provincia { get; set; }

        public bool? activo { get; set; }

        public virtual Provincia Provincia { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
