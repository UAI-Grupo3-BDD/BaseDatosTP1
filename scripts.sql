USE [master]
GO
/****** Object:  Database [BDTP1]    Script Date: 21/04/2024 18:10:31 ******/
CREATE DATABASE [BDTP1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDTP1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDTP1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDTP1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDTP1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDTP1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDTP1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDTP1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDTP1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDTP1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDTP1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDTP1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDTP1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDTP1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDTP1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDTP1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDTP1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDTP1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDTP1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDTP1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDTP1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDTP1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDTP1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDTP1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDTP1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDTP1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDTP1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDTP1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDTP1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDTP1] SET RECOVERY FULL 
GO
ALTER DATABASE [BDTP1] SET  MULTI_USER 
GO
ALTER DATABASE [BDTP1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDTP1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDTP1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDTP1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDTP1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDTP1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDTP1', N'ON'
GO
ALTER DATABASE [BDTP1] SET QUERY_STORE = OFF
GO
USE [BDTP1]
GO
/****** Object:  User [TCT]    Script Date: 21/04/2024 18:10:31 ******/
CREATE USER [TCT] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 21/04/2024 18:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id_Region] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Empresa] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id_Region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 21/04/2024 18:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[ID_Sector] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[ID_Region] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY CLUSTERED 
(
	[ID_Sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectorDetalle]    Script Date: 21/04/2024 18:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectorDetalle](
	[id_SectorDetalle] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Area] [varchar](250) NOT NULL,
	[Detalle] [varchar](250) NOT NULL,
	[id_Sector] [int] NOT NULL,
	[ResponsableInstalacion] [int] NOT NULL,
	[GestorAdministrativo] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[SupervisorInstalacion] [int] NOT NULL,
	[ResponsableZonalSP] [int] NOT NULL,
	[GerenteRegional] [int] NOT NULL,
	[RepresentanteSP] [int] NOT NULL,
	[DirectorTecnico] [int] NOT NULL,
 CONSTRAINT [PK_SectorDetalle] PRIMARY KEY CLUSTERED 
(
	[id_SectorDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioInterno]    Script Date: 21/04/2024 18:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioInterno](
	[Id_UsuarioInterno] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Nombre] [nvarchar](150) NULL,
	[CarpetaInforme] [varchar](500) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_UsuarioInterno] PRIMARY KEY CLUSTERED 
(
	[Id_UsuarioInterno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (1, N'R1', N'Region 1', N'Empresa 1', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (2, N'R2', N'Region 2', N'Empresa 2', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (3, N'R3', N'Region 3', N'Empresa 3', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (4, N'R4', N'Region 4', N'Empresa 4', 1)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sector] ON 

INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo]) VALUES (1, N'COD-1', N'Sector1', 1, 1)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo]) VALUES (3, N'COD-2', N'Sector2', 1, 1)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo]) VALUES (4, N'COD-3', N'Sector3', 2, 1)
SET IDENTITY_INSERT [dbo].[Sector] OFF
GO
SET IDENTITY_INSERT [dbo].[SectorDetalle] ON 

