
select * from TES_Cajas c where c.FHApertura > '2024-01-01'

-- cobranzas externas  
select o.Descripcion, count(*) as cantidad_archivos, sum(c.ImporteTotal) as importe_total
from TES_LotesCobranzasExternas c
inner join TES_EN_OrigenesCobros o on c.idOrigen = o.idOrigen
where FHArchivo > '2024-01-01'
group by o.Descripcion 

select * from TES_EN_OrigenesCobros

-- importaciones con problemas por origen
select  o.Descripcion, count(*) as cantidad_importaciones_con_problemas, sum(l.Importe) as importe_total 
from TES_LotesCobranzasExternasItemsConProblemas l
inner join TES_LotesCobranzasExternas c on c.idImportacion= l.idImportacion
inner join TES_EN_OrigenesCobros o on c.idOrigen = o.idOrigen
where l.Fecha > '2024-01-01'
group by  o.Descripcion

select count(*) cantidad_importaciones_con_problemas
from TES_LotesCobranzasExternasItemsConProblemas
where Fecha > '2024-01-01'


--cobranzas externas cantidad de archivos y errores
begin
select o.Descripcion, count(*) as cantidad_archivos, sum(c.ImporteTotal) as importe_total, 
count(all p.idImportacion) as cantidad_de_archivos_con_error, 
case when (sum(p.Importe) is null) then 0  else sum(p.Importe) end as importe_total_de_archivos_con_error
from TES_LotesCobranzasExternas c
inner join TES_EN_OrigenesCobros o on c.idOrigen = o.idOrigen
left join TES_LotesCobranzasExternasItemsConProblemas p on c.idImportacion = p.idImportacion
where FHArchivo > '2024-01-01'
group by o.Descripcion 
end;

select* 
from TES_LotesCobranzasExternas c
left join TES_LotesCobranzasExternasItemsConProblemas p on c.idImportacion = p.idImportacion


select * from PER_Fisicas

select * from PER_Personas

select * from PER_DatosComplementarios

select * from PER_DatosContacto

select * from USU_Empleadores

select * from PER_DatosLaborales

select * from USU_Empleadores where NombreFantasia like '%SIN ASIGNAR NO TOCAR%'

-- cantidad de empleados por razon social
select e.RazonSocial , count(*) as cantidad_empleados
from PER_Fisicas f 
inner join PER_DatosLaborales l on f.idDL=l.idDL
inner join USU_Empleadores e on e.idEmpleador =l.idEmpleador
group by e.RazonSocial
having count(*) > 100
order by cantidad_empleados desc

-- cantidad de empleados por razon social - consulta optimizada
select e.RazonSocial , count(*) as cantidad_empleados
from ( select f.idDL from PER_Fisicas f) as f
inner join (select l.idDL, l.idEmpleador from PER_DatosLaborales l) as l on f.idDL=l.idDL
inner join (select e.idEmpleador, e.RazonSocial from USU_Empleadores e) as e on e.idEmpleador =l.idEmpleador
group by e.RazonSocial
having count(*) > 100
order by cantidad_empleados desc


