/*В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте
транзакции.*/

drop database if exists test_shop;
create database if not exists test_shop;
use test_shop;

create table users(id INT, name VARCHAR(255));
insert users values (1, 'Anna'), (2, 'Bella'), (3, 'Clavdia');
select * from users;

drop database if exists test_sample;
create database if not exists test_sample;
use test_sample;
create table users(id INT, name VARCHAR(255));
select * from test_sample.users;

SET AUTOCOMMIT = 0;

start transaction;

insert
	test_sample.users (id, name)
select
	*
from
	test_shop.users
where
	users.id = 1; 

delete from test_shop.users where id = 1;

commit;

select * from test_shop.users;
select * from test_sample.users;
