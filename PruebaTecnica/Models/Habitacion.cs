using System.ComponentModel.DataAnnotations;

namespace PruebaTecnica.Models
{
    public class Habitacion
{
    public int HabitacionID { get; set; }
    
    public int SedeID { get; set; }
    
    [Required]
    public string NombreHabitacion { get; set; }
    
    [Required]
    public int CapacidadMaxima { get; set; }
    
    public string Descripcion { get; set; }
    
    [Required]
    public decimal TarifaDiaOrdinario { get; set; }
    
    [Required]
    public decimal TarifaDiaEspecial { get; set; }
    
}
}

