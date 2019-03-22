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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CentroAcopio()
        {
            Enca_Factura = new HashSet<Enca_Factura>();
        }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Enca_Factura> Enca_Factura { get; set; }
    }
}
