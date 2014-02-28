SELECT e.nombreEmp AS "Nombre del Empleado"
FROM empleados e
WHERE e.departamento=10 
		OR (e.departamento=20 
		AND e.salario<2000) 
		OR e.comision 
IS NOT NULL; 
