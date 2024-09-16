using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using PruebaTecnica.Data;
using PruebaTecnica.Interfaces;
using PruebaTecnica.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PruebaTecnica.Repositories
{
    public class ReservaRepository : IReservaRepository
    {
        private readonly BaseContext _context;

        public ReservaRepository(BaseContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Habitacion>> GetHabitacionesBySedeIdAsync(int sedeId)
        {
            return await _context.Habitaciones
                                 .Where(h => h.SedeID == sedeId)
                                 .ToListAsync();
        }

        public async Task<Habitacion> GetHabitacionByIdAsync(int habitacionId)
        {
            return await _context.Habitaciones
                                 .FirstOrDefaultAsync(h => h.HabitacionID == habitacionId);
        }

        public async Task<IEnumerable<Habitacion>> GetHabitacionesDisponiblesAsync(DateTime fechaInicio, DateTime fechaFin)
        {
            var fechaInicioParam = new SqlParameter("@FechaInicio", fechaInicio);
            var fechaFinParam = new SqlParameter("@FechaFin", fechaFin);

            return await _context.Habitaciones
                                 .FromSqlRaw("EXEC sp_ConsultarHabitacionesPorFechas @FechaInicio, @FechaFin", fechaInicioParam, fechaFinParam)
                                 .ToListAsync();
        }

        public async Task<IEnumerable<Habitacion>> GetHabitacionesDisponiblesPorPersonasAsync(DateTime fechaInicio, DateTime fechaFin, int numeroPersonas)
        {
            var fechaInicioParam = new SqlParameter("@FechaInicio", fechaInicio);
            var fechaFinParam = new SqlParameter("@FechaFin", fechaFin);
            var numeroPersonasParam = new SqlParameter("@CantidadPersonas", numeroPersonas);

            return await _context.Habitaciones
                                 .FromSqlRaw("EXEC sp_ConsultarHabitacionesPorFechasYPersonas @FechaInicio, @FechaFin, @CantidadPersonas", fechaInicioParam, fechaFinParam, numeroPersonasParam)
                                 .ToListAsync();
        }

        public async Task<CostoTotalResult> ObtenerCostoTotalHabitacionesDisponiblesPorPersonasAsync(DateTime fechaInicio, DateTime fechaFin, int numeroPersonas, int habitacionId)
        {
            var fechaInicioParam = new SqlParameter("@FechaInicio", fechaInicio);
            var fechaFinParam = new SqlParameter("@FechaFin", fechaFin);
            var numeroPersonasParam = new SqlParameter("@CantidadPersonas", numeroPersonas);
            var habitacionIdParam = new SqlParameter("@HabitacionID", habitacionId);

            var result = await _context.Set<CostoTotalResult>()
                .FromSqlRaw("EXEC sp_ConsultarHabitacionesYCalcularCosto @FechaInicio, @FechaFin, @CantidadPersonas, @HabitacionID", 
                            fechaInicioParam, fechaFinParam, numeroPersonasParam, habitacionIdParam)
                .FirstOrDefaultAsync();

            return result ?? new CostoTotalResult { CostoTotal = 0, DiasOrdinarios = 0, DiasEspeciales = 0 };
        }
    }
}