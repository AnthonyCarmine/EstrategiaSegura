using PruebaTecnica.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PruebaTecnica.Interfaces
{
    public interface IReservaRepository
    {
        Task<IEnumerable<Habitacion>> GetHabitacionesBySedeIdAsync(int sedeId);
        Task<Habitacion> GetHabitacionByIdAsync(int habitacionId);
        Task<IEnumerable<Habitacion>> GetHabitacionesDisponiblesAsync(DateTime fechaInicio, DateTime fechaFin);
        Task<IEnumerable<Habitacion>> GetHabitacionesDisponiblesPorPersonasAsync(DateTime fechaInicio, DateTime fechaFin, int numeroPersonas);
Task<CostoTotalResult> ObtenerCostoTotalHabitacionesDisponiblesPorPersonasAsync(DateTime fechaInicio, DateTime fechaFin, int numeroPersonas, int habitacionId);
    }
}