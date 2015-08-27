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

insert into usuario
values(1,'sa', '',GETDATE(),1)
go

create proc dbo.InsEgresado
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
go

--1
exec InsEgresado 'EDWIN SANTOS','AGUILAR','CALIZAYA','44994424',null,'','','','','','','',2010,1,1
--2
exec InsEgresado 'DANIEL','ELIAS','KANA','45649596','09/04/1989','CIUDAD NUEVA CTE. 47 MZ195-LT 24','','','','','952700077','',2010,1,1
--3
exec InsEgresado 'DILMER SANTIAGO','QUISPE','CACERES','44670060','25/07/1987','URB.MONTEVERDE 2DA ET. MZ B-LTE.2','','','','','952656679','',2009,1,1
--4
exec InsEgresado 'ALEXANDER NILO','LARA','GARCES','45627728','12/11/1988','URB. BOLOGNESI GRAU 2115','','','','','952531543','',2010,1,1
--5
exec InsEgresado 'ABEL ELIAS','NINA','FLORES','41081959','30/03/1981','AV. JUAN MOORE 876, P.J. SAN MARTIN','','','','','952315561','',2002,1,1
--6
exec InsEgresado 'CESAR ALONSO','AJALLA','LAURA','43641971','22/05/1986','URB. EL BOSQUE MZ.B, LTE.1- X MIGRACIONES','','','','','952870308','',2010,1,1
--7
exec InsEgresado 'GINO RUBEN','MAQUERA','COYLA','40040662','30/08/1978','URB. TACNA A-25','','','','','952536923','',2001,1,1
--8
exec InsEgresado 'KERRY THOMAS','PEREZ','HUANCA','45951893','14/08/1989','ALFONSO UGARTE 1RA.ETA. MZ J1-LTE7','','','','','952335682','',2010,1,1
--9
exec InsEgresado 'MIJAEL ROLPH','PAREDES','LUPACA','46029909','21/04/1986','ASOC. AAPITAC ZN D MZ. C1 POCOLLAY','','','','','952913812','',2010,1,1
--|0
exec InsEgresado 'FREEMAN HUGO','LLAMOZAS','ESCALANTE','46241682','23/03/1990','C.P. LEGUIA HABITAT C.DE DIOS MZ. F L.17','','','','','952957624','',2011,1,1


--11
exec InsEgresado 'SANDRA PATRICIA','ROJAS','MAMANI','45475797','02/12/1988','ASOC. VIV. LAS AMERICAS MZ.P L.03','','','','','971519922','',2011,1,1
--12
exec InsEgresado 'MARILUZ','CUTIPA','COPAJA','45313159','10/09/1988','ASOC. VILLA EL TRIUNFO MZ 336 LTE3 CT5','','','','','952954558','',2011,1,1
--13
exec InsEgresado 'MARIBEL CECILIA','LLANOS','QUISPE','42169758','19/01/1983','2DA ET. 28 AGOSTO MZ 11 LTE6','','','','','952874461','',2011,1,1
--14
exec InsEgresado 'JOSE ALFREDO','TUYO','LLIPITA','46441632','19/06/1990','CALLE PIZARRO 943 PARA CHICO','','','','','952688454','',2011,1,1
--15
exec InsEgresado 'MARY ISABEL','COA','CONDORI','44671654','30/07/1987','ASOC. SAN FRANCISCO MZ. 10 LT.05','','','','','952855291','',2011,1,1
--16
exec InsEgresado 'HUGO MANUEL','BARRAZA','VIZCARA','46053783','29/09/1989','CALLE MODESTO BASADRE 862','','','','','952701632','',2011,1,1
--17
exec InsEgresado 'MARIA ALEJANDRA','SIERRA','RODRIGUEZ','45849905','14/05/1989','VILLA DEL PERIODISTA MZ. B L.6','','','','','974409330','',2011,1,1
--18
exec InsEgresado 'JHON KLEVER','CCALLO','CASTILLO','45687376','06/02/1989','NATIVIDAD AV. PINTO 2391','','','','','952209371','',2011,1,1
--19
exec InsEgresado 'CRISTHIAN JHOEL ANTHONY','OSORIO','AVALOS','45997038','12/09/1989','URB. CIUDAD DE DIOS  AV. LOS OLIVOS  MZ.B L.11','','','','','','',2011,1,1
--20
exec InsEgresado 'KATHERINE DEL ROSARIO','DURAND','YUFRA','46338227','17/03/1990','PROLONGACION ZELA L22 POCOLLAY','','','','','952841726','',2011,1,1

