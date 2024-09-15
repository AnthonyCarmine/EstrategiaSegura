-- Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    NroDocumento VARCHAR(20) NOT NULL,
    NombreCompleto VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Celular VARCHAR(20),
    Email VARCHAR(100) NOT NULL,
    Departamento VARCHAR(50) NOT NULL,
    Municipio VARCHAR(50) NOT NULL,
    Barrio VARCHAR(50) NOT NULL,
    DireccionResidencia VARCHAR(100) NOT NULL,
    TelefonoResidencia VARCHAR(20),
    PreguntaSecreta VARCHAR(100) NOT NULL,
    RespuestaSecreta VARCHAR(100) NOT NULL,
    Clave VARCHAR(100) NOT NULL
);

-- Tabla de Sedes
CREATE TABLE Sedes (
    SedeID INT AUTO_INCREMENT PRIMARY KEY,
    NombreSede VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Ubicacion VARCHAR(100) NOT NULL,
    CapacidadTotal INT NOT NULL
);

-- Tabla de Habitaciones (combinada con disponibilidad)
CREATE TABLE Habitaciones (
    HabitacionID INT AUTO_INCREMENT PRIMARY KEY,
    SedeID INT,
    NombreHabitacion VARCHAR(100) NOT NULL,
    CapacidadMaxima INT NOT NULL,
    Descripcion VARCHAR(500),
    TarifaDiaOrdinario DECIMAL(10, 2) NOT NULL,
    TarifaDiaEspecial DECIMAL(10, 2) NOT NULL,
    FechaInicioDisponibilidad DATE NOT NULL,
    FechaFinDisponibilidad DATE NOT NULL,
    Disponible BOOLEAN NOT NULL,
    FOREIGN KEY (SedeID) REFERENCES Sedes(SedeID)
);

-- Tabla de Reservas
CREATE TABLE Reservas (
    ReservaID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    HabitacionID INT,
    FechaReserva DATE NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    NumeroPersonas INT NOT NULL,
    NumeroHabitaciones INT NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    ComprobantePago VARCHAR(255),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID)
);

-- Tabla de Tarifas
CREATE TABLE Tarifas (
    TarifaID INT AUTO_INCREMENT PRIMARY KEY,
    HabitacionID INT,
    Temporada VARCHAR(50) NOT NULL,
    NumeroPersonas INT NOT NULL,
    Tarifa DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID)
);