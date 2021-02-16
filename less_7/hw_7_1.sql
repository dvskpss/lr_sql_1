/*Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/

select * from orders;

select name from users where exists(select * from orders where orders.user_id = users.id);
-- или
select user_id, (select name from users where id = user_id), count(*) from orders group by user_id;
-- или
select distinct o.user_id, u.name from orders o join users u on o.user_id = u.id;
-- или
select name from users where users.id IN(select orders.user_id from orders);

