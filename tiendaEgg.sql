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
SELECT nombre, precio FROM producto p ORDER BY precio LIMIT 1;

/*11. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER
BY y LIMIT)*/

SELECT nombre, precio FROM producto p ORDER BY precio DESC LIMIT 1;

/*12. Lista el nombre de los productos que tienen un precio menor o igual a $120.*/
SELECT nombre, precio FROM producto p 
WHERE precio >120;

/*13. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador
BETWEEN*/
SELECT nombre, precio FROM producto p 
WHERE precio
BETWEEN 60 AND 200
ORDER BY precio;

/*14. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador
IN.*/
SELECT nombre, codigo_fabricante  FROM producto p 
WHERE codigo_fabricante  IN (1,3,5);

/*15. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil
en el nombre*/
SELECT nombre FROM producto p 
WHERE nombre LIKE 'portátil%';

/*Consultas Multitabla
1. Devuelve una lista con el código del producto, nombre del producto, código del fabricante
y nombre del fabricante, de todos los productos de la base de datos.
 */
SELECT p.codigo , p.nombre, p.codigo_fabricante , f.nombre  FROM producto p, fabricante f 
WHERE p.codigo = f.codigo ;

/*2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos
los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por
orden alfabético.*/
SELECT p.nombre , p.precio , f.nombre  FROM producto p
INNER JOIN fabricante f ON p.codigo = f.codigo 
ORDER BY f.nombre ASC ;

/*3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto
más barato*/
SELECT p.nombre , p.precio , f.nombre  FROM producto p 
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC LIMIT 1;

/*4. Devuelve una lista de todos los productos del fabricante Lenovo*/
SELECT  f.nombre , p.nombre AS 'Productos Lenovo' FROM fabricante f, producto p  
WHERE p.codigo = f.codigo
AND f.nombre = 'Lenovo';

/*5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio
mayor que $200*/
SELECT f.nombre , p.nombre, p.precio  FROM fabricante f , producto p 
WHERE p.codigo_fabricante = f.codigo 
AND p.precio >200;

/*6. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard.
Utilizando el operador IN
---OTRA FORMA!!
select p.codigo, p.nombre 'Producto Nombre', p.precio 'Precio', f.nombre 'Fabricante'
from producto p
join fabricante f
on p.codigo_fabricante = f.codigo
where f.nombre
in ('Asus', 'Hewlett-Packard')
order by precio;
**/
SELECT p.nombre, f.nombre  FROM fabricante f,producto p  
WHERE p.codigo = f.codigo
AND f.nombre IN ('Asus', 'Hewlett-Packard');

/*7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos
los productos que tengan un precio mayor o igual a $180. Ordene el resultado en primer
lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden
ascendente)*/
SELECT P.nombre , P.precio , F.nombre AS 'fabricante' FROM producto p 
JOIN fabricante f ON P.codigo = F.codigo 
WHERE precio >= 180 
ORDER BY precio DESC , p.nombre ASC ;

/*Consultas Multitabla
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.*/

/*1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos
fabricantes que no tienen productos asociados.*/
SELECT f.nombre 'Fabricante' , p.nombre 'productos' FROM fabricante f 
right JOIN producto p ON f.codigo = p.codigo ;

/*2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún
producto asociado.*/
SELECT p.nombre 'Productos', f.nombre 'Fabricantes' FROM producto p 
left JOIN fabricante f ON p.codigo = f.codigo   ;

SELECT p.nombre 'Productos', f.nombre 'Fabricantes' FROM fabricante f 
right JOIN producto p  ON f.codigo = p.codigo ;

/*Subconsultas (En la cláusula WHERE)

Con operadores básicos de comparación
1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
SELECT p.nombre 
FROM producto p 
WHERE codigo_fabricante in (
    SELECT f.codigo 
    FROM fabricante f 
    WHERE f.nombre = 'Lenovo'
);

/*2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto
más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).*/


SELECT *
FROM producto p 
WHERE precio = (
    SELECT MAX(p.precio)
    FROM producto
    WHERE p.codigo_fabricante  = (
        SELECT f.codigo 
        FROM fabricante f 
        WHERE f.nombre = 'Lenovo' 
    )
);

/*Subconsultas (En la cláusula HAVING)
1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número
de productos que el fabricante Lenovo.*/
-- CUANTOS PROD TIENE LENOVO?
SELECT f.nombre 'fabricantes' FROM fabricante f, producto p  
WHERE f.codigo = p.codigo 


SELECT f.nombre 'Fabricante con + prod que Lenovo', p.nombre 'productos' 
FROM producto p, fabricante f
WHERE (SELECT COUNT(*) 
        FROM fabricante 
        WHERE nombre = 'Lenovo') < (SELECT COUNT(*) FROM fabricante) ORDER BY f.nombre ;

    



