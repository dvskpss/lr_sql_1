/*Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.*/

-- найдем 10 самых молодых пользователей

select users_id as find_users_id from profiles group by users_id order by birthday desc limit 10;

-- извлечем лайки, полученные молодыми пользователями

select
	count(*)
from
	likes
where
	to_users_id IN(
	select
		*
	from
		(
		select
			users_id as find_users_id
		from
			profiles
		group by
			users_id
		order by
			TIMESTAMPDIFF(DAY,
			birthday,
			NOW())
		limit 10) t);