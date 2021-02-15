/*Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, 
который больше всех общался с нашим пользователем.*/


-- найдем того, кому больше всех писали
select to_users_id, count(*) as msg_cnt from messages group by to_users_id order by msg_cnt desc;

/*to_users_id | msg_cnt
15 | 4
14 | 3
85 | 3
84 | 3
22 | 3*/

-- будем работать с пользователем id = 15
-- найдем тех, кто ему писал

select * from messages where to_users_id = 15;

/*id | from_users_id | to_users_id
20 | 88 | 15
33 | 88 | 15
64 | 5 | 15
65 | 35 | 15*/

-- как видим, 88 писал чаще, именно его мы и должны получить в результате запроса
select from_users_id from messages where to_users_id = 15 group by from_users_id order by count(*) desc limit 1;

/*from_users_id
88*/

-- готово!!:)






