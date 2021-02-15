/*
Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
*/

-- критерием выберу сумму написанных сообщений и поставленных лайков

select
	CONCAT_WS(' ', firstname, lastname),
	COUNT(likes.users_id) + COUNT(messages.from_users_id) as activity
from
	profiles, likes, messages
where
	profiles.users_id = likes.users_id and profiles.users_id = messages.from_users_id
group by 
	firstname, lastname
order by 
    activity desc 
limit 10;