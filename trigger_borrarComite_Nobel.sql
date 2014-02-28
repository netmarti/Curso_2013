DELIMITER $$
DROP TRIGGER IF EXISTS borrar_comite;$$

CREATE TRIGGER borrar_comite
AFTER DELETE ON comite
FOR EACH ROW
BEGIN
DECLARE errormenor_5 CONDITION
FOR SQLSTATE'99001';

DECLARE num_jurados INT;


SELECT COUNT(*) INTO num_jurados
FROM comite
WHERE cat_id=OLD.cat_id AND OLD.anyo;


IF num_jurados<5 THEN 
  SIGNAL errormenor_5;
END IF;
END;$$