--21
exec InsEgresado 'WILFREDO RENATO','YUFRA','TOZO','47472429','04/06/1990','CONJ.HAB.A.UGARTE I ETAPA MZ.E1 L.13','','','','','942152860','',2011,1,1
--22
exec InsEgresado 'DIANA LIZ','PAYE','JIMENEZ','45671740','12/08/1988','AV.PINTO. PROGRESO 44','','','','','952290678','anadi5_ars@hotmail.com',2011,1,1
--23
exec InsEgresado 'OLIVIA ROSSANA','SARMIENTO','MAMANI','44306464','07/04/1997','C. NUEVA CTE17-MZ65-LT18','','','','','952965729','ross7ana@gmail.com',2011,1,1
--24
exec InsEgresado 'JUAN LUIS','MANDAMIENTO','CANDIA','44835036','07/02/1988','ASOC. LOS ROBLES MZ-O3 LT-2','','','','','954844025','luisman702 @gmail.com',2011,1,1
--25
exec InsEgresado 'RICARDO RILDO','CORONADO','PEREZ','45674878',null,'PERU PSJE ELIAS 624- X LEONCIO PRADO','','','','','952349868','',2010,1,1
--26
exec InsEgresado 'VILMA SUSANA','GARCIA','HERRERA','456445610','31/12/1988','CALLE AVIACION 936 PARA CHICO','','','','','952335045','susanagh_19@hotmail.com',2011,1,1
--27
exec InsEgresado 'JULIO CESAR','CACERES','CCOYO','45240105','30/07/1988','CONO SUR ASOC. TACNA HEROICA MZ I LTE2','','','','','952927703','',2010,1,1
--28
exec InsEgresado 'ANTHONY ROMEL','FERNANDEZ','SONCCO','46314337','19/04/1989','ASOC. EBEN EZER MZ38-LT42','','','','','999908490','fernandezs_89@hotmail.com',2011,1,1
--29
exec InsEgresado 'LUIS ARTURO','ALE','TAPIA','45736011','05/04/1989','ELOY G.URETA -CALLE URETA  1453','','','','','952824701','blzb_xvi@hotmail.com',2011,1,1
--30
exec InsEgresado 'DAVID','CALIZAYA','CONDORI','43764712','21/05/1986','LA ESPERANZA-LUTHER KING 1169','','','','','952634130','davidc7_@hotmail.com',2011,1,1

