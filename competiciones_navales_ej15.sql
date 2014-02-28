SELECT b.bcod,b.nombre, COUNT(*)
FROM barco b,tripulante t
WHERE b.bcod=t.bcod
GROUP BY b.bcod,b.nombre
HAVING COUNT(*)=(SELECT MAX(COUNT(*))
						FROM tripulante t
						GROUP BY t.bcod);
