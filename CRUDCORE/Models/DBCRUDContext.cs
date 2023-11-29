using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CRUDCORE.Models
{
    public partial class DBCRUDContext : DbContext
    {
        public DBCRUDContext()
        {
        }

        public DBCRUDContext(DbContextOptions<DBCRUDContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Cargo> Cargos { get; set; } = null!;
        public virtual DbSet<Empleado> Empleados { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cargo>(entity =>
            {
                entity.HasKey(e => e.IdCargo)
                    .HasName("PK__CARGO__6C9856258BBBF2E1");

                entity.ToTable("CARGO");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Empleado>(entity =>
            {
                entity.HasKey(e => e.IdEmpleado)
                    .HasName("PK__EMPLEADO__CE6D8B9ECA355833");

                entity.ToTable("EMPLEADO");

                entity.Property(e => e.Correo)
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.Property(e => e.NombreCompleto)
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono)
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.HasOne(d => d.oCargo)
                    .WithMany(p => p.Empleados)
                    .HasForeignKey(d => d.IdCargo)
                    .HasConstraintName("FK_Cargo");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
