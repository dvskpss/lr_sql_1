/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от
текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с
12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый
вечер", с 00:00 до 6:00 — "Доброй ночи".*/

USE shop;
DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello ()
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	IF NOW() BETWEEN STR_TO_DATE('00:00', '%H:%i') AND STR_TO_DATE('06:00', '%H:%i') THEN
        RETURN 'Доброй ночи';
	ELSEIF NOW() BETWEEN STR_TO_DATE('06:00', '%H:%i') AND STR_TO_DATE('12:00', '%H:%i') THEN
        RETURN 'Доброе утро';
    ELSEIF NOW() BETWEEN STR_TO_DATE('12:00', '%H:%i') AND STR_TO_DATE('18:00', '%H:%i') THEN 
    	RETURN 'Добрый день';
    ELSEIF NOW() BETWEEN STR_TO_DATE('18:00', '%H:%i') AND STR_TO_DATE('00:00', '%H:%i') THEN 
    	RETURN 'Добрый вечер';
  	END IF;
END//
DELIMITER ;

SELECT hello(), NOW();