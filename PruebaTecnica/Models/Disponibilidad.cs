using System.ComponentModel.DataAnnotations;

namespace PruebaTecnica.Models
{
    public class Disponibilidad
{
    public int DisponibilidadID { get; set; }
    
    public int HabitacionID { get; set; }
    
    [Required]
    public DateTime Fecha { get; set; }
    
    [Required]
    public bool Disponible { get; set; }
    
}
}


