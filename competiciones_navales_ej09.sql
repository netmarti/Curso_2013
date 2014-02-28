SELECT DISTINCT b.bcod,b.nombre
FROM barco b,participa p
WHERE b.bcod=p.bcod
AND NOT EXISTS(SELECT *
					FROM tripulante t
					WHERE t.bcod=b.bcod);
