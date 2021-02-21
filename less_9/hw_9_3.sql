/*по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены
разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и
2018-08-17. Составьте запрос, который выводит полный список дат за август, 
выставляя в соседнем поле значение 1, 
если дата присутствует в исходном таблице и 0, если она
отсутствует.*/

drop table if exists dates;
create table if not exists dates( 
	table_date DATE
);

insert dates values ('2018-08-01'), ('2016-08-04'), ('2018-08-16'), ('2018-08-17');

select * from dates;

drop procedure if exists aug_dates;

drop temporary table if exists tmp_aug;
create temporary table if not exists tmp_aug(table_date date);

delimiter \\
create procedure aug_dates()
begin
	declare i int default 0;
	set i = 1;
	while i <= 31 do
		insert tmp_aug values (concat('2018-08-', i));
		set i = i + 1;
	end while;
end
delimiter ;

call aug_dates();

select * from tmp_aug;

select t.table_date, d.table_date is not null from tmp_aug t left join dates d on t.table_date = d.table_date;   






