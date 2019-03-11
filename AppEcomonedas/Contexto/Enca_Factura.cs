namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Enca_Factura
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Enca_Factura()
        {
            Detall_Factura = new HashSet<Detall_Factura>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id_Enca { get; set; }

        [StringLength(50)]
        public string Id_Usuario { get; set; }

        public int? Id_Centro { get; set; }

        public DateTime? Fecha { get; set; }

        public decimal? Total { get; set; }

        public virtual CentroAcopio CentroAcopio { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Detall_Factura> Detall_Factura { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
