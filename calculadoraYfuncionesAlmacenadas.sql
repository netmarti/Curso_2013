DELIMITER $$

CREATE FUNCTION CALCULADORA(num1 int,num2 int, operador char(1))
RETURNS int(11)
BEGIN

IF operador='+' THEN
			RETURN sumaNumeros(num1 int,num2 int);

ELSEIF operador='-' THEN
			RETURN divideNumeros(num1 int,num2 int);

ELSEIF operador='*' THEN
			RETURN multiplicaNumeros(num1 int,num2 int);

ELSE operador='/' THEN
			RETURN divideNumeros(num1 int,num2 int);
END IF;
END;$$


OTRA VARIANCION DEL EJERCICIO:

DELIMITER $$

CREATE FUNCTION CALCULADORA(num1 int,num2 int, operador char(1))
RETURNS int(11)
BEGIN
DECLARE Resultado(int)
IF operador='+' THEN
			SET Resultado=sumaNumeros(num1 int,num2 int);

ELSEIF operador='-' THEN
			SET Resultado=restaNumeros(num1 int,num2 int);

ELSEIF operador='*' THEN
			SET Resultado=multiplicaNumeros(num1 int,num2 int);

ELSE operador='/' THEN
			SET Resultado=divideNumeros(num1 int,num2 int);
END IF;
RETURN Resultado
END;$$
