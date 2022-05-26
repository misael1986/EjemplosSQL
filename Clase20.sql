use libreria;
select * from libro;

SELECT * FROM libro WHERE libId=1003;-- sigma libId==1003(libro) 
-- Selecciona todos l os a tributos de l os l ibros que f ueron p ublicados despues de 1960
SELECT * FROM libro WHERE libPub > 1960;-- sigma libId>1003(libro) 
SELECT * FROM libro WHERE libNombre LIKE "%los%" ;
-- S elecciona todos l os a tributos de l os l ibros que i nicien con l a l etra "C" y no t ienenl a cadena " l os " .
SELECT * FROM libro WHERE libNombre LIKE "C%" and libNombre NOT LIKE "%los%" ;


SELECT * FROM libro WHERE libNombre LIKE "%sol%" ;
SELECT * FROM libro WHERE libNombre LIKE "%a_os%" ;
SELECT * FROM libro WHERE length(libNombre) > 8 ;
SELECT * FROM libro WHERE lower(libNombre) LIKE "maría" ;

SELECT * FROM libro ORDER BY libPub DESC LIMIT 3 ;

SELECT libId , libNombre , libPub FROM libro WHERE libPub > 1960;
SELECT * FROM libro WHERE libPub > 1960;

SELECT max(libPub) FROM libro ;

SELECT AVG( libPrecio ) FROM libro ;

SELECT count(libId ) from libro ;

SELECT libNombre FROM libro WHERE libPrecio = ( SELECT max(libPrecio ) FROM libro );
select libNombre from libro order by libPrecio desc limit 1;

select * from venta;
SELECT libId , count(vtaId ) as 'cantidad' FROM venta GROUP BY ( libId ) ;
SELECT libId , count(vtaId ) FROM venta GROUP BY ( libId ) HAVING count(vtaId ) >= 3 ;

-- S elecciona e l nombre d el l ibro con i dentificador 1003 y l o renombra por tit ulo
SELECT libNombre AS titulo FROM libro WHERE libId=1003;
-- S elecciona e l i dentificador y e l nombre de l os l ibros que f ueron p ublicados despues de 1960, y l os renombra .
SELECT libId AS "Código del libro" , libNombre AS "Título " FROM libro WHERE libPub > 1960;

SELECT count(*) FROM libro , autor ;

SELECT 
libro.libNombre as 'Nombre del Libro' , 
concat(autNombre ,' ',autor.autApellido) as 'Autor', 
libro.autId 
FROM libro , autor 
WHERE libro.autId = autor.autId ;

SELECT * FROM libro JOIN autor using ( autId ) ;

SELECT libNombre , autNombre , autApellido FROM libro JOIN autor using ( autId ) ;

SELECT libNombre , ediNombre , autNombre , autApellido 
FROM libro NATURAL JOIN editorial NATURAL JOIN autor ;