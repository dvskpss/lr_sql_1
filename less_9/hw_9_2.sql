/*Создайте представление, которое выводит название name товарной позиции из таблицы
products и соответствующее название каталога name из таблицы catalogs.*/

use shop;


create view prod_and_cat as
select
	p.name as prod_name,
	c.name as cat_name
from
	products p
join catalogs c on
	p.catalog_id = c.id;

select * from prod_and_cat;