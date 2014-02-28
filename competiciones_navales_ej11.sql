SELECT b.bcod,b.nombre
FROM barco b
WHERE 5<(SELECT COUNT(t.tcod)
			FROM tripulante t
			WHERE t.bcod=b.bcod);
