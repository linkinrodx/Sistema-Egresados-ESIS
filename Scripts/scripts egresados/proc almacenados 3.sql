create proc dbo.InsEgresadoDetalle
	@IdEgresado varchar(100),
	@Empresa varchar(100), 
	@Puesto varchar(8),
	@Area datetime,
	@InicioLaboral varchar(150), 
	@FinLaboral varchar(150),
	@DescripcionTarea varchar(150), 
	@Estado varchar(150), 
	@FechaRegistro varchar(150), 
	@IdUsuarioRegistrador varchar(150), 
	@Email varchar(150),
	@IdUsuario smallint
as
	declare @Correlativo smallint
	set @Correlativo = (select coalesce(MAX(Correlativo),0) from dbo.EgresadosDetalle where IdEgresado = @IdEgresado) + 1
	
	insert into dbo.EgresadosDetalle(IdEgresado, Correlativo, Empresa, Puesto, Area, InicioLaboral, FinLaboral, 
			DescripcionTarea, Estado, FechaRegistro, IdUsuarioRegistrador)
	values(@IdEgresado, @Correlativo, @Empresa, @Puesto, @Area, @InicioLaboral, @FinLaboral,
			@DescripcionTarea, @Estado, getdate(), @IdUsuario)
go


create proc dbo.UpdEgresadoDetalle
	@IdEgresado varchar(100),
	@Correlativo smallint,
	@Empresa varchar(100), 
	@Puesto varchar(8),
	@Area datetime,
	@InicioLaboral varchar(150), 
	@FinLaboral varchar(150),
	@DescripcionTarea varchar(150), 
	@Estado varchar(150), 
	@FechaRegistro varchar(150), 
	@IdUsuario varchar(150)
as
	update dbo.EgresadosDetalle
	set Empresa = @Empresa, Puesto = @Puesto, Area = @Area, InicioLaboral = @InicioLaboral, 
		FinLaboral = @FinLaboral, DescripcionTarea = @DescripcionTarea, Estado = @Estado, FechaRegistro = @FechaRegistro,
		IdUsuarioRegistrador = @IdUsuario
	where IdEgresado = @IdEgresado and Correlativo = @Correlativo
go