USE egg;


SELECT * FROM empleados ;
SELECT * FROM departamentos;
SELECT nombre_depto  FROM departamentos ;
SELECT nombre,sal_emp AS salario FROM  empleados e ;
SELECT comision_emp AS comisiones FROM empleados e ;
SELECT * FROM empleados e  WHERE cargo_emp='Secretaria';
SELECT * FROM empleados e WHERE cargo_emp ='Vendedor' ORDER BY nombre ;
SELECT nombre, sal_emp AS salario FROM empleados e ORDER BY sal_emp  ; 

-- Obtener el nombre de o de los jefes que tengan su departamento situado en la ciudad
-- de “Ciudad Real
SELECT nombre_jefe_depto 
	FROM departamentos d WHERE ciudad = 'Ciudad Real'; 
/* Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las
respectivas tablas de empleados
 */
SELECT nombre AS 'Nombre', cargo_emp AS 'Cargo' FROM empleados e ;
/* Listar los salarios y comisiones de los empleados del departamento 2000, ordenado
por comisión de menor a mayor.
 */
SELECT comision_emp AS 'Comision', sal_emp AS 'Salario' 
FROM empleados e
	WHERE id_depto =2000 
	ORDER BY comision_emp;

/*
 * Obtener el valor total a pagar a cada empleado del departamento 3000, que resulta
de: sumar el salario y la comisión, más una bonificación de 500. Mostrar el nombre del
empleado y el total a pagar, en orden alfabético.*/

SELECT nombre, (sal_emp + comision_emp + 500)  
FROM  empleados e  
WHERE id_depto = 3000
ORDER BY nombre ;

/*
 * Muestra los empleados cuyo nombre empiece con la letra J.
 */
SELECT nombre
FROM empleados e 
WHERE nombre LIKE 'J%';

/*
 * 14. Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos
empleados que tienen comisión superior a 1000.
*/
SELECT nombre, (sal_emp + comision_emp ) , sal_emp , comision_emp  
FROM empleados e 
WHERE comision_emp > 1000;

/*
15. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen
comisión.*/
SELECT nombre , sal_emp 
FROM empleados e 
WHERE NOT comision_emp ;
-- OTRA FORMA 
SELECT sal_emp ,  comision_emp , (sal_emp+comision_emp) as 'Salario Total', nombre
FROM empleados e 
WHERE comision_emp  = 0;

/*
 * Obtener la lista de los empleados que ganan una comisión superior a su sueldo*/
SELECT nombre AS 'Empleados con comision mayor a su sueldo' , comision_emp , sal_emp 
FROM empleados e 
WHERE comision_emp > sal_emp 


/*
17. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo. *
*/
SELECT nombre AS 'Empleados con comision menor al 30% de su sueldo', sal_emp , comision_emp 
FROM empleados e 
WHERE comision_emp <= (sal_emp*0.3); 

/*
 * 18. Hallar los empleados cuyo nombre no contiene la cadena “MA”*/
SELECT nombre FROM empleados e 
WHERE nombre NOT LIKE '%MA'

/*
 * 19. Obtener los nombres de los departamentos que sean “Ventas”, “Investigación” o
‘Mantenimiento.
 
--------ESTA FORMA ES INEFICIENTE SOLO MUESTRA VENTAS  Y NO MANTENIMIENTO COMO LA SIG
SELECT * FROM departamentos d 
WHERE nombre_depto LIKE 'Ventas' OR 'Investigación' OR 'Mantenimiento';
*/
SELECT * FROM departamentos d 
WHERE nombre_depto IN  ('Ventas', 'Investigación', ' Mantemiento');

/*
 * 21. Mostrar el salario más alto de la empresa.
 */

SELECT max(sal_emp) FROM empleados e;  

/*
22. Mostrar el nombre del último empleado de la lista por orden alfabético*/
SELECT max(nombre) FROM empleados e ;
-- otra forma
SELECT nombre FROM empleados e ORDER BY nombre DESC LIMIT 1 ;
/*
 * 23. Hallar el salario más alto, el más bajo y la diferencia entre ellos.*/
SELECT max(sal_emp) AS 'Maximo', min(sal_emp) AS 'Minimo', ( max(sal_emp) -(min(sal_emp) ) ) AS 'promedio' 
FROM empleados e ;

/*
 * 24. Hallar el salario promedio por departamento.*/
SELECT id_depto , round(avg(sal_emp), 2)  FROM empleados e  GROUP BY id_depto ;

/*
 * HAVING
 * 25. Hallar los departamentos que tienen más de dos empleados. Mostrar el número de
empleados de esos departamentos.
 */

SELECT id_depto AS 'Id dpto', count(*) AS 'cant'  FROM  empleados e 
GROUP BY id_depto  
 HAVING cant>2; 

/*
 * 26. Hallar los departamentos que no tienen empleados*/
-- VOLVERRRRRRRRRRR 
SELECT nombre_depto 
FROM departamentos d 
left JOIN empleados e 
on  e.id_depto  = d.id_depto 
  
HAVING  count(e.nombre)=2;


/* MULTITABLA JOIN (Uso de la sentencia JOIN/LEFT JOIN/RIGHT JOIN)
27. Mostrar la lista de empleados, con su respectivo departamento y el jefe de cada
departamento
 */

SELECT e.nombre , d.nombre_depto , d.nombre_jefe_depto  
FROM empleados e 
JOIN departamentos d 
ON e.id_depto  = d.id_depto ;







