/*
Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/

select
	gender,
	count(likes.users_id) as max_likes
from
	likes,
	profiles
where
	likes.users_id = profiles.users_id
group by
	gender
order by
	max_likes desc
limit 1;