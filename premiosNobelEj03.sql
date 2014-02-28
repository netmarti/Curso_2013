select n.cod, n.nombre
from nominado n
where n.cod in (select *
						 from nominado n1, premiado p1
					 	 where n1.cod=p1.cod)
group by n.cod
having sum(n.cod)>1
;
					 
