using Microsoft.AspNetCore.Mvc;
using PruebaTecnica.Interfaces;
using System.Threading.Tasks;

namespace PruebaTecnica.Controllers
{
    public class HomeController : Controller
    {
        private readonly IHomeRepository _homeRepository;

        public HomeController(IHomeRepository homeRepository)
        {
            _homeRepository = homeRepository;
        }

        public async Task<IActionResult> Index()
        {
            var sedes = await _homeRepository.GetSedesAsync();
            return View(sedes);
        }

        public IActionResult Fechas()
        {
            return View();
        }

        public IActionResult Reservas()
        {
            return View();
        }
    }
}