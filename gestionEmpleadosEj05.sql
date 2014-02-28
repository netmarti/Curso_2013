SELECT e.nombreEmp AS "Nombre del empleado", e.puesto
FROM empleados e 
WHERE (e.departamento=10 OR e.departamento=20) 
AND (e.nombreEmp LIKE '%I%' 
						OR e.puesto LIKE '%ER%');
