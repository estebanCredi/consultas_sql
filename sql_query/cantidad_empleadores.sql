select l.idEmpleador, count(*) as cantidad_de_empleadores
from PER_DatosLaborales l
inner join USU_Empleadores e on l.idEmpleador = e.idEmpleador 
group by l.idEmpleador, e.RazonSocial