INSERT [dbo].[SectorDetalle] ([id_SectorDetalle], [Codigo], [Area], [Detalle], [id_Sector], [ResponsableInstalacion], [GestorAdministrativo], [Activo], [SupervisorInstalacion], [ResponsableZonalSP], [GerenteRegional], [RepresentanteSP], [DirectorTecnico]) VALUES (3, N'Detalle-1', N'Area1', N'Area1 Sector 1', 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[SectorDetalle] ([id_SectorDetalle], [Codigo], [Area], [Detalle], [id_Sector], [ResponsableInstalacion], [GestorAdministrativo], [Activo], [SupervisorInstalacion], [ResponsableZonalSP], [GerenteRegional], [RepresentanteSP], [DirectorTecnico]) VALUES (5, N'Detalle-2', N'Area 2', N'Area 1 Sector 2', 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[SectorDetalle] ([id_SectorDetalle], [Codigo], [Area], [Detalle], [id_Sector], [ResponsableInstalacion], [GestorAdministrativo], [Activo], [SupervisorInstalacion], [ResponsableZonalSP], [GerenteRegional], [RepresentanteSP], [DirectorTecnico]) VALUES (6, N'Detalle-3', N'Area 2', N'Area 2 Sector 1', 1, 1, 1, 1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[SectorDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioInterno] ON 

INSERT [dbo].[UsuarioInterno] ([Id_UsuarioInterno], [Username], [Email], [Nombre], [CarpetaInforme], [Activo]) VALUES (1, N'Usuario 1', N'juan@hotmail.com', N'Juan', N'Carpeta1', 1)
INSERT [dbo].[UsuarioInterno] ([Id_UsuarioInterno], [Username], [Email], [Nombre], [CarpetaInforme], [Activo]) VALUES (2, N'Usuario 2', N'pedro@aoel.com', N'Pedro', N'Carpeta2', 1)
INSERT [dbo].[UsuarioInterno] ([Id_UsuarioInterno], [Username], [Email], [Nombre], [CarpetaInforme], [Activo]) VALUES (3, N'Usuario 3', N'hugo@sinemail.com', N'Hugo', N'Carpeta3', 1)
SET IDENTITY_INSERT [dbo].[UsuarioInterno] OFF
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_Region] FOREIGN KEY([ID_Region])
REFERENCES [dbo].[Region] ([Id_Region])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_Region]
GO
ALTER TABLE [dbo].[SectorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SectorDetalle_Sector] FOREIGN KEY([id_Sector])
REFERENCES [dbo].[Sector] ([ID_Sector])
GO
ALTER TABLE [dbo].[SectorDetalle] CHECK CONSTRAINT [FK_SectorDetalle_Sector]
GO
ALTER TABLE [dbo].[SectorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SectorDetalle_UsuarioInterno] FOREIGN KEY([ResponsableInstalacion])
REFERENCES [dbo].[UsuarioInterno] ([Id_UsuarioInterno])
GO
ALTER TABLE [dbo].[SectorDetalle] CHECK CONSTRAINT [FK_SectorDetalle_UsuarioInterno]
GO
ALTER TABLE [dbo].[SectorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SectorDetalle_UsuarioInterno1] FOREIGN KEY([GestorAdministrativo])
REFERENCES [dbo].[UsuarioInterno] ([Id_UsuarioInterno])
GO
ALTER TABLE [dbo].[SectorDetalle] CHECK CONSTRAINT [FK_SectorDetalle_UsuarioInterno1]
GO
ALTER TABLE [dbo].[SectorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SectorDetalle_UsuarioInterno2] FOREIGN KEY([SupervisorInstalacion])
REFERENCES [dbo].[UsuarioInterno] ([Id_UsuarioInterno])
GO
ALTER TABLE [dbo].[SectorDetalle] CHECK CONSTRAINT [FK_SectorDetalle_UsuarioInterno2]
GO
ALTER TABLE [dbo].[SectorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SectorDetalle_UsuarioInterno3] FOREIGN KEY([ResponsableZonalSP])
REFERENCES [dbo].[UsuarioInterno] ([Id_UsuarioInterno])
GO
ALTER TABLE [dbo].[SectorDetalle] CHECK CONSTRAINT [FK_SectorDetalle_UsuarioInterno3]
GO
ALTER TABLE [dbo].[SectorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SectorDetalle_UsuarioInterno4] FOREIGN KEY([GerenteRegional])
REFERENCES [dbo].[UsuarioInterno] ([Id_UsuarioInterno])
GO
ALTER TABLE [dbo].[SectorDetalle] CHECK CONSTRAINT [FK_SectorDetalle_UsuarioInterno4]
GO
ALTER TABLE [dbo].[SectorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SectorDetalle_UsuarioInterno5] FOREIGN KEY([RepresentanteSP])
REFERENCES [dbo].[UsuarioInterno] ([Id_UsuarioInterno])
GO
ALTER TABLE [dbo].[SectorDetalle] CHECK CONSTRAINT [FK_SectorDetalle_UsuarioInterno5]
GO
ALTER TABLE [dbo].[SectorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SectorDetalle_UsuarioInterno6] FOREIGN KEY([DirectorTecnico])
REFERENCES [dbo].[UsuarioInterno] ([Id_UsuarioInterno])
GO
ALTER TABLE [dbo].[SectorDetalle] CHECK CONSTRAINT [FK_SectorDetalle_UsuarioInterno6]
GO
USE [master]
GO
ALTER DATABASE [BDTP1] SET  READ_WRITE 
GO
