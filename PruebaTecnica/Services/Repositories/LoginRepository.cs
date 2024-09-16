using Microsoft.EntityFrameworkCore;
using PruebaTecnica.Data;
using PruebaTecnica.Interfaces;
using PruebaTecnica.Models;
using System.Threading.Tasks;

namespace PruebaTecnica.Repositories
{
    public class LoginRepository : ILoginRepository
    {
        private readonly BaseContext _baseContext;

        public LoginRepository(BaseContext baseContext)
        {
            _baseContext = baseContext;
        }

        public async Task<Usuario> LoginUserAsync(string nroDocumento, int clave)
        {
            return await _baseContext.Usuarios
                .FirstOrDefaultAsync(u => u.NroDocumento == nroDocumento && u.Clave == clave);
        }
    }
}