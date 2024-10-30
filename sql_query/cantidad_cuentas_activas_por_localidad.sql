use SGCGDB_TEST;

--cantidad de altas por mes/año
select year(c.FechaAlta) as año, month(c.FechaAlta) as mes, count(*) as cantidad_altas
from USU_Cuentas c
group by YEAR(c.FechaAlta), month(c.FechaAlta) 
order by  year(c.FechaAlta) desc , month(c.FechaAlta) asc

--cuentas activas por domicilio
select l.Nombre, count(*) as cantidad_de_cuentas_activas
from  (select f.idPersona from PER_Fisicas f ) as f
inner join (select c.idPersona, idEstadoFinanciero, idEstadoOperativo from USU_Cuentas c) as c on f.idPersona=c.idPersona
inner join (select o.idEstado from USU_EN_EstadosOperativosCuenta o) as o on c.idEstadoOperativo=o.idEstado
inner join (select e.idEstado from USU_EN_EstadosFinancierosCuenta e) as e on c.idEstadoFinanciero=e.idEstado
inner join (select p.idPersona, p.idDomicilio from PER_Personas p) as p on f.idPersona=p.idPersona
inner join (select d.idDomicilio, d.idLocalidad, d.Actual from ROOT_Domicilios d) as d on p.idDomicilio = d.idDomicilio
inner join (select l.idLocalidad, l.Nombre from GEN_Localidades l) as l on d.idLocalidad = l.idLocalidad
where 
d.Actual=1 and --domicilio actual
o.idEstado=1 and --estado opearativo activo
e.idEstado=1 --estado financiero activo
group by l.Nombre



