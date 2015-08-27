create proc dbo.GetEgresadoAll
	@IdEgresado smallint
as	
	select IdEgresado, Nombres, ApellidoPaterno, ApellidoMaterno, DNI, FechaNacimiento, Direccion, 
			Departamento, Provincia, Distrito, Telefono, Celular, Email, AñoEgreso, Estado 
	from dbo.Egresado
	where @IdEgresado = IdEgresado

	select ed.IdEgresado, ed.Correlativo, ed.Empresa, ed.Puesto, ed.Area, ed.InicioLaboral, ed.FinLaboral, 
			ed.DescripcionTarea, ed.Estado
	from dbo.Egresado e 
			inner join dbo.EgresadosDetalle ed
			on e.IdEgresado = ed.IdEgresado
	where @IdEgresado = e.IdEgresado
go