using System.Threading.Tasks;
using PruebaTecnica.Models;

namespace PruebaTecnica.Interfaces
{
    public interface ILoginRepository
    {
        Task<Usuario> LoginUserAsync(string nroDocumento, int clave);
    }
}