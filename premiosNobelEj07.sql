select p.cod_pais, p.nombre
from pais p, premiado pr
where  pr.cod in 
(select * from pais p1, nominado n1
where p1.cod_pais=n1.cod_pais)

INTERSECTS
 
(select *
from premiado pr, nominado n2
where pr.cod=n2.cod)
