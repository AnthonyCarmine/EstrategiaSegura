using System.ComponentModel.DataAnnotations;

namespace PruebaTecnica.Models
{
    public class Temporada
{
    public int TemporadaID { get; set; }
    
    [Required]
    public string NombreTemporada { get; set; }
    
    [Required]
    public DateTime FechaInicio { get; set; }
    
    [Required]
    public DateTime FechaFin { get; set; }
}
}

