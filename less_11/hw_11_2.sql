/*
(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/

DROP FUNCTION IF EXISTS shop.get_name;
DELIMITER //
CREATE FUNCTION shop.get_name() RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
    DECLARE i INT;
    DECLARE name VARCHAR(10);
    DECLARE str CHAR(26) DEFAULT "abcdefghijklmnopqrstuvwxyz";
	SET name = "";
	SET i = 1;
    do_str: LOOP
         SET name = CONCAT(name, SUBSTR(str, FLOOR(1 + RAND() * 26), 1));
         IF i > ROUND(2 + RAND() * 7) THEN
            LEAVE do_str;
         END IF;
         SET i = i + 1;
    END LOOP;
    RETURN name;
END//
DELIMITER ;

select shop.get_name();

DROP FUNCTION IF EXISTS shop.get_date;
DELIMITER //
CREATE FUNCTION shop.get_date() RETURNS DATE
    DETERMINISTIC
BEGIN
    RETURN NOW() - INTERVAL ROUND(RAND() * 10000) DAY;
END//
DELIMITER ;

select shop.get_date();


DROP PROCEDURE IF EXISTS shop.mill_insert;
DELIMITER //
CREATE PROCEDURE shop.mill_insert()
BEGIN
    DECLARE i INT;
	SET i = 1;
    do_insert: LOOP
         INSERT INTO shop.users (name, birthday_at) VALUES (get_name(), get_date());
         IF i > 1000000 THEN
            LEAVE do_insert;
         END IF;
         SET i = i + 1;
    END LOOP;
END//
DELIMITER ;


CALL shop.mill_insert();

SELECT COUNT(*) FROM shop.users;

