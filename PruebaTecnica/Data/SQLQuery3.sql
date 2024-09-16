--query de la base de datos
-- Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
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
    Clave INT NOT NULL
);


-- Tabla de Sedes
CREATE TABLE Sedes (
    SedeID INT PRIMARY KEY IDENTITY(1,1),
    NombreSede VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Ubicacion VARCHAR(100) NOT NULL
);


-- Tabla de Apartamentos
CREATE TABLE Apartamentos (
    ApartamentoID INT PRIMARY KEY IDENTITY(1,1),
    SedeID INT,
    NombreApartamento VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(500),
    CapacidadMaxima INT NOT NULL,
    FOREIGN KEY (SedeID) REFERENCES Sedes(SedeID)
);


-- Tabla de Habitaciones
CREATE TABLE Habitaciones (
    HabitacionID INT PRIMARY KEY IDENTITY(1,1),
    SedeID INT,
    NombreHabitacion VARCHAR(100) NOT NULL,
    CapacidadMaxima INT NOT NULL,
    Descripcion VARCHAR(500),
    TarifaDiaOrdinario DECIMAL(10, 2) NOT NULL,
    TarifaDiaEspecial DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SedeID) REFERENCES Sedes(SedeID)
);


-- Tabla de Disponibilidad
CREATE TABLE Disponibilidad (
    DisponibilidadID INT PRIMARY KEY IDENTITY(1,1),
    HabitacionID INT,
    Fecha DATE NOT NULL,
    Disponible BIT NOT NULL,
    FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID)
);


-- Tabla de Reservas
CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY IDENTITY(1,1),
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

-- Tabla de Temporadas
CREATE TABLE Temporadas (
    TemporadaID INT PRIMARY KEY IDENTITY(1,1),
    NombreTemporada VARCHAR(50) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL
);

-- Tabla de Tarifas
CREATE TABLE Tarifas (
    TarifaID INT PRIMARY KEY IDENTITY(1,1),
    HabitacionID INT,
    TemporadaID INT,
    NumeroPersonas INT NOT NULL,
    TarifaValue DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID),
    FOREIGN KEY (TemporadaID) REFERENCES Temporadas(TemporadaID)
);




-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (NroDocumento, NombreCompleto, FechaNacimiento, Celular, Email, Departamento, Municipio, Barrio, DireccionResidencia, TelefonoResidencia, PreguntaSecreta, RespuestaSecreta, Clave)
VALUES 
('123456789', 'Juan Perez', '1980-01-01', '3001234567', 'juan.perez@example.com', 'Cundinamarca', 'Bogot�', 'Chapinero', 'Calle 123 #45-67', '1234567', 'Nombre de tu primera mascota', 'Firulais', 1234),
('987654321', 'Maria Gomez', '1990-02-02', '3109876543', 'maria.gomez@example.com', 'Antioquia', 'Medell�n', 'El Poblado', 'Carrera 45 #67-89', '7654321', 'Ciudad de nacimiento', 'Medell�n', 1234);

-- Insertar datos en la tabla Sedes
INSERT INTO Sedes (NombreSede, Descripcion, Tipo, Ubicacion)
VALUES 
('Villeta', 'Sede recreativa en Villeta', 'Recreativa', 'Villeta, Cundinamarca'),
('El Placer', 'Sede recreativa en Fusagasug�', 'Recreativa', 'Fusagasug�, Cundinamarca'),
('Gonzalo Morante', 'Sede recreativa en Chinchin�', 'Recreativa', 'Chinchin�, Caldas'),
('Tablones', 'Sede recreativa en Palmira', 'Recreativa', 'Palmira, Valle del Cauca'),
('Manguruma', 'Sede recreativa en Santa Fe de Antioquia', 'Recreativa', 'Santa Fe de Antioquia, Antioquia'),
('Federman', 'Sede recreativa en Bogot�', 'Recreativa', 'Bogot�, Cundinamarca');

-- Insertar datos en la tabla Apartamentos
INSERT INTO Apartamentos (SedeID, NombreApartamento, Descripcion, CapacidadMaxima)
VALUES 
(1, 'Apartamento 202', 'Sala comedor, cocina, 2 ba�os, tres habitaciones y un sitio para parqueo', 8),
(1, 'Apartamento 301', 'Sala comedor, cocina, 1 ba�o, dos habitaciones y un sitio para parqueo', 6),
(1, 'Apartamento 401', 'Sala comedor, cocina, 1 ba�o, dos habitaciones y un sitio para parqueo', 6);

