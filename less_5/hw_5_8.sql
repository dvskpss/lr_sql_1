/*
(по желанию) Подсчитайте произведение чисел в столбце таблицы.
*/


select id from users;
-- ln(x) + ln(y) = ln(x*y) и e^ln(x*y) = x*y
SELECT exp(SUM(LN(id))) FROM users;