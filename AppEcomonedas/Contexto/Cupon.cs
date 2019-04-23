namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Cupon")]
    public partial class Cupon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cupon()
        {
            Cupon_Usuario = new HashSet<Cupon_Usuario>();
        }

        [Key]
        public int Id_Cupon { get; set; }

        [StringLength(50)]
        public string nombre { get; set; }

        [StringLength(50)]
        public string descripcion { get; set; }

        public int? Precio_Canje { get; set; }

        public string imagen { get; set; }

        public bool? activo { get; set; }
        public string Estado
        {
            get
            {
                if (this.activo == true)
                {
                    return "Activo";
                }
                else
                {
                    return "Desactivo";
                }
            }
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cupon_Usuario> Cupon_Usuario { get; set; }
    }
}
