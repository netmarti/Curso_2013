USE [master]
GO
/****** Object:  Database [gestion]    Script Date: 27/06/2013 13:57:26 ******/
CREATE DATABASE [gestion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gestion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\gestion.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'gestion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\gestion_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [gestion] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gestion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gestion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gestion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gestion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gestion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gestion] SET ARITHABORT OFF 
GO
ALTER DATABASE [gestion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gestion] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [gestion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gestion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gestion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gestion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gestion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gestion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gestion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gestion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gestion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gestion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gestion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gestion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gestion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gestion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gestion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gestion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gestion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [gestion] SET  MULTI_USER 
GO
ALTER DATABASE [gestion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gestion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gestion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gestion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [gestion]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 27/06/2013 13:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departamentos](
	[num_dept] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[localizacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[num_dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 27/06/2013 13:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[num_empleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[salario] [float] NOT NULL,
	[comision] [float] NULL,
	[departamento] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[num_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Departamentos] ([num_dept], [nombre], [localizacion]) VALUES (1, N'Direccion', N'Barcelona')
INSERT [dbo].[Departamentos] ([num_dept], [nombre], [localizacion]) VALUES (2, N'Diseño', N'Barcelona')
INSERT [dbo].[Departamentos] ([num_dept], [nombre], [localizacion]) VALUES (10, N'Recursos Humanos', N'Barcelona')
INSERT [dbo].[Departamentos] ([num_dept], [nombre], [localizacion]) VALUES (13, N'Contabilidad', N'Barcelona')
INSERT [dbo].[Departamentos] ([num_dept], [nombre], [localizacion]) VALUES (15, N'I+D', N'Amsterdarm')
INSERT [dbo].[Departamentos] ([num_dept], [nombre], [localizacion]) VALUES (17, N'Publicidad', N'Zaragoza')
INSERT [dbo].[Empleados] ([num_empleado], [nombre], [cargo], [fecha_nacimiento], [salario], [comision], [departamento]) VALUES (1, N'Daniel García', N'Diseñador', CAST(0x31090B00 AS Date), 2100, 800, 10)
INSERT [dbo].[Empleados] ([num_empleado], [nombre], [cargo], [fecha_nacimiento], [salario], [comision], [departamento]) VALUES (2, N'Jenny', N'Directora Adjunta', CAST(0xC60B0B00 AS Date), 2500, 800, 1)
INSERT [dbo].[Empleados] ([num_empleado], [nombre], [cargo], [fecha_nacimiento], [salario], [comision], [departamento]) VALUES (3, N'Sabina', N'Programadora', CAST(0xAA0E0B00 AS Date), 2100, 800, 2)
INSERT [dbo].[Empleados] ([num_empleado], [nombre], [cargo], [fecha_nacimiento], [salario], [comision], [departamento]) VALUES (4, N'Manoli', N'Contabilidad', CAST(0x94F20A00 AS Date), 2500, 800, 13)
INSERT [dbo].[Empleados] ([num_empleado], [nombre], [cargo], [fecha_nacimiento], [salario], [comision], [departamento]) VALUES (5, N'Arturo', N'Jefe Contabilidad', CAST(0x0BF80A00 AS Date), 2500, 800, 13)
INSERT [dbo].[Empleados] ([num_empleado], [nombre], [cargo], [fecha_nacimiento], [salario], [comision], [departamento]) VALUES (6, N'Daniel Martín', N'Director General', CAST(0x77F80A00 AS Date), 3500, 800, 1)
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Departamentos] FOREIGN KEY([departamento])
REFERENCES [dbo].[Departamentos] ([num_dept])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Departamentos]
GO
USE [master]
GO
ALTER DATABASE [gestion] SET  READ_WRITE 
GO
