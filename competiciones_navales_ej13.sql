SELECT b.bcod AS "Código del barco ",b.nombre AS "Nombre del barco",
COUNT(t.tcod) AS "Número de participantes"
FROM barco b LEFT JOIN tripulante t ON b.bcod=t.bcod
WHERE b.bcod IN(SELECT p.bcod
					 FROM participa p,regata r,competicion c
					 WHERE r.ccod=c.ccod AND c.nombre="Copa Louis Vuitton"
									  		   AND p.rcod=r.rcod
									  		   AND r.anyo=2007)
GROUP BY b.bcod,b.nombre;