-- Insertar datos en la tabla Habitaciones
INSERT INTO Habitaciones (SedeID, NombreHabitacion, CapacidadMaxima, Descripcion, TarifaDiaOrdinario, TarifaDiaEspecial)
VALUES 
(1, 'Habitaci�n 1', 4, 'Una cama doble y un camarote, ba�o, nevera, televisor y terraza cubierta', 70000, 90000),
(2, 'Habitaci�n 1', 3, 'Dos habitaciones, ba�o y Televisor, una con cama doble y una sencilla, la otra con una cama sencilla', 70000, 90000),
(2, 'Habitaci�n 2', 6, 'Dos habitaciones, ba�o y Televisor, una con cama doble, la otra con 4 camas sencillas', 70000, 90000),
(2, 'Habitaci�n 3', 4, 'Una habitaci�n con cama doble y 2 camas sencillas, ba�o y Televisor', 70000, 90000),
(2, 'Habitaci�n 4', 3, 'Dos habitaciones, ba�o y Televisor, una con cama doble y una sencilla, la otra con una cama sencilla', 70000, 90000),
(3, 'Habitaci�n 1', 4, 'Cocineta, ba�o, Televisor y 2 habitaciones. La 1 con dos camas sencillas, mas dos adicionales. La 2 con una cama doble y una sencilla', 70000, 90000),
(3, 'Habitaci�n 2', 6, 'Cocineta, ba�o, Televisor y 2 habitaciones. La 1 con una cama doble, mas una auxiliar doble. La 2 con dos camas sencillas, mas dos auxiliares', 70000, 90000),
(3, 'Habitaci�n 4', 3, 'Cocineta, ba�o, Televisor y una habitaci�n con cama doble y una cama sencilla', 70000, 90000),
(4, 'Habitaci�n 1', 4, 'Una habitaci�n, con cama doble y un camarote. Televisor, ba�o, cocineta con nevera, comedor', 70000, 90000),
(4, 'Habitaci�n 2', 4, 'Una habitaci�n, con cama doble y un camarote. Televisor, ba�o y cocineta con nevera, comedor', 70000, 90000),
(4, 'Habitaci�n 3', 6, 'Dos habitaciones. La habitaci�n 1 con cama doble y un camarote. La habitaci�n 2 con dos camarotes. Sala de estar con Televisor, ba�o y cocineta', 70000, 90000),
(4, 'Habitaci�n 4', 6, 'Dos habitaciones. La habitaci�n 1 con cama doble y un camarote. La habitaci�n 2 con dos camarotes. Sala de estar con Televisor, ba�o y cocineta', 70000, 90000),
(5, 'Habitaci�n 1', 4, 'Una cama doble y un camarote. Ba�o y terraza. Televisor', 70000, 90000),
(5, 'Habitaci�n 2', 5, 'Una cama doble, un camarote y un sof�- cama. Ba�o y terraza. Televisor', 70000, 90000),
(5, 'Habitaci�n 3', 5, 'Una cama doble, un camarote y un sof�- cama. Ba�o y terraza. Televisor', 70000, 90000),
(6, 'Habitaci�n 1', 4, 'Una alcoba con cama doble y un camarote, ba�o, nevera, televisor y terraza cubierta', 70000, 90000);

-- Insertar datos en la tabla Disponibilidad
INSERT INTO Disponibilidad (HabitacionID, Fecha, Disponible)
VALUES 
(1, '2023-12-01', 1),
(1, '2023-12-02', 1),
(2, '2023-12-01', 1),
(2, '2023-12-02', 1),
(3, '2023-12-01', 1),
(3, '2023-12-02', 1),
(4, '2023-12-01', 1),
(4, '2023-12-02', 1),
(5, '2023-12-01', 1),
(5, '2023-12-02', 1),
(6, '2023-12-01', 1),
(6, '2023-12-02', 1),
(7, '2023-12-01', 1),
(7, '2023-12-02', 1),
(8, '2023-12-01', 1),
(8, '2023-12-02', 1),
(9, '2023-12-01', 1),
(9, '2023-12-02', 1),
(10, '2023-12-01', 1),
(10, '2023-12-02', 1),
(11, '2023-12-01', 1),
(11, '2023-12-02', 1),
(12, '2023-12-01', 1),
(12, '2023-12-02', 1),
(13, '2023-12-01', 1),
(13, '2023-12-02', 1),
(14, '2023-12-01', 1),
(14, '2023-12-02', 1),
(15, '2023-12-01', 1),
(15, '2023-12-02', 1),
(16, '2023-12-01', 1),
(16, '2023-12-02', 1);

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (UsuarioID, HabitacionID, FechaReserva, FechaInicio, FechaFin, NumeroPersonas, NumeroHabitaciones, ValorTotal, ComprobantePago)
VALUES 
(1, 1, '2023-11-01', '2023-12-01', '2023-12-05', 4, 1, 280000, 'comprobante1.jpg'),
(2, 2, '2023-11-02', '2023-12-02', '2023-12-06', 3, 1, 270000, 'comprobante2.jpg');


-- Insertar datos en la tabla Temporadas
INSERT INTO Temporadas (NombreTemporada, FechaInicio, FechaFin)
VALUES 
('Baja Temporada', '2023-01-01', '2023-06-30'),
('Alta Temporada', '2023-07-01', '2023-12-31');


