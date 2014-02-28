select n.cod, n.nombre
from nominado n, premiado p
where n.cod=p.cod
group by n.cod;
;
