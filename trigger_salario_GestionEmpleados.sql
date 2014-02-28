DELIMITER $$
DROP TRIGGER IF EXISTS comprobacion_salario$$
CREATE TRIGGER comprobacion_salario BEFORE UPDATE ON empleados
FOR EACH ROW
BEGIN
IF NEW.salario < 0 THEN
SET NEW.salario =0;
ELSEIF NEW.salario > 100 THEN
SET NEW.salario = 100;
END IF;
END;$$

DELIMITER ; 
