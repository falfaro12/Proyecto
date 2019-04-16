namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Usuario")]
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            CentroAcopio = new HashSet<CentroAcopio>();
            Enca_Factura = new HashSet<Enca_Factura>();
            Cupon = new HashSet<Cupon>();
        }

        [Key]
        [StringLength(50)]
        public string Id_Usuario { get; set; }

        [StringLength(50)]
        public string Nombre { get; set; }

        [StringLength(50)]
        public string Apellido1 { get; set; }

        [StringLength(50)]
        public string Apellido2 { get; set; }

        [StringLength(50)]
        public string Direccion { get; set; }

        [StringLength(9)]
        public string telefono { get; set; }

        public int? Id_Rol { get; set; }

        [StringLength(50)]
        public string contrasenna { get; set; }

        public virtual Billetera Billetera { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CentroAcopio> CentroAcopio { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Enca_Factura> Enca_Factura { get; set; }

        public virtual Rol Rol { get; set; }
        public string NombreCompleto {
            get{
                return Nombre + " " + Apellido1 + " " + Apellido2;
            }
            
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cupon> Cupon { get; set; }
    }
}
