using Microsoft.AspNetCore.Mvc;
using PruebaTecnica.Interfaces;
using PruebaTecnica.Models;
using System.Threading.Tasks;

namespace PruebaTecnica.Controllers
{
    public class RegisterController : Controller
    {
        private readonly IRegisterRepository _registerRepository;

        public RegisterController(IRegisterRepository registerRepository)
        {
            _registerRepository = registerRepository;
        }

        public IActionResult Register()
        {
            return View("~/Views/LoginAndRegister/Register.cshtml");
        }

        [HttpPost]
        public async Task<IActionResult> Register(Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                await _registerRepository.RegisterUserAsync(usuario);
                return RedirectToAction("Login", "Login");
            }
            return View("~/Views/LoginAndRegister/Register.cshtml", usuario);
        }
    }
}