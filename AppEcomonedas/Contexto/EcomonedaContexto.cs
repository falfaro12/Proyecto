namespace Contexto
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class EcomonedaContexto : DbContext
    {
        public EcomonedaContexto()
            : base("name=EcomonedaContexto")
        {
        }

        public virtual DbSet<Billetera> Billetera { get; set; }
        public virtual DbSet<CentroAcopio> CentroAcopio { get; set; }
        public virtual DbSet<Provincia> Provincia { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
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

            modelBuilder.Entity<Usuario>()
                .Property(e => e.contrasenna)
                .IsUnicode(false);
        }
    }
}
