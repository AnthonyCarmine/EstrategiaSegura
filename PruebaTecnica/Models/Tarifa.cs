using System.ComponentModel.DataAnnotations;

namespace PruebaTecnica.Models
{
    public class Tarifa
{
    public int TarifaID { get; set; }
    
    public int HabitacionID { get; set; }
    
    public int TemporadaID { get; set; }
    
    [Required]
    public int NumeroPersonas { get; set; }
    
    [Required]
    public decimal TarifaValue { get; set; }
    
}
}

