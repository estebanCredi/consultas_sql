use SGCGDB_TEST;
go
select count(*) as cantidad_de_cuentas, e.Descripcion
from PER_Fisicas f
inner join USU_Cuentas c on f.idPersona = c.idPersona
inner join USU_EN_EstadosOperativosCuenta e on e.idEstado = c.idEstadoOperativo
group by e.Descripcion
