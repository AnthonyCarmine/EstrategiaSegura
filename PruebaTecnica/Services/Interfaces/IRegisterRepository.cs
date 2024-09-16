using System.Threading.Tasks;
using PruebaTecnica.Models;

namespace PruebaTecnica.Interfaces
{
    public interface IRegisterRepository
    {
        Task<Usuario> RegisterUserAsync(Usuario usuario);
    }
}