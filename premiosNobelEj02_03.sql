 select n1.nombre, p1.cod
from nominado n1, premiado p1
where n1.cod=p1.cod
group by p1.cod
having count(*)>1
