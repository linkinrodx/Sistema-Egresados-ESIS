USE [master]
GO
/****** Object:  Database [db_ControlEgresados]    Script Date: 12/11/2014 15:09:27 ******/
CREATE DATABASE [db_ControlEgresados] ON  PRIMARY 
( NAME = N'db_ControlEgresados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_ControlEgresados.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_ControlEgresados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_ControlEgresados_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_ControlEgresados] SET COMPATIBILITY_LEVEL = 100
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
ALTER DATABASE [db_ControlEgresados] SET  READ_WRITE
GO
ALTER DATABASE [db_ControlEgresados] SET RECOVERY SIMPLE
GO
ALTER DATABASE [db_ControlEgresados] SET  MULTI_USER
GO
ALTER DATABASE [db_ControlEgresados] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [db_ControlEgresados] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_ControlEgresados', N'ON'
GO
USE [db_ControlEgresados]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/11/2014 15:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Egresado]    Script Date: 12/11/2014 15:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Egresado](
	[IdEgresado] [int] NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[ApellidoPaterno] [varchar](75) NOT NULL,
	[ApellidoMaterno] [varchar](75) NOT NULL,
	[DNI] [varchar](8) NOT NULL,
	[FechaNacimiento] [datetime] NULL,
	[Direccion] [varchar](150) NULL,
	[Departamento] [varchar](50) NULL,
	[Provincia] [varchar](50) NULL,
	[Distrito] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AñoEgreso] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[IdUsuarioRegistrador] [int] NOT NULL,
 CONSTRAINT [PK_Egresado_1] PRIMARY KEY CLUSTERED 
(
	[IdEgresado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdEgresado]    Script Date: 12/11/2014 15:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdEgresado]
	@IdEgresado int,
	@Nombres varchar(100),
	@ApellidoPaterno varchar(100),
	@ApellidoMaterno varchar(100), 
	@DNI varchar(8),
	@FechaNacimiento datetime,
	@Direccion varchar(150), 
	@Departamento varchar(150),
	@Provincia varchar(150), 
	@Distrito varchar(150), 
	@Telefono varchar(150), 
	@Celular varchar(150), 
	@Email varchar(150), 
	@AñoEgreso varchar(150), 
	@Estado varchar(150)
as
	update dbo.Egresado
	set Nombres = @Nombres, ApellidoPaterno = @ApellidoPaterno, ApellidoMaterno = @ApellidoMaterno, DNI = @DNI, 
		FechaNacimiento = @FechaNacimiento, Direccion = @Direccion, Departamento = @Departamento, Provincia = @Provincia,
		Distrito = @Distrito, Telefono = @Telefono, Celular = @Celular, Email = @Email, AñoEgreso = @AñoEgreso, 
		Estado = @Estado
	where IdEgresado = @IdEgresado
GO
/****** Object:  StoredProcedure [dbo].[InsEgresado]    Script Date: 12/11/2014 15:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsEgresado]
	@Nombres varchar(100),
	@ApellidoPaterno varchar(100),
	@ApellidoMaterno varchar(100), 
	@DNI varchar(8),
	@FechaNacimiento datetime,
	@Direccion varchar(150), 
	@Departamento varchar(150),
	@Provincia varchar(150), 
	@Distrito varchar(150), 
	@Telefono varchar(150), 
	@Celular varchar(150), 
	@Email varchar(150), 
	@AñoEgreso varchar(150), 
	@Estado varchar(150),	
	@IdUsuario smallint
as
	declare @IdEgresado smallint
	set @IdEgresado = (select coalesce(MAX(IdEgresado),0) from dbo.Egresado) + 1
	
	insert into dbo.Egresado(IdEgresado, Nombres, ApellidoPaterno, ApellidoMaterno, DNI, FechaNacimiento, Direccion, 
			Departamento, Provincia, Distrito, Telefono, Celular, Email, AñoEgreso, Estado, FechaRegistro, IdUsuarioRegistrador)
	values(@IdEgresado, @Nombres, @ApellidoPaterno, @ApellidoMaterno, @DNI, @FechaNacimiento, @Direccion,
			@Departamento, @Provincia, @Distrito, @Telefono, @Celular, @Email, @AñoEgreso, @Estado, getdate(), @IdUsuario)
GO
/****** Object:  StoredProcedure [dbo].[GetEgresadobyFiltros]    Script Date: 12/11/2014 15:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetEgresadobyFiltros]
	@IdEgresado smallint,
	@AñoEgreso smallint,
	@Egresado varchar(100),
	@DNI varchar(8),
	@FechaInicio datetime,
	@FechaFin datetime
as
	set @FechaFin = @FechaFin + 1
	
	select IdEgresado, Nombres, ApellidoPaterno, ApellidoMaterno, DNI, FechaNacimiento, Direccion, 
			Departamento, Provincia, Distrito, Telefono, Celular, Email, AñoEgreso, Estado 
	from dbo.Egresado
	where (@IdEgresado = IdEgresado or @IdEgresado = 0)
		and (@AñoEgreso = AñoEgreso or @AñoEgreso = 0)
		and (Nombres like '%'+@Egresado+'%')
		and (FechaRegistro between @FechaInicio and @FechaFin)
GO
/****** Object:  Table [dbo].[EgresadosDetalle]    Script Date: 12/11/2014 15:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EgresadosDetalle](
	[IdEgresado] [int] NOT NULL,
	[Correlativo] [int] NOT NULL,
	[Empresa] [varchar](100) NULL,
	[Puesto] [varchar](75) NULL,
	[Area] [varchar](75) NULL,
	[InicioLaboral] [datetime] NULL,
	[FinLaboral] [datetime] NULL,
	[DescripcionTarea] [varchar](200) NULL,
	[Estado] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[IdUsuarioRegistrador] [int] NOT NULL,
 CONSTRAINT [PK_EgresadosDetalle] PRIMARY KEY CLUSTERED 
(
	[IdEgresado] ASC,
	[Correlativo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Egresado_Usuario]    Script Date: 12/11/2014 15:09:29 ******/
ALTER TABLE [dbo].[Egresado]  WITH CHECK ADD  CONSTRAINT [FK_Egresado_Usuario] FOREIGN KEY([IdUsuarioRegistrador])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Egresado] CHECK CONSTRAINT [FK_Egresado_Usuario]
GO
/****** Object:  ForeignKey [FK_EgresadosDetalle_Egresado]    Script Date: 12/11/2014 15:09:33 ******/
ALTER TABLE [dbo].[EgresadosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_EgresadosDetalle_Egresado] FOREIGN KEY([IdUsuarioRegistrador])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[EgresadosDetalle] CHECK CONSTRAINT [FK_EgresadosDetalle_Egresado]
GO
/****** Object:  ForeignKey [FK_EgresadosDetalle_EgresadosDetalle]    Script Date: 12/11/2014 15:09:33 ******/
ALTER TABLE [dbo].[EgresadosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_EgresadosDetalle_EgresadosDetalle] FOREIGN KEY([IdEgresado])
REFERENCES [dbo].[Egresado] ([IdEgresado])
GO
ALTER TABLE [dbo].[EgresadosDetalle] CHECK CONSTRAINT [FK_EgresadosDetalle_EgresadosDetalle]
GO
