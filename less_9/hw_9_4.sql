/*(по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте
запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих
записей.*/


drop table if exists dates;
create table if not exists dates( 
	created_at DATE
);

insert
	dates
values 
('2018-08-01'),
('2018-08-04'),
('2018-08-16'),
('2018-08-17'),
('2018-08-18'),
('2018-08-19'),
('2018-08-20'),
('2018-08-21');


delete from dates where 
	created_at not in ( select * from ( select * from dates order by created_at desc limit 5 ) subtable );

select * from dates order by created_at desc;
