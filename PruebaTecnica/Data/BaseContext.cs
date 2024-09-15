using Microsoft.EntityFrameworkCore;
using PruebaTecnica.Models;

namespace PruebaTecnica.Data
{
    public class BaseContext : DbContext
    {
        public BaseContext(DbContextOptions<BaseContext> options) : base(options) { }

        public DbSet<Habitacion> Habitaciones { get; set; }
        public DbSet<Sede> Sedes { get; set; }
        public DbSet<Apartamento> Apartamentos { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Reserva> Reservas { get; set; }
        public DbSet<Temporada> Temporadas { get; set; }
        public DbSet<Tarifa> Tarifas { get; set; }
        public DbSet<Disponibilidad> Disponibilidades { get; set; }
    }
}