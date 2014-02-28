SELECT t.nombre
FROM tripulante t
WHERE t.fecha >='2005-01-01' AND t.fecha <='2005-12-31'
AND t.bcod IS NULL;
