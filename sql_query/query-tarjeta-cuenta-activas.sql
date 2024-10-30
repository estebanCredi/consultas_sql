use SGCGDB_TEST;

select * 
from USU_Liquidaciones l
inner join COM_Cortes c on l.idCorte = c.idCorte


select * from USU_Tarjetas

select * from USU_EN_EstadosTarjetas

--cuentas activas y con tarjeta en estado activo
select count(*) as cantidad_de_cuentas_activas
from USU_Cuentas_Personas f 
inner join USU_Cuentas c on f.idPersona=c.idPersona
inner join USU_Tarjetas t on t.idTarjeta= f.idTarjeta
where  
c.idEstadoOperativo=1 --estado opearativo activo
and c.idEstadoFinanciero=1 --estado financiero activo
and t.idEstado=1

--cuentas activas ordenadas por estado de su tarjeta
select  t.idEstado, count(*) as cantidad_de_cuentas_activas
from USU_Cuentas_Personas f 
inner join USU_Cuentas c on f.idPersona=c.idPersona
inner join USU_Tarjetas t on t.idTarjeta= f.idTarjeta
where  
c.idEstadoOperativo=1 --estado opearativo activo
and c.idEstadoFinanciero=1 --estado financiero activo
group by t.idEstado



-- cantidad de cuentas activas
select count(*) as cantidad_de_cuentas_activas
from USU_Cuentas c
where  
c.idEstadoOperativo=1 --estado opearativo activo
and c.idEstadoFinanciero=1 --estado financiero activo

select * from USU_EN_EstadosFinancierosCuenta

select * from USU_EN_EstadosOperativosCuenta



--cantidad de tarjeta activada
select count(*) as cantidad_de_tarjeta_activada
from USU_Tarjetas t
where t.idEstado = 1

select count(*) as cantidad_de_tarjeta_generada
from USU_Tarjetas t
where t.idEstado = 3

select count(*) as cantidad_de_tarjetas
from USU_Tarjetas

select idEstado, count(*) as cantidad_de_tarjetas
from USU_Tarjetas t 
group by t.idEstado
order by t.idEstado







--movimientos por fecha
select * 
from  USU_Cuentas c 
inner join USU_Cuentas_Personas p on c.idPersona = p.idPersona
inner join USU_Tarjetas t on t.idTarjeta = p.idTarjeta
inner join USU_EN_EstadosTarjetas e  on t.idEstado= e.idEstado
where e.idEstado=1 



select * 
from USU_Liquidaciones l
where l.Monto = 0 and idCorte > 250


