using Microsoft.AspNetCore.Mvc;
using PruebaTecnica.Interfaces;
using PruebaTecnica.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaTecnica.Controllers
{
    public class ReservaController : Controller
    {
        private readonly IReservaRepository _reservaRepository;

        public ReservaController(IReservaRepository reservaRepository)
        {
            _reservaRepository = reservaRepository;
        }

        public async Task<IActionResult> Index(int sedeId)
        {
            var habitaciones = await _reservaRepository.GetHabitacionesBySedeIdAsync(sedeId);
            ViewBag.SedeId = sedeId; // Pasar el ID de la sede a la vista
            return View(habitaciones);
        }

        [HttpGet]
        public async Task<IActionResult> GetHabitacionById(int habitacionId)
        {
            if (habitacionId <= 0) // Validar si el ID de la habitación es válido
            {
                return BadRequest("ID de habitación inválido.");
            }

            var habitacion = await _reservaRepository.GetHabitacionByIdAsync(habitacionId);
            if (habitacion == null)
            {
                return NotFound("No se encontró la habitación.");
            }

            // Devolver la vista parcial si se encontró la habitación
            return PartialView("_HabitacionDetails", habitacion);
        }

        [HttpGet]
        public async Task<IActionResult> GetDisponibilidadHabitacionPorSede(int sedeId, DateTime fechaInicio, DateTime fechaFin, int numeroPersonas)
        {
            var habitaciones = await _reservaRepository.GetHabitacionesBySedeIdAsync(sedeId);
            var habitacionesDisponibles = await _reservaRepository.GetHabitacionesDisponiblesPorPersonasAsync(fechaInicio, fechaFin, numeroPersonas);

            var resultado = habitaciones.Select(h => new
            {
                h.HabitacionID,
                h.NombreHabitacion,
                h.CapacidadMaxima,
                h.TarifaDiaOrdinario,
                h.TarifaDiaEspecial,
                Disponible = habitacionesDisponibles.Any(hd => hd.HabitacionID == h.HabitacionID) ? "Sí" : "No"
            });

            return Json(resultado);
        }

        [HttpGet]
        public async Task<IActionResult> ObtenerCostoTotalHabitacionesDisponiblesPorPersonas(DateTime fechaInicio, DateTime fechaFin, int numeroPersonas, int habitacionId)
        {
            var result = await _reservaRepository.ObtenerCostoTotalHabitacionesDisponiblesPorPersonasAsync(fechaInicio, fechaFin, numeroPersonas, habitacionId);
            return Json(result);
        }
    }
}