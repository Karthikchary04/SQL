

sp_renamedb sample1,abc

sp_rename  student,studentinfo


select * from studentinfo

select * from studentinfo where name is null
select * from studentinfo where name is not null

select * from studentinfo where name ='aaa'


select city from studentinfo


select distinct city from studentinfo

select count(city) from studentinfo


select count(distinct city) from studentinfo



select * from studentinfo

select city,sum(marks) as total from studentinfo group by city having sum(marks)>=400; 


select * from studentinfo
select * from studentinfo order by marks desc

select top(1) * from studentinfo order by marks desc

select * from studentinfo order by marks desc
select * from studentinfo order by marks desc offset 2 rows fetch first 3 rows only
-----------------------------------------------------------------------------------------

create schema sales

create table sales.salespeople (snum int primary key,sname varchar(20),city varchar(20))


select * from salespeople

select * from sales.salespeople


grant select on sales.salespeople to usrename

drop schema sales.

select * from salespeople
select * from customer
select *from  orders

select s.snum from salespeople s join customer c on s.snum=c.snum where c.cnum in (select cnum from customer where cnum not in (select c.cnum from customer c join orders o on c.cnum=o.cnum))

select snum from customer where cnum not in (select c.cnum from customer c join orders o on c.cnum=o.cnum)


select * from salespeople s join customer c on s.snum=c.snum where c.cnum in (select cnum from customer where cnum not in (select c.cnum from customer c join orders o on c.cnum=o.cnum))

select * from customer where cnum not in (select c.cnum from customer c join orders o on c.cnum=o.cnum)

select * from salespeople s join customer c on s.snum=c.snum where cnum not in (select c.cnum from customer c join orders o on c.cnum=o.cnum)


select * from salespeople s join customer c on s.snum=c.snum

select * from salespeople s left join customer c on s.snum=c.snum

select * from salespeople s right join customer c on s.snum=c.snum

select * from salespeople s full join customer c on s.snum=c.snum

select * from salespeople s left join customer c on s.snum=c.snum where c.cnum is null

select * from salespeople s left join customer c on s.snum=c.snum where s.snum not in c.snum

 




