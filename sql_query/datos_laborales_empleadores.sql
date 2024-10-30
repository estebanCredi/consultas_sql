select l.*, p.Nombre, p.CodigoAFIP, p.Activo
from GEN_Localidades l inner join GEN_Provincias p  on l.idProvincia = p.idProvincia


select * from USU_Empleadores

select * from USU_EmpleadoresObservaciones

select * from ROOT_Observaciones

select * 
from USU_Empleadores e 
inner join  USU_EmpleadoresObservaciones o on e.idObservacion = o.idObservacion
inner join ROOT_Observaciones r on r.idObservacion=o.idObservacion


--Datos laborales de Empleadores 
SELECT
    USU_Cuentas.idCuenta,
    PER_Fisicas.NombresYApellidos,
    PER_DatosLaborales.CargoOFuncion,
    e.RazonSocial,
	e.idRL,
	r.Descripcion
	
 FROM
    USU_Cuentas , PER_Fisicas, PER_DatosLaborales, USU_Empleadores e, USU_RubrosLaborales r
WHERE
USU_Cuentas.idEstadoFinanciero=1 AND
USU_CUENTAS.idEstadoOperativo=1 AND
USU_Cuentas.idPersona = PER_Fisicas.idPersona AND
USU_Cuentas.idPersona = PER_DatosLaborales.idPersona AND
PER_DatosLaborales.idEmpleador = e.idEmpleador AND
PER_DatosLaborales.Actual =1 and
(e.idRL = r.idRL or e.idRL is null)

