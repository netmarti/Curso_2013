SELECT n.numero,COUNT(*) AS "Monitores con mayor número de niños asignados" FROM nino n
GROUP BY numero
HAVING COUNT(*)>=ALL(SELECT COUNT(*)
FROM nino
GROUP BY numero)
