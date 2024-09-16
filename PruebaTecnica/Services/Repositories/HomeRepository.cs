using Microsoft.EntityFrameworkCore;
using PruebaTecnica.Data;
using PruebaTecnica.Interfaces;
using PruebaTecnica.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PruebaTecnica.Repositories
{
    public class HomeRepository : IHomeRepository
    {
        private readonly BaseContext _context;

        public HomeRepository(BaseContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Sede>> GetSedesAsync()
        {
            return await _context.Sedes.ToListAsync();
        }
    }
}