--31
exec InsEgresado 'LUIS RODRIGO','TURPO','COTRADO','46352489','01/02/1990','ASOC.SAN JOSE MZ B-LTE6- MERCADO ZONAL DE CIUDAD NUEVA','','','','','952989020','mcs_rodrigo@hotmail.com',2011,1,1
--32
exec InsEgresado 'KATHERINE DE  LOS MILAGROS','ELIAS','QUISPE','45495780','28/10/1988','2 DICIEMBRE 58-PJ.VIGIL','','','','','952529022','',2011,1,1
--33
exec InsEgresado 'CHRISTIAN ANTONIO','VELASQUEZ','CHAMBILLA','44093821','19/11/1986','ALFONSO UGARTE 3RA ET. MZ D5-LTE1','','','','','952847387','christian_1986_70@hotmail.com',2011,1,1
--34
exec InsEgresado 'AYRTONN FRANKHO','MELENDEZ','QUISPE','45452963','17/01/1988','AV.VIGIL 425 -X PLAZA GRAU','','','','','952289538','frankho_z4@hotmail.com',2011,1,1
--35
exec InsEgresado 'JOSE GREGORIO','ROQUE','MAMANI','45833431','09/03/1985','CTE.1-MZ.3-LTE.24-C.NUEVA-','','','','','952219993','brando_007_lobo@hotmail.com',2011,1,1
--36
exec InsEgresado 'LUIS JONATHAN','ALARCON','CHAVEZ','45295443','26/11/1987','AV. MANUEL A.ODRIA 732','','','','','952636357','',2010,1,1
--37
exec InsEgresado 'MIGUEL MISAEL','FLORES','CALLE','46005013','10/07/1989','L.PRADO STA.ROSA DE LIMA 1445','','','','','952849026','migue_sport10@hotmail.com',2011,1,1
--38 
exec InsEgresado 'JORGE LUIS','LARICO','GAUNA','42397069','03/11/1980','YURI GAGARIN 54- LA ESPERANZA','','','','','944812762','jorge.sis2011@gmail.com',2011,1,1
--39
exec InsEgresado 'DEYSON','RAMIREZ','VILCA','46471849','07/11/1989','CONO SUR ASOC.HEROES CENEPA MZ11-LTE','','','','','952881770','dramirezvilca@hotmail.com',2011,1,1
--40
exec InsEgresado 'CESAR RAUL','VARGAS','RAMOS','42496913','18/03/1984','VILLA SANTA CATALINA MZ.A, LTE. 25','','','','','952292984','',2008,1,1

--41
exec InsEgresado 'JUAN CARLOS','JIMENEZ','FLORES','46835580','05/03/1991','AV. EL SOL MZ.E LTE-1A','','','','','986746893','carlos_jf_1681@hotmail.com',2012,1,1
--42
exec InsEgresado 'LETICIA ISABEL','DAVALOS','VALLE','46986065','08/03/1992','AV. JOSE TORIBIO ARA 1376-PARA CHICO','','','','','949662565','isabel_ldv@hotmail.com',2012,1,1
--43
exec InsEgresado 'MERY MILAGROS','PACO','RAMOS','42908656','14/01/1985','ASOC.LAS VIÑAS MZ G LTE 12-','','','','','990523974','mirakel1401@gmail.com',2012,1,1
--44
exec InsEgresado 'VANESSA MILAGROS','PACO','RAMOS','42908657','14/01/1985','ASOC.LAS VIÑAS MZ G LTE 12-','','','','','947923337','vanessapr85@gmaill.com',2012,1,1
--45
exec InsEgresado 'ERIKA SANDRA','GARCIA','OCHOA','46961645','01/03/1991','G.A. ASOC. JAVIER NORIEGA MZ F-LTE4','','','','','952527216','erika.garcia.esis@gmail.com',2012,1,1
--46
exec InsEgresado 'ALEX ROOSVELT DOUGLAS','QUISPE','CUADROS','47527868','04/01/1989','G.A. SAN FCO. MZ16-LTE18','','','','','950360423','aqc4@hotmail.com',2012,1,1
--47
exec InsEgresado 'ELVIS','HUARCAYA','CORONADO','43176153','10/10/1985','ASOC. EL MORRO MZ. O L.5 G.A.','','','','','952649119','che_465@hotmail.com',2012,1,1
--48 
exec InsEgresado 'HENRRY ERICKSON TEOBALDO','BUSTINCIO','PERCA','47666313','22/10/1989','VILLA MILITAR SAUCINI 31','','','','','952527216','henbu2012@gmail.com',2012,1,1
--49
exec InsEgresado 'ERICK JONATHAN','VILCHEZ','AGRUTA','70006608','06/08/1988','COOP. JORGE BASADRE G. MZ.B LT.17','','','','','952015038','movie_666@hotmail.com',2012,1,1
--50
exec InsEgresado 'ELIZABETH DEL CARMEN','LOPEZ','VASQUEZ','45896698','15/03/1989','ZORA CARBAJAL 2015-PJ. LA NATIVIDAD','','','','','952015061','elizalopezvasquez@gmail.com',2012,1,1

