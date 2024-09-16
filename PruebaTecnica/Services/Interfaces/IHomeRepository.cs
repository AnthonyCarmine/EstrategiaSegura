using System.Collections.Generic;
using System.Threading.Tasks;
using PruebaTecnica.Models;

namespace PruebaTecnica.Interfaces
{
    public interface IHomeRepository
    {
        Task<IEnumerable<Sede>> GetSedesAsync();
    }
}