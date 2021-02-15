/*Подсчитайте средний возраст пользователей в таблице users.*/

select ROUND(AVG((TO_DAYS(now()) - TO_DAYS(birthday_at)) / 365.25), 2) as avg_age from users;