SELECT b.bcod,b.nombre
FROM barco b
WHERE NOT EXISTS(SELECT *
						FROM competicion c
						WHERE c.nombre='Copa Louis Vuitton'
						AND NOT EXISTS(SELECT *
											FROM participa p,regata r
											WHERE r.anyo=c.anyo AND p.rcod=r.rcod AND p.bcod=b.bcod)
						AND EXISTS(SELECT *
										FROM competicion c
										WHERE c.nombre='Copa Louis Vuitton'));
