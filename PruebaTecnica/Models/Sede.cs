using System.ComponentModel.DataAnnotations;

namespace PruebaTecnica.Models
{
    public class Sede
{
    public int SedeID { get; set; }
    
    [Required]
    public string NombreSede { get; set; }
    
    [Required]
    public string Descripcion { get; set; }
    
    [Required]
    public string Tipo { get; set; }
    
    [Required]
    public string Ubicacion { get; set; }
    
    [Required]
    public int CapacidadTotal { get; set; }
}
}

