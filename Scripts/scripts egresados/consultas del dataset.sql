--Consultas de Egresado

SELECT ApellidoMaterno, ApellidoPaterno, AñoEgreso, Celular, DNI, Departamento, Direccion, Distrito, Email, Estado, FechaNacimiento, FechaRegistro, IdEgresado, IdUsuarioRegistrador, Nombres, Provincia, Telefono FROM Egresado WHERE (Estado = 1) AND (AñoEgreso = @AñoEgreso OR @AñoEgreso = 0) AND (DNI LIKE '%' + @DNI + '%') AND (Nombres + ApellidoPaterno + ApellidoMaterno LIKE '%' + @Egresado + '%') AND (FechaRegistro < @FechaFin + 1) AND (FechaRegistro > @FechaInicio)

SELECT ApellidoMaterno, ApellidoPaterno, AñoEgreso, Celular, DNI, Departamento, Direccion, Distrito, Email, Estado, FechaNacimiento, FechaRegistro, IdEgresado, IdUsuarioRegistrador, Nombres, Provincia, Telefono FROM Egresado WHERE (IdEgresado = @IdEgresado)

select coalesce(MAX(IdEgresado),0) + 1 from dbo.Egresado

insert into dbo.Egresado(IdEgresado, Nombres, ApellidoPaterno, ApellidoMaterno, DNI, FechaNacimiento,Direccion, Departamento, Provincia, Distrito, Telefono, Celular, Email, AñoEgreso, Estado, FechaRegistro, IdUsuarioRegistrador)

values(@IdEgresado, @Nombres, @ApellidoPaterno, @ApellidoMaterno, @DNI, @FechaNacimiento, @Direccion,
	@Departamento, @Provincia, @Distrito, @Telefono, @Celular, @Email, @AñoEgreso, @Estado,                    GETDATE(), @IdUsuario)

update dbo.Egresado
            set Nombres = @Nombres, ApellidoPaterno = @ApellidoPaterno, ApellidoMaterno = @ApellidoMaterno,             DNI = @DNI, FechaNacimiento = @FechaNacimiento, Direccion = @Direccion, 
            Departamento = @Departamento, Provincia = @Provincia, Distrito = @Distrito, Telefono = @Telefono,                    Celular = @Celular, Email = @Email, AñoEgreso = @AñoEgreso, Estado = @Estado
where IdEgresado = @IdEgresado





--Egresado Detalle

select ed.IdEgresado, ed.Correlativo, ed.Empresa, ed.Puesto, ed.Area, ed.InicioLaboral, ed.FinLaboral, 
ed.DescripcionTarea, ed.Estado, ed.FechaRegistro, ed.IdUsuarioRegistrador
from dbo.EgresadosDetalle  ed
          inner join dbo.Egresado e
                            on e.IdEgresado = ed.IdEgresado
where @IdEgresado = ed.IdEgresado

select (coalesce(MAX(Correlativo),0))+1 from dbo.EgresadosDetalle where IdEgresado = @IdEgresado

insert into dbo.EgresadosDetalle(IdEgresado, Correlativo, Empresa, Puesto, Area, InicioLaboral, FinLaboral, 
			DescripcionTarea, Estado, FechaRegistro, IdUsuarioRegistrador)
values(@IdEgresado, @Correlativo, @Empresa, @Puesto, @Area, @InicioLaboral, @FinLaboral,
	@DescripcionTarea, @Estado, GETDATE(), @IdUsuario)
	

update dbo.EgresadosDetalle
set Empresa = @Empresa, Puesto = @Puesto, Area = @Area, InicioLaboral = @InicioLaboral, 
      FinLaboral = @FinLaboral, DescripcionTarea = @DescripcionTarea, Estado = @Estado, FechaRegistro =       @FechaRegistro, IdUsuarioRegistrador = @IdUsuario
where IdEgresado = @IdEgresado and Correlativo = @Correlativo

--Usuario

SELECT IdUsuario, Nombre, Contrasena, FechaRegistro, Estado FROM dbo.Usuario
where @Nombre = Nombre and @Contrasena = Contrasena and Estado = 1