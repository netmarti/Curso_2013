DELIMITER $$
DROP TRIGGER modificar_interpreta$$

CREATE TRIGGER modificar_interpreta
BEFORE UPDATE ON interpreta
FOR EACH ROW

BEGIN

UPDATE concierto SET num_obras=num_obras + 1

WHERE id_concierto=NEW.id_concierto;

UPDATE concierto SET num_obras=num_obras -1
WHERE id_concierto=OLD.id_concierto;


END;$$
