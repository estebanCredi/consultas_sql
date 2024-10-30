select * from VEN_Cupones v
where v.FH between '2024-01-01' and '2025-01-01'

use SGCGDB_TEST;
select * from COM_Liquidaciones l
where l.FH between '2024-01-01' and '2025-01-01'
and l.TipoLiquidacion like 'MEN'


select * 
from COM_Cortes c 
inner join VEN_Cupones v on c.idCorte = v.idCorteInicialCOM
inner join USU_Cuentas u on v.idCuenta=u.idCuenta
inner join PER_Fisicas f on f.idPersona= u.idPersona
inner join USU_EN_EstadosOperativosCuenta o on u.idEstadoOperativo=o.idEstado
inner join USU_EN_EstadosFinancierosCuenta e on u.idEstadoFinanciero=e.idEstado


select * from USU_Liquidaciones l
where l. idCorte > 250