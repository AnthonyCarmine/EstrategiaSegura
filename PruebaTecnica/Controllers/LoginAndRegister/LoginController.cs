using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PruebaTecnica.Interfaces;
using PruebaTecnica.Models;
using System.Threading.Tasks;

namespace PruebaTecnica.Controllers
{
    public class LoginController : Controller
    {
        private readonly ILogger<LoginController> _logger;
        private readonly ILoginRepository _loginRepository;

        public LoginController(ILoginRepository loginRepository)
        {
            _loginRepository = loginRepository;
        }

        public IActionResult Login()
        {
            return View("~/Views/LoginAndRegister/Login.cshtml");
        }

        [HttpPost]
        public async Task<IActionResult> Login(string document, int password)
        {
            if (ModelState.IsValid)
            {
                var user = await _loginRepository.LoginUserAsync(document, password);
                if (user != null)
                {
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError(string.Empty, "Documento o clave incorrectos.");
            }
            return View("~/Views/LoginAndRegister/Login.cshtml");
        }
    }
}