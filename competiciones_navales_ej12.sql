SELECT DISTINCT b.bcod,b.nombre
FROM barco b,competicion c
WHERE 2<=(SELECT COUNT(r.rcod)
			FROM regata r
			WHERE b.bcod=r.ganador AND r.anyo=c.anyo AND r.ccod=c.ccod);
