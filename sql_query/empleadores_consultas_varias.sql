use SGCGDB_TEST;

select a.Activo, a.Descripcion as descripcion_actividad_laboral,
		e.CUIT,e.idEmpleador,e.RazonSocial,e.NombreFantasia,
		l.Activo as activo_rubro_laboral, l.Descripcion as descripcion_rubro_laboral
from USU_ActividadesLaborales a 
inner join USU_Empleadores e on a.idAL = e.idAL 
inner join USU_RubrosLaborales l on l.idRL = e.idRL


select count(*) as cantidad_empleadores, l.Descripcion as descripcion_rubro
from USU_ActividadesLaborales a 
inner join USU_Empleadores e on a.idAL = e.idAL 
inner join USU_RubrosLaborales l on l.idRL = e.idRL
group by l.Descripcion

select l.idEmpleador, count(*) as cantidad_de_empleados
from PER_DatosLaborales l
group by idEmpleador


select count(distinct (idEmpleador)) as cantidad_empleadores
from USU_Empleadores

-- cantidad de cuentas por estado
select count(*) as cantidad_cuentas, e.Descripcion
from PER_Fisicas f
inner join USU_Cuentas c on f.idPersona = c.idPersona
inner join USU_EN_EstadosOperativosCuenta e on e.idEstado = c.idEstadoOperativo
group by e.Descripcion

select * from COM_Comercios

use SGCGDB_TEST;

select * from USU_Liquidaciones l

select l.idCuenta ,l.PDFFileName from USU_Liquidaciones l

select * from USU_LiquidacionDatosAdicionales

select * from COM_Cortes c where c.Mes=8 and c.Anio=2024

--l.idCuenta ,l.PDFFileName, l.idCorte
select * 
from (select   * from USU_Liquidaciones l) as l 
inner join (select * from COM_Cortes c where c.Mes=7 and c.Anio=2024) as c on c.idCorte = l.idCorte 

select * from ROOT_Domicilios