USE [master]
GO
/****** Object:  Database [BaseEstrategiaSeguraT]    Script Date: 16/09/2024 1:24:10 p. m. ******/
CREATE DATABASE [BaseEstrategiaSeguraT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseEstrategiaSeguraT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BaseEstrategiaSeguraT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaseEstrategiaSeguraT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BaseEstrategiaSeguraT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseEstrategiaSeguraT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET  MULTI_USER 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET QUERY_STORE = ON
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BaseEstrategiaSeguraT]
GO
/****** Object:  UserDefinedTableType [dbo].[HabitacionesTablaTipo]    Script Date: 16/09/2024 1:24:10 p. m. ******/
CREATE TYPE [dbo].[HabitacionesTablaTipo] AS TABLE(
	[HabitacionID] [int] NULL
)
GO
/****** Object:  Table [dbo].[Apartamentos]    Script Date: 16/09/2024 1:24:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartamentos](
	[ApartamentoID] [int] IDENTITY(1,1) NOT NULL,
	[SedeID] [int] NULL,
	[NombreApartamento] [varchar](100) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[CapacidadMaxima] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ApartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disponibilidad]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disponibilidad](
	[DisponibilidadID] [int] IDENTITY(1,1) NOT NULL,
	[HabitacionID] [int] NULL,
	[Fecha] [date] NOT NULL,
	[Disponible] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DisponibilidadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitaciones]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitaciones](
	[HabitacionID] [int] IDENTITY(1,1) NOT NULL,
	[SedeID] [int] NULL,
	[NombreHabitacion] [varchar](100) NOT NULL,
	[CapacidadMaxima] [int] NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[TarifaDiaOrdinario] [decimal](10, 2) NOT NULL,
	[TarifaDiaEspecial] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HabitacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[ReservaID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[HabitacionID] [int] NULL,
	[FechaReserva] [date] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[NumeroPersonas] [int] NOT NULL,
	[NumeroHabitaciones] [int] NOT NULL,
	[ValorTotal] [decimal](10, 2) NOT NULL,
	[ComprobantePago] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sedes]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sedes](
	[SedeID] [int] IDENTITY(1,1) NOT NULL,
	[NombreSede] [varchar](100) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Ubicacion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SedeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifas]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifas](
	[TarifaID] [int] IDENTITY(1,1) NOT NULL,
	[HabitacionID] [int] NULL,
	[TemporadaID] [int] NULL,
	[NumeroPersonas] [int] NOT NULL,
	[TarifaValue] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TarifaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temporadas]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temporadas](
	[TemporadaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreTemporada] [varchar](50) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TemporadaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[NroDocumento] [varchar](20) NOT NULL,
	[NombreCompleto] [varchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Celular] [varchar](20) NULL,
	[Email] [varchar](100) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[Barrio] [varchar](50) NOT NULL,
	[DireccionResidencia] [varchar](100) NOT NULL,
	[TelefonoResidencia] [varchar](20) NULL,
	[PreguntaSecreta] [varchar](100) NOT NULL,
	[RespuestaSecreta] [varchar](100) NOT NULL,
	[Clave] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apartamentos] ON 

INSERT [dbo].[Apartamentos] ([ApartamentoID], [SedeID], [NombreApartamento], [Descripcion], [CapacidadMaxima]) VALUES (1, 1, N'Apartamento 202', N'Sala comedor, cocina, 2 baños, tres habitaciones y un sitio para parqueo', 8)
INSERT [dbo].[Apartamentos] ([ApartamentoID], [SedeID], [NombreApartamento], [Descripcion], [CapacidadMaxima]) VALUES (2, 1, N'Apartamento 301', N'Sala comedor, cocina, 1 baño, dos habitaciones y un sitio para parqueo', 6)
INSERT [dbo].[Apartamentos] ([ApartamentoID], [SedeID], [NombreApartamento], [Descripcion], [CapacidadMaxima]) VALUES (3, 1, N'Apartamento 401', N'Sala comedor, cocina, 1 baño, dos habitaciones y un sitio para parqueo', 6)
SET IDENTITY_INSERT [dbo].[Apartamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[Disponibilidad] ON 

INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (1, 1, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (2, 1, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (3, 2, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (4, 2, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (5, 3, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (6, 3, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (7, 4, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (8, 4, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (9, 5, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (10, 5, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (11, 6, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (12, 6, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (13, 7, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (14, 7, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (15, 8, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (16, 8, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (17, 9, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (18, 9, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (19, 10, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (20, 10, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (21, 11, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (22, 11, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (23, 12, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (24, 12, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (25, 13, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (26, 13, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (27, 14, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (28, 14, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (29, 15, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (30, 15, CAST(N'2023-12-02' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (31, 16, CAST(N'2023-12-01' AS Date), 1)
INSERT [dbo].[Disponibilidad] ([DisponibilidadID], [HabitacionID], [Fecha], [Disponible]) VALUES (32, 16, CAST(N'2023-12-02' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Disponibilidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Habitaciones] ON 

INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (1, 1, N'Habitación 1', 4, N'Una cama doble y un camarote, baño, nevera, televisor y terraza cubierta', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (2, 2, N'Habitación 1', 3, N'Dos habitaciones, baño y Televisor, una con cama doble y una sencilla, la otra con una cama sencilla', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (3, 2, N'Habitación 2', 6, N'Dos habitaciones, baño y Televisor, una con cama doble, la otra con 4 camas sencillas', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (4, 2, N'Habitación 3', 4, N'Una habitación con cama doble y 2 camas sencillas, baño y Televisor', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (5, 2, N'Habitación 4', 3, N'Dos habitaciones, baño y Televisor, una con cama doble y una sencilla, la otra con una cama sencilla', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (6, 3, N'Habitación 1', 4, N'Cocineta, baño, Televisor y 2 habitaciones. La 1 con dos camas sencillas, mas dos adicionales. La 2 con una cama doble y una sencilla', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (7, 3, N'Habitación 2', 6, N'Cocineta, baño, Televisor y 2 habitaciones. La 1 con una cama doble, mas una auxiliar doble. La 2 con dos camas sencillas, mas dos auxiliares', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (8, 3, N'Habitación 4', 3, N'Cocineta, baño, Televisor y una habitación con cama doble y una cama sencilla', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (9, 4, N'Habitación 1', 4, N'Una habitación, con cama doble y un camarote. Televisor, baño, cocineta con nevera, comedor', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (10, 4, N'Habitación 2', 4, N'Una habitación, con cama doble y un camarote. Televisor, baño y cocineta con nevera, comedor', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (11, 4, N'Habitación 3', 6, N'Dos habitaciones. La habitación 1 con cama doble y un camarote. La habitación 2 con dos camarotes. Sala de estar con Televisor, baño y cocineta', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (12, 4, N'Habitación 4', 6, N'Dos habitaciones. La habitación 1 con cama doble y un camarote. La habitación 2 con dos camarotes. Sala de estar con Televisor, baño y cocineta', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (13, 5, N'Habitación 1', 4, N'Una cama doble y un camarote. Baño y terraza. Televisor', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (14, 5, N'Habitación 2', 5, N'Una cama doble, un camarote y un sofá- cama. Baño y terraza. Televisor', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (15, 5, N'Habitación 3', 5, N'Una cama doble, un camarote y un sofá- cama. Baño y terraza. Televisor', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Habitaciones] ([HabitacionID], [SedeID], [NombreHabitacion], [CapacidadMaxima], [Descripcion], [TarifaDiaOrdinario], [TarifaDiaEspecial]) VALUES (16, 6, N'Habitación 1', 4, N'Una alcoba con cama doble y un camarote, baño, nevera, televisor y terraza cubierta', CAST(70000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Habitaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservas] ON 

INSERT [dbo].[Reservas] ([ReservaID], [UsuarioID], [HabitacionID], [FechaReserva], [FechaInicio], [FechaFin], [NumeroPersonas], [NumeroHabitaciones], [ValorTotal], [ComprobantePago]) VALUES (1, 1, 1, CAST(N'2023-11-01' AS Date), CAST(N'2023-12-01' AS Date), CAST(N'2023-12-05' AS Date), 4, 1, CAST(280000.00 AS Decimal(10, 2)), N'comprobante1.jpg')
INSERT [dbo].[Reservas] ([ReservaID], [UsuarioID], [HabitacionID], [FechaReserva], [FechaInicio], [FechaFin], [NumeroPersonas], [NumeroHabitaciones], [ValorTotal], [ComprobantePago]) VALUES (2, 2, 2, CAST(N'2023-11-02' AS Date), CAST(N'2023-12-02' AS Date), CAST(N'2023-12-06' AS Date), 3, 1, CAST(270000.00 AS Decimal(10, 2)), N'comprobante2.jpg')
SET IDENTITY_INSERT [dbo].[Reservas] OFF
GO
SET IDENTITY_INSERT [dbo].[Sedes] ON 

INSERT [dbo].[Sedes] ([SedeID], [NombreSede], [Descripcion], [Tipo], [Ubicacion]) VALUES (1, N'Villeta', N'Sede recreativa en Villeta', N'Recreativa', N'Villeta, Cundinamarca')
INSERT [dbo].[Sedes] ([SedeID], [NombreSede], [Descripcion], [Tipo], [Ubicacion]) VALUES (2, N'El Placer', N'Sede recreativa en Fusagasugá', N'Recreativa', N'Fusagasugá, Cundinamarca')
INSERT [dbo].[Sedes] ([SedeID], [NombreSede], [Descripcion], [Tipo], [Ubicacion]) VALUES (3, N'Gonzalo Morante', N'Sede recreativa en Chinchiná', N'Recreativa', N'Chinchiná, Caldas')
INSERT [dbo].[Sedes] ([SedeID], [NombreSede], [Descripcion], [Tipo], [Ubicacion]) VALUES (4, N'Tablones', N'Sede recreativa en Palmira', N'Recreativa', N'Palmira, Valle del Cauca')
INSERT [dbo].[Sedes] ([SedeID], [NombreSede], [Descripcion], [Tipo], [Ubicacion]) VALUES (5, N'Manguruma', N'Sede recreativa en Santa Fe de Antioquia', N'Recreativa', N'Santa Fe de Antioquia, Antioquia')
INSERT [dbo].[Sedes] ([SedeID], [NombreSede], [Descripcion], [Tipo], [Ubicacion]) VALUES (6, N'Federman', N'Sede recreativa en Bogotá', N'Recreativa', N'Bogotá, Cundinamarca')
SET IDENTITY_INSERT [dbo].[Sedes] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarifas] ON 

INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (1, 1, 1, 4, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (2, 2, 1, 3, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (3, 3, 1, 6, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (4, 4, 1, 4, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (5, 5, 1, 3, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (6, 6, 1, 4, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (7, 7, 1, 6, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (8, 8, 1, 3, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (9, 9, 1, 4, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (10, 10, 1, 4, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (11, 11, 1, 6, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (12, 12, 1, 6, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (13, 13, 1, 4, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (14, 14, 1, 5, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (15, 15, 1, 5, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaID], [HabitacionID], [TemporadaID], [NumeroPersonas], [TarifaValue]) VALUES (16, 16, 1, 4, CAST(70000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Tarifas] OFF
GO
SET IDENTITY_INSERT [dbo].[Temporadas] ON 

INSERT [dbo].[Temporadas] ([TemporadaID], [NombreTemporada], [FechaInicio], [FechaFin]) VALUES (1, N'Baja Temporada', CAST(N'2023-01-01' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Temporadas] ([TemporadaID], [NombreTemporada], [FechaInicio], [FechaFin]) VALUES (2, N'Alta Temporada', CAST(N'2023-07-01' AS Date), CAST(N'2023-12-31' AS Date))
SET IDENTITY_INSERT [dbo].[Temporadas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioID], [NroDocumento], [NombreCompleto], [FechaNacimiento], [Celular], [Email], [Departamento], [Municipio], [Barrio], [DireccionResidencia], [TelefonoResidencia], [PreguntaSecreta], [RespuestaSecreta], [Clave]) VALUES (1, N'123456789', N'Juan Perez', CAST(N'1980-01-01' AS Date), N'3001234567', N'juan.perez@example.com', N'Cundinamarca', N'Bogotá', N'Chapinero', N'Calle 123 #45-67', N'1234567', N'Nombre de tu primera mascota', N'Firulais', 1234)
INSERT [dbo].[Usuarios] ([UsuarioID], [NroDocumento], [NombreCompleto], [FechaNacimiento], [Celular], [Email], [Departamento], [Municipio], [Barrio], [DireccionResidencia], [TelefonoResidencia], [PreguntaSecreta], [RespuestaSecreta], [Clave]) VALUES (2, N'987654321', N'Maria Gomez', CAST(N'1990-02-02' AS Date), N'3109876543', N'maria.gomez@example.com', N'Antioquia', N'Medellín', N'El Poblado', N'Carrera 45 #67-89', N'7654321', N'Ciudad de nacimiento', N'Medellín', 1234)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Apartamentos]  WITH CHECK ADD FOREIGN KEY([SedeID])
REFERENCES [dbo].[Sedes] ([SedeID])
GO
ALTER TABLE [dbo].[Disponibilidad]  WITH CHECK ADD FOREIGN KEY([HabitacionID])
REFERENCES [dbo].[Habitaciones] ([HabitacionID])
GO
ALTER TABLE [dbo].[Habitaciones]  WITH CHECK ADD FOREIGN KEY([SedeID])
REFERENCES [dbo].[Sedes] ([SedeID])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([HabitacionID])
REFERENCES [dbo].[Habitaciones] ([HabitacionID])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Tarifas]  WITH CHECK ADD FOREIGN KEY([HabitacionID])
REFERENCES [dbo].[Habitaciones] ([HabitacionID])
GO
ALTER TABLE [dbo].[Tarifas]  WITH CHECK ADD FOREIGN KEY([TemporadaID])
REFERENCES [dbo].[Temporadas] ([TemporadaID])
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarHabitacionesPorFechas]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarHabitacionesPorFechas]
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
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarHabitacionesPorFechasYPersonas]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarHabitacionesPorFechasYPersonas]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarHabitacionesYCalcularCosto]    Script Date: 16/09/2024 1:24:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarHabitacionesYCalcularCosto]
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

    -- Calcular los días entre las fechas
    SET @Dias = DATEDIFF(DAY, @FechaInicio, @FechaFin) + 1

    -- Seleccionar habitaciones disponibles según la capacidad y las fechas
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

    -- Calcular el número de habitaciones disponibles
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
GO
USE [master]
GO
ALTER DATABASE [BaseEstrategiaSeguraT] SET  READ_WRITE 
GO
