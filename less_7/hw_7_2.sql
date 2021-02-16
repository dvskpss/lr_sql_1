/*Выведите список товаров products и разделов catalogs, который соответствует товару*/

select * from products;
select * from catalogs;

select p.*, c.name from products p join catalogs c on p.catalog_id = c.id;
-- или
select *, (select name from catalogs where products.catalog_id = id) from products;