using System.ComponentModel.DataAnnotations;

namespace PruebaTecnica.Models
{
    public class Apartamento
{
    public int ApartamentoID { get; set; }
    
    public int SedeID { get; set; }
    
    [Required]
    public string NombreApartamento { get; set; }
    
    public string Descripcion { get; set; }
    
    [Required]
    public int CapacidadMaxima { get; set; }
    
}
}

