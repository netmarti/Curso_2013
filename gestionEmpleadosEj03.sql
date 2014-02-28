SELECT concat(e.nombreEmp,' trabaja como ',e.puesto) AS "Trabajador y puesto"
FROM empleados e
WHERE e.departamento=10;
