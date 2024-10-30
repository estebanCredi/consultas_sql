use SGCGDB_TEST ;

select * from COM_Sucursales s inner join COM_Comercios c on (s.idComercio = c.idComercio) where c.FechaAlta > '2024-01-01'
