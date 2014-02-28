select n.cod, n.nombre
from nominado n
where not exists (select * 
						from nominado n1, premiado p
						where n.cod=p.cod);