--51
exec InsEgresado 'IRIS LUZ','PERCA','CAPACUTE','46889744','01/04/1990','SATELITE DEL SUR MZ J-LTE11- G.A.','','','','','961040863','irisluz.pc@hotmail.com',2012,1,1
--52
exec InsEgresado 'VIDAL OSCAR','MELENDEZ','MAMANI','45232507','20/04/1988','LOS CLAVELES MZ T-2-LTE 30- G.A.','','','','','952954135','vid.arkano@hotmail.com',2012,1,1
--53
exec InsEgresado 'DANIEL RONALD','ROMERO','ALANOCA','47304913','18/08/1991','-ALFONSO UGARTE 2DA. ET. MZ C-1 - LTE 1','','','','','976834704','daniel_esis@hotmail.com',2012,1,1
--54
exec InsEgresado 'FRANKLIN JOSMELL','TICONA','TUYO','46874983','02/03/1991','G.A. ASOC. LAS VIÑAS MZ J-LTE14','','','','','952877596','franklinjosmell@gmail.com',2012,1,1
--55
exec InsEgresado 'DORA ELIZABETH','CALLISAYA','CHOQUECOTA','43820983','28/03/1985','ASOC. VIV. PARA GRANDE MARIA PARADO DE BELLIDO 386','','','','','945037160','elizabella_18@hotmail.com',2012,1,1
--56
exec InsEgresado 'APOLINARIO','RAMOS','ASTO','45266128','29/09/1986','LAS BEGONIAS MZ N3-LT2','','','','','952916557','apolozx@gmail.com',2012,1,1
--57
exec InsEgresado 'ALEX','CALIZAYA','ANAHUA','45490708','07/09/1988','ASOC. TACNA HEROICA MZ F2-LTE 24- G.A.','','','','','942922352','acalizaya1@gmail.com',2012,1,1
--58 
exec InsEgresado 'BERLIN ALCIDES','QUISPE','PIZARRO','44866985','12/02/1988','ASOC. VISTA ALEGRE MZ 23-LTE 5-','','','','','952001444','berlinvq@hotmail.com',2012,1,1
--59
exec InsEgresado 'DIOVANA CINTIA','CHAMBILLA','CONDORI','44636834','05/11/1987','ASOCIACION MONTEREY MZA. 413, LTE. 43','','','','','952647104','marycielo_20_7@hotmail.com',2012,1,1
--60
exec InsEgresado 'ENRIQUE WALDO','CONDORI','SILES','91818758','22/08/1991','L.PRADO PEREZ GAMBOA 1194','','','','','952220271','ricky_1194@hotmail.com',2012,1,1

