/*
(по желанию) 
Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
Месяцы заданы в виде списка английских названий (may, august)
*/

select * from users;

select
	name,
	case
		when MONTH(birthday_at) = 05 then 'may'
		when MONTH(birthday_at) = 08 then 'aug'
		else 'temp'
	end as user_month
from users where MONTH(birthday_at) = 05 or MONTH(birthday_at) = 08;
		