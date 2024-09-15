using System.ComponentModel.DataAnnotations;

namespace PruebaTecnica.Models
{
    public class Reserva
{
    public int ReservaID { get; set; }
    
    public int UsuarioID { get; set; }
    
    public int HabitacionID { get; set; }
    
    [Required]
    public DateTime FechaReserva { get; set; }
    
    [Required]
    public DateTime FechaInicio { get; set; }
    
    [Required]
    public DateTime FechaFin { get; set; }
    
    [Required]
    public int NumeroPersonas { get; set; }
    
    [Required]
    public int NumeroHabitaciones { get; set; }
    
    [Required]
    public decimal ValorTotal { get; set; }
    
    public string ComprobantePago { get; set; }
    
}
}

