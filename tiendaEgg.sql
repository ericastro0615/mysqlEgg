USE tienda;

SHOW tables;

/* 2. Lista los nombres y los precios de todos los productos de la tabla producto.*/
SELECT nombre , precio  FROM producto p ;

/*
3. Lista todas las columnas de la tabla producto.*/
DESCRIBE producto  ;
-- SHOW COLUMNS FROM producto p ; -------------- NO FUNCIONA!

/*4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando
el valor del precio*/
SELECT nombre, round((precio),0)  FROM producto p ;

/*5. Lista el código de los fabricantes que tienen productos en la tabla producto*/
SELECT codigo_fabricante  FROM producto p ;

/*6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar
los repetidos.*/
SELECT DISTINCT codigo_fabricante  FROM producto p ;
/*7. Lista los nombres de los fabricantes ordenados de forma ascendente.*/
SELECT nombre  FROM fabricante f ORDER BY nombre ;
/*8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma
ascendente y en segundo lugar por el precio de forma descendente*/
SELECT nombre FROM producto p  ORDER BY nombre ;
SELECT precio 	FROM producto p ORDER BY precio DESC ;
/*9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
SELECT * 	FROM fabricante f LIMIT 5 ;
/*10. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas
ORDER BY y LIMIT)*/


