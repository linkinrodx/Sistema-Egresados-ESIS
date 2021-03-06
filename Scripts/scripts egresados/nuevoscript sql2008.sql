USE [master]
GO
/****** Object:  Database [db_ControlEgresados]    Script Date: 18/11/2014 05:49:45 p.m. ******/
CREATE DATABASE [db_ControlEgresados] ON  PRIMARY 
( NAME = N'db_ControlEgresados', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\db_ControlEgresados.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_ControlEgresados_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\db_ControlEgresados_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_ControlEgresados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_ControlEgresados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [db_ControlEgresados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_ControlEgresados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_ControlEgresados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_ControlEgresados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_ControlEgresados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_ControlEgresados] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_ControlEgresados] SET  MULTI_USER 
GO
ALTER DATABASE [db_ControlEgresados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_ControlEgresados] SET DB_CHAINING OFF 
GO
USE [db_ControlEgresados]
GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 18/11/2014 05:49:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Egresado](
	[IdEgresado] [smallint] NOT NULL,
	[Nombres] [varchar](100) NULL,
	[ApellidoPaterno] [varchar](75) NULL,
	[ApellidoMaterno] [varchar](75) NULL,
	[DNI] [varchar](8) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Direccion] [varchar](150) NULL,
	[Departamento] [varchar](50) NULL,
	[Provincia] [varchar](50) NULL,
	[Distrito] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AñoEgreso] [smallint] NULL,
	[Estado] [smallint] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[IdUsuarioRegistrador] [smallint] NOT NULL,
 CONSTRAINT [PK_Egresado] PRIMARY KEY CLUSTERED 
(
	[IdEgresado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EgresadosDetalle]    Script Date: 18/11/2014 05:49:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EgresadosDetalle](
	[IdEgresado] [smallint] NOT NULL,
	[Correlativo] [nchar](10) NOT NULL,
	[Empresa] [varchar](100) NULL,
	[Puesto] [varchar](75) NULL,
	[Area] [varchar](75) NULL,
	[InicioLaboral] [datetime] NULL,
	[FinLaboral] [datetime] NULL,
	[DescripcionTarea] [varchar](200) NULL,
	[Estado] [smallint] NULL,
	[FechaRegistro] [datetime] NULL,
	[IdUsuarioRegistrador] [smallint] NULL,
 CONSTRAINT [PK_EgresadosDetalle] PRIMARY KEY CLUSTERED 
(
	[IdEgresado] ASC,
	[Correlativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Egresado]  WITH CHECK ADD  CONSTRAINT [FK_Egresado_Egresado] FOREIGN KEY([IdEgresado])
REFERENCES [dbo].[Egresado] ([IdEgresado])
GO
ALTER TABLE [dbo].[Egresado] CHECK CONSTRAINT [FK_Egresado_Egresado]
GO
USE [master]
GO
ALTER DATABASE [db_ControlEgresados] SET  READ_WRITE 
GO
