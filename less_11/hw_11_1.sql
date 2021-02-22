/*
Создайте таблицу logs типа Archive. 
Пусть при каждом создании записи в таблицах users, catalogs и products 
в таблицу logs помещается время и дата создания записи, 
название таблицы, идентификатор первичного ключа и содержимое поля name.
*/


USE shop;

DROP TABLE IF EXISTS shop.logs;

CREATE TABLE IF NOT EXISTS shop.logs (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    tbl VARCHAR(50) NOT NULL,
    pk_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255)
) ENGINE = Archive;

DROP TRIGGER IF EXISTS log_users;
DROP TRIGGER IF EXISTS log_products;
DROP TRIGGER IF EXISTS log_catalogs;

DELIMITER //
CREATE TRIGGER log_users AFTER INSERT 
ON users FOR EACH ROW
BEGIN
  INSERT INTO logs (tbl, pk_id, name) VALUES ("users", NEW.id, NEW.name);
END//

CREATE TRIGGER log_products AFTER INSERT 
ON products FOR EACH ROW
BEGIN
  INSERT INTO logs (tbl, pk_id, name) VALUES ("products", NEW.id, NEW.name);
END//

CREATE TRIGGER log_catalogs AFTER INSERT 
ON catalogs FOR EACH ROW
BEGIN
  INSERT INTO logs (tbl, pk_id, name) VALUES ("catalogs", NEW.id, NEW.name);
END //
DELIMITER ;


INSERT INTO users (name, birthday_at) VALUES ("Anna", "2000-01-02");
INSERT INTO catalogs (name) VALUES ("Фотоаппараты");
INSERT INTO products (name, description, price, catalog_id) VALUES ("XXX", "YYY", 9999, 6);

select * from logs;

