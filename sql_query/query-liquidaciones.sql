--create o alter function obtener_monto_total_liquidacion_usu
--(@corte int)
--as 
--begin
	
--end

select * from USU_Liquidaciones 

use SGCGDB_TEST;
--cantidad liquidaciones usuario por corte y monto total, ultimo año
select c.idCorte, count(*) as cantidad_liquidaciones_usuario_por_corte, sum(u.Monto) as monto_total_recaudado
from USU_Liquidaciones u 
inner join COM_Cortes c on u.idCorte = c.idCorte
where c.Anio = year(CURRENT_TIMESTAMP) 
group by c.idCorte

--cantidad de liquidacione de comercio y por corte
select c.idCorte, count(*) as cantidad_de_liquidaciones , sum(l.TotalAPagar) as total_a_pagar_sumaTotal
from COM_Cortes c 
inner join COM_Liquidaciones l on c.idCorte = l.idCorte
where c.Anio= year(CURRENT_TIMESTAMP) 
group by c.idCorte
order by c.idCorte



select * from USU_LiquidacionDatosAdicionales 

select * from COM_Liquidaciones
where FechaEmision > '2024-01-01'


select * from COM_LiquidacionesMensuales m
inner join USU_LiquidacionDatosAdicionales d on d.idLiquidacion = m.idLiquidacion

select * from COM_Cobros

select * from COM_LotesPagos

select * from COM_Pagos_FormasPago f
inner join COM_DatosDePago p on f.idDP=p.idDP
where f.FHEmision > '2024-01-01'


-- cantidad de pagos por comercio e importe total

select c.idComercio, count(*) as cantidad_pagos, sum(f.Importe) as importe_total
from COM_Comercios c 
inner join COM_Pagos p on c.idComercio = p.idComercio 
inner join COM_Pagos_FormasPago f on f.idPago = f.idPago
where f.FechaPago > '2024-01-01'
group by c.idComercio

--pagos por comercio y forma de pago
select c.idComercio, count(*) as cantidad_pagos, sum(f.Importe) as importe_total, e.Descripcion
from COM_Comercios c 
inner join COM_Pagos p on c.idComercio = p.idComercio 
inner join COM_Pagos_FormasPago f on f.idPago = f.idPago
inner join COM_EN_FormasDePago e on f.idFormaPago= e.idFormaDePago
where f.FechaPago > '2024-01-01'
group by c.idComercio,e.Descripcion

