SELECT e.nombreEmp, e.salario,
case when e.salario <=2000 then 'Sueldo insuficiente'
when e.salario>=4000 then "salario excesivo"
else 'OK'
end as status FROM empleados e