--61
exec InsEgresado 'PERCY ANTONIO','PACCO','CHICALLA','46973671','11/03/1990','ASOC. LOS CLAVELES MZ S2-LTE-1-FRENTE AL MERCADO SANTA ROSA','','','','','952534707','atlantic_tk@hotmail.com',2012,1,1
--62
exec InsEgresado 'JORGE BLANCO','BLANCO','RETAMOZO','47104258','14/07/1990','ASOC. PARA GRANDE MZ-30  LT-22','','','','','952235168','gito_156@hotmail.com',2012,1,1
--63
exec InsEgresado 'JORDAN SAUL','MOLINERO','MAMANI','44235823','08/06/1985','STA. ROSA DE LIMA 1030, LEONCIO PRADO','','','','','952878024','saul_slipknot85@hotmail.com',2011,1,1
--64
exec InsEgresado 'JUAN CARLOS GASPAR','HUAMAN','OLIVERA','46978312','04/12/1990','AV. HNOS. BARRETO MZ 49-LTE5-C. NUEVA','','','','','952943834','juank.ho.156@gmail.com',2012,1,1
--65
exec InsEgresado 'NOEMI','MAMANI','CHINO','43439036','29/12/1985','ALTO DE LA ALIANZA CARLOS WISE MZA.R LTE.1','','','','','952890256','',2010,1,1
--66
exec InsEgresado 'DIEGO ARMANDO','GONZALO','YUFRA','45466949','09/08/1988','C.N. CTE.16-MZ61-LTE24','','','','','45466949','diego_dag_20@hotmail.com',2011,1,1
--67
exec InsEgresado 'JULISSA MILAGROS','GUTIERREZ','VARGAS','71198720','16/08/1992','LEGUIA- ASOC. VILLA INCLAS MZ 87-LT12','','','','','952707677','jumila_1_2@hotmail.com',2013,1,1
--68 
exec InsEgresado 'WILSON CESAR','CALLISAYA','CHOQUECOTA','41431870','20/07/1982','PARA GRANDE MARIA PARADO DE BELLIDO 386','','','','','952894983','nosliwxi100pre@hotmail.com',2013,1,1
--69
exec InsEgresado 'JUAN VICTOR','ALVARADO','ESPEJO','71029191','03/09/1991','PROL. MODESTO MOLINA 1309','','','','','947618682','razor7tnsr@gmail.com',2013,1,1
--70
exec InsEgresado 'RUBEN EDGAR','ILLA','CHAMBI','45496513','02/12/1988','C.N. MZ182-LTE5-CTE46','','','','','952616696','',2013,1,1


--71
exec InsEgresado 'JAVIER VIRGILIO','CATACHURA','QUISPE','00443552','24/12/1969','MZ LL, LOTE5  MISMO ALTO DE LA ALIANZA','','','','','952388185','indoxyl@hotmail.com',2013,1,1
--72
exec InsEgresado 'KEVIN EDGAR','CHURA','MAMANI','47069015','28/03/1992','VILLA SAN FRANCISCO MZ 20-LT03','','','','','944964464','lordkannon@hotmail.com',2013,1,1
--73
exec InsEgresado 'ROLANDO BELTRAN','CHIPANA','OREJA','45213722','28/07/1988','','','','','','976157597','role.esis@hotmail.com',2013,1,1
--74
exec InsEgresado 'BRICEIDA ZENAIDA','CHAMBILLA','MAMANI','70807135','14/06/1992','CALLE PRIMERO DE SETIEMBRE 1655','','','','','952680153','brice.ch.m@gmail.com',2013,1,1
--75
exec InsEgresado 'ABRAHAM MOISES','LINARES','OSCO','42516253','30/01/1983','CTE.40-LTE15-MZ213-C.NUEVA','','','','','952631806','elnaufrago2009@gmail.com',2012,1,1
--76
exec InsEgresado 'LUIS ANDERSON','CARHUAYAL','QUISPE','41069892',null,'','','','','','','anderson.carhuayal@gmailcom',2005,1,1
--77
exec InsEgresado 'CRISTHIAN LEONARDO','MAQUERA','ANCHAPURI','70652535','09/04/1992','ALFONSO UGARTE 1RA. ET. MZ E2-LT7','','','','','952952063','cma__leo@hotmail.com',2013,1,1
--78 
exec InsEgresado 'MELISSA QIAOZHEN','LOPEZ','MAQUERA','46845406','21/12/1990','ASOC.VIV. 19 DE NOV. MZA C LOTE 13C','','','','','952886865','mel.qiaozhen@gmail.com',2013,1,1
--79
exec InsEgresado 'SADHAM NEIL','FLORES','COTRADO','70839508','20/09/1992','A. ALIANZA. AGRUP TUPAC AMARU MZ M-LT1','','','','','952867312','neil_fc@hotmail.com',2013,1,1
--80
exec InsEgresado 'EDUAR RUBEN','APAZA','YAÑEZ','45568903','29/10/1988','G.A. LAS BEGONIAS MZ15-LTE22','','','','','952362319','educartoons@gmail.com',2011,1,1

go