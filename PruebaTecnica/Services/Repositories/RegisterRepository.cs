using Microsoft.EntityFrameworkCore;
using PruebaTecnica.Data;
using PruebaTecnica.Interfaces;
using PruebaTecnica.Models;
using System.Threading.Tasks;

namespace PruebaTecnica.Repositories
{
    public class RegisterRepository : IRegisterRepository
    {
        private readonly BaseContext _baseContext;

        public RegisterRepository(BaseContext baseContext)
        {
            _baseContext = baseContext;
        }

        public async Task<Usuario> RegisterUserAsync(Usuario usuario)
        {
            _baseContext.Usuarios.Add(usuario);
            await _baseContext.SaveChangesAsync();
            return usuario;
        }
    }
}