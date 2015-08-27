create proc dbo.GetEgresadobyFiltros
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
	set @IdEgresado = (select coalesce(MAX(@IdEgresado),0) from dbo.Egresado) +1
	
	insert into dbo.Egresado(IdEgresado, Nombres, ApellidoPaterno, ApellidoMaterno, DNI, FechaNacimiento, Direccion, 
			Departamento, Provincia, Distrito, Telefono, Celular, Email, AñoEgreso, Estado, FechaRegistro, IdUsuarioRegistrador)
	values(@IdEgresado, @Nombres, @ApellidoPaterno, @ApellidoMaterno, @DNI, @FechaNacimiento, @Direccion,
			@Departamento, @Provincia, @Distrito, @Telefono, @Celular, @Email, @AñoEgreso, @Estado, getdate(), @IdUsuario)
go

create proc dbo.UpdEgresado
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
go