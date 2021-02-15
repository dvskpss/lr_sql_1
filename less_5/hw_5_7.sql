/*
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
SELECT birthday_at, STR_TO_DATE(CONCAT('2020-', MONTH(birthday_at), '-', DAY(birthday_at)), '%Y-%m-%d') FROM users;
SELECT 
	DATE_FORMAT(STR_TO_DATE(CONCAT('2020-', MONTH(birthday_at), '-', DAY(birthday_at)), '%Y-%m-%d'), '%W') AS dt,
	COUNT(birthday_at) AS cnt
FROM users
GROUP BY dt;