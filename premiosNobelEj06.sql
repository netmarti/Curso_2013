select j.jurado_id, j.nombre, c.anyo
from jurado j, comite c
where j.jurado_id=c.jurado_id
order by c.anyo