-- Insertar datos en la tabla Tarifas
INSERT INTO Tarifas (HabitacionID, TemporadaID, NumeroPersonas, TarifaValue)
VALUES 
(1, 1, 4, 70000),
(2, 1, 3, 70000),
(3, 1, 6, 70000),
(4, 1, 4, 70000),
(5, 1, 3, 70000),
(6, 1, 4, 70000),
(7, 1, 6, 70000),
(8, 1, 3, 70000),
(9, 1, 4, 70000),
(10, 1, 4, 70000),
(11, 1, 6, 70000),
(12, 1, 6, 70000),
(13, 1, 4, 70000),
(14, 1, 5, 70000),
(15, 1, 5, 70000),
(16, 1, 4, 70000);


CREATE PROCEDURE sp_ConsultarHabitacionesPorFechas
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    -- Validar fechas
    IF @FechaInicio > @FechaFin
    BEGIN
        RAISERROR('La fecha de inicio no puede ser mayor que la fecha de fin.', 16, 1);
        RETURN;
    END

    SELECT h.*
    FROM Habitaciones h
    WHERE h.HabitacionID NOT IN (
        SELECT r.HabitacionID
        FROM Reservas r
        WHERE (@FechaInicio BETWEEN r.FechaInicio AND r.FechaFin)
        OR (@FechaFin BETWEEN r.FechaInicio AND r.FechaFin)
        OR (r.FechaInicio BETWEEN @FechaInicio AND @FechaFin)
        OR (r.FechaFin BETWEEN @FechaInicio AND @FechaFin)
    )
END;


CREATE PROCEDURE sp_ConsultarHabitacionesPorFechasYPersonas
    @FechaInicio DATE,
    @FechaFin DATE,
    @CantidadPersonas INT
AS
BEGIN
    -- Validar fechas
    IF @FechaInicio > @FechaFin
    BEGIN
        RAISERROR('La fecha de inicio no puede ser mayor que la fecha de fin.', 16, 1);
        RETURN;
    END

    SELECT h.*
    FROM Habitaciones h
    WHERE h.CapacidadMaxima >= @CantidadPersonas
    AND h.HabitacionID NOT IN (
        SELECT r.HabitacionID
        FROM Reservas r
        WHERE (@FechaInicio BETWEEN r.FechaInicio AND r.FechaFin)
        OR (@FechaFin BETWEEN r.FechaInicio AND r.FechaFin)
        OR (r.FechaInicio BETWEEN @FechaInicio AND @FechaFin)
        OR (r.FechaFin BETWEEN @FechaInicio AND @FechaFin)
    )
END;


CREATE TYPE dbo.HabitacionesTablaTipo AS TABLE
(
    HabitacionID INT
);


CREATE PROCEDURE sp_ConsultarHabitacionesYCalcularCosto
    @FechaInicio DATE,
    @FechaFin DATE,
    @CantidadPersonas INT,
    @CantidadHabitaciones INT OUTPUT, -- Variable para devolver la cantidad de habitaciones encontradas
    @CostoTotal DECIMAL(10, 2) OUTPUT -- Variable para devolver el costo total
AS
BEGIN
    -- Validar fechas
    IF @FechaInicio > @FechaFin
    BEGIN
        RAISERROR('La fecha de inicio no puede ser mayor que la fecha de fin.', 16, 1);
        RETURN;
    END

    -- Declarar variables locales
    DECLARE @Dias INT
    DECLARE @HabitacionesDisponibles TABLE (HabitacionID INT, Tarifa DECIMAL(10, 2))

    -- Calcular los d�as entre las fechas
    SET @Dias = DATEDIFF(DAY, @FechaInicio, @FechaFin) + 1

    -- Seleccionar habitaciones disponibles seg�n la capacidad y las fechas
    INSERT INTO @HabitacionesDisponibles (HabitacionID, Tarifa)
    SELECT h.HabitacionID, 
           CASE 
               WHEN t.NombreTemporada = 'Alta Temporada' THEN h.TarifaDiaEspecial 
               ELSE h.TarifaDiaOrdinario 
           END AS Tarifa
    FROM Habitaciones h
    JOIN Temporadas t
        ON @FechaInicio BETWEEN t.FechaInicio AND t.FechaFin
        OR @FechaFin BETWEEN t.FechaInicio AND t.FechaFin
    WHERE h.CapacidadMaxima >= @CantidadPersonas
    AND h.HabitacionID NOT IN (
        SELECT r.HabitacionID
        FROM Reservas r
        WHERE (@FechaInicio BETWEEN r.FechaInicio AND r.FechaFin)
        OR (@FechaFin BETWEEN r.FechaInicio AND r.FechaFin)
        OR (r.FechaInicio BETWEEN @FechaInicio AND @FechaFin)
        OR (r.FechaFin BETWEEN @FechaInicio AND @FechaFin)
    )

    -- Calcular el n�mero de habitaciones disponibles
    SET @CantidadHabitaciones = (SELECT COUNT(*) FROM @HabitacionesDisponibles)

    -- Si hay habitaciones disponibles, calcular el costo total
    IF @CantidadHabitaciones > 0
    BEGIN
        SELECT @CostoTotal = SUM(Tarifa) * @Dias
        FROM @HabitacionesDisponibles
    END
    ELSE
    BEGIN
        SET @CostoTotal = 0
    END
END;
