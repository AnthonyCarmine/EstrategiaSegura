using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using PruebaTecnica.Models;

namespace PruebaTecnica.Controllers.LoginAndRegister
{
    public class LoginController : Controller
    {
        private readonly ILogger<LoginController> _logger;

        public LoginController(ILogger<LoginController> logger)
        {
            _logger = logger;
        }

        public IActionResult Login()
        {
            return View("~/Views/LoginAndRegister/Login.cshtml");
        }

        public IActionResult Register()
        {
            return View("~/Views/LoginAndRegister/Register.cshtml");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}


