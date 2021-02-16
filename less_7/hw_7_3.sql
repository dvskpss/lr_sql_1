/*
(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
*/

drop table if exists flights;
create table if not exists flights( 
	id serial primary key,
	`from` text,
	`to` text
);

insert flights (`from`, `to`) values
('moskow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moskow', 'kazan');

drop table if exists cities;
create table if not exists cities( 
	`label` text,
	`name` text
);

insert cities values
('moskow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

select * from flights;
select * from cities;

select
	flights.id,
	c1.name,
	c2.name
from
	flights
join cities c1
join cities c2 on
	flights.from = c1.label
	and flights.to = c2.label
order by flights.id; 







