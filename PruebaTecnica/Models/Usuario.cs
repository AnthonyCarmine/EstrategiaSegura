using System.ComponentModel.DataAnnotations;

namespace PruebaTecnica.Models
{
    public class Usuario
{
    public int UsuarioID { get; set; }
    
    [Required]
    public string NroDocumento { get; set; }
    
    [Required]
    public string NombreCompleto { get; set; }
    
    [Required]
    public DateTime FechaNacimiento { get; set; }
    
    public string Celular { get; set; }
    
    [Required]
    public string Email { get; set; }
    
    public string Departamento { get; set; }
    
    [Required]
    public string Municipio { get; set; }
    
    [Required]
    public string Barrio { get; set; }
    
    [Required]
    public string DireccionResidencia { get; set; }
    
    public string TelefonoResidencia { get; set; }
    
    [Required]
    public string PreguntaSecreta { get; set; }
    
    [Required]
    public string RespuestaSecreta { get; set; }
    
    [Required]
    public int Clave { get; set; }
}

}


