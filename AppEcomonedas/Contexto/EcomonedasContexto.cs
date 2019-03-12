namespace Contexto
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class EcomonedasContexto : DbContext
    {
        public EcomonedasContexto()
            : base("name=EcomonedasContexto")
        {
        }

        public virtual DbSet<Billetera> Billetera { get; set; }
        public virtual DbSet<CentroAcopio> CentroAcopio { get; set; }
        public virtual DbSet<Cupon> Cupon { get; set; }
        public virtual DbSet<Detall_Factura> Detall_Factura { get; set; }
        public virtual DbSet<Enca_Factura> Enca_Factura { get; set; }
        public virtual DbSet<Material> Material { get; set; }
        public virtual DbSet<Provincia> Provincia { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CentroAcopio>()
                .Property(e => e.nombre)
                .IsUnicode(false);

            modelBuilder.Entity<CentroAcopio>()
                .Property(e => e.direccionExacta)
                .IsUnicode(false);

            modelBuilder.Entity<CentroAcopio>()
                .Property(e => e.Id_Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Cupon>()
                .Property(e => e.nombre)
                .IsUnicode(false);

            modelBuilder.Entity<Cupon>()
                .Property(e => e.descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Cupon>()
                .HasMany(e => e.Usuario)
                .WithMany(e => e.Cupon)
                .Map(m => m.ToTable("Cupon_Usuario").MapLeftKey("Id_Cupon").MapRightKey("Id_Usuario"));

            modelBuilder.Entity<Enca_Factura>()
                .Property(e => e.Id_Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Material>()
                .Property(e => e.nombre)
                .IsUnicode(false);

            modelBuilder.Entity<Material>()
                .Property(e => e.descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Provincia>()
                .Property(e => e.descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Rol>()
                .Property(e => e.descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Id_Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Apellido1)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Apellido2)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Direccion)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.telefono)
                .IsUnicode(false);
        }
    }
}
