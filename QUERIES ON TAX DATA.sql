select * from country
delete from country where gender='Gender'
select count(*) from country
update country set cob=' United-States' where cob='India'

select parents,count(parents) as orphans from country where parents in('Father only present','Not in universe','Mother only present','Neither parent present') group by parents

1.2 

create proc p2(@x as int) as  
begin
update country set age=age-2 
select count(age) as voters from country where age>=18
end;

exec p1 2
rollback 

1.4

create proc p2(@x as int) as
begin
select count(age) as voters from country where age
end;

select count(age) as count from country where age<18

select count(age) from country where age >18 and (select age from country where age in(select age+2 from country where age in(select age from country where age<18)))

select count(age) from country where age between 18 and 19


create proc p6(@x as int) as
begin
select count(age) from country where age in(select age from country where  age=age+@x)
end;
exec p6 3

select * from country

1.1.1 select edu,gender,count(edu) as count from country group by edu,gender order by edu 

1.1.2 select edu,count(edu) as count from country where works>0 group by edu

select gender,count(gender) from country group by gender 

select avg(count(gender)) from country where gender in(select count(gender) as count from country group by gender) 


2.1.1
create proc pension(@p as int) as
begin
select count(age)*3000 as pension from country where age<60 and age+@p>=60
end;
exec pension 3
select count(age) from country where age between 57 and 59

2.1.2
select parents,count(parents) as orphans from country group by parents having parents!=' Both parents present'

2.1.3
select count(gender) from country where gender=' Female' and works>0 and maritalstatus in(' Widowed',' Divorced')


2.1.4
create proc voters(@x as int) as
begin
select count(age) as voters from country where age<18 and age+@x>=18
end
exec voters 2


2.1.5
create proc seniors(@x as int) as 
begin
select count(age) from country where age<60 and age+@x>=60
end
exec seniors 5


3.1
select tax,sum(income) as total from country group by tax

3.2
select gender,sum(income) as total from country group by gender

3.3 

3.4
select cob,sum(income)/count(*) as PCI from country group by cob

3.5
select gender,sum(income)/count(*) as PCI from country group by gender

select citizen,count(citizen) from country group by citizen

select count(citizen) from country where works>0 and citizen=' Native- Born in the United States' 

select ((select count(gender) from country where gender=' Male')/2000)*100 as avgv from country 


04-02-2020:select * from country

sp_rename 'country.edu','education','column';

alter table country alter column education varchar(200)

1. select distinct (select count(*) as native from country where age>60 and citizen=' Native- Born in the United States'),(select count(*) as foreigner from country where age>60 and citizen!=' Native- Born in the United States') from country

2. select distinct (((select count(*) from country where  citizen!=' Native- Born in the United States' and works>0)*100)/(select count(*) from country where works>0)) from country

3. select sum(income) as income from country where citizen!=' Native- Born in the United States'

4. select edu,max(income) as topp,min(income) as low from country group by edu 

5.select edu,count(*) from country where age>23 group by edu order by edu 



select distinct 'kids'= (select count(age) as a from country where age between 1 and 10),
'teenagers'=(select count(age)  from country where age between 11 and 20), 
'youth'=(select count(age)  from country where age between 21 and 35),
'adults'=(select count(age) from country where age between 36 and 50), 
'senior_citizens' =(select count(age) from country where age between 51 and 70) 
 from country






from country





select count(cob) as citizens,count(cob) as nc from country where age>60 and cob=' United-States'  age>60 and cob!=' United-States'

select count(*) from country where ((select count(citizen) from country where works>0 and citizen!=' Native- Born in the United States')*100/(select count(*) from country where works>0))

select distinct ((select count(citizen) from country where works>0 and citizen!=' Native- Born in the United States')*100/(select count(*) from country where works>0)) as k

select sum(income) as money from 































select * from country where gender=' Female'




