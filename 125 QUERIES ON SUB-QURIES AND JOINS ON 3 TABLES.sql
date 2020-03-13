create table sal(snum int primary key,sname varchar(20)not null,city varchar(20)not null,commision decimal(4,2)not null)
select * from sal
insert into sal values(1001,'peel','london',0.12)
insert into sal values(1002,'serres','san jose',4.13)
insert into sal values(1004,'motika','london',8.11)
insert into sal values(1007,'rifkin','barcelona',6.15)
insert into sal values(1003,'axel rod','new york',2.10)
insert into sal values(1005,'fran','london',7.26)
update sal set city='null' where snum=1004
update sal set city='null' where snum=1005



create table cus(cnum int primary key,cname varchar(20) not null ,city varchar(20) not null,rating int not null,snum int not null)
select * from cus

insert into cus values (2001,'hoffman','london',100,1001)
insert into cus values (2002,'goivanni','rome',200,1002)
insert into cus values (2003,'liu','san jose',200,1002)
insert into cus values (2004,'grass','berlin',300,1007)
insert into cus values (2006,'clemens','london',100,1003)
insert into cus values (2008,'cisneros','san jose',300,1005)
update cus set city='null' where cnum=2006

drop table sal 

create table sal(snum int primary key,sname varchar(20)not null,city varchar(20)not null,commision decimal(4,2)not null FOREIGN KEY (snum) REFERENCES sal(snum))
 select * from sal
 insert into sal values(1001,'peel','london',0.12)
insert into sal values(1002,'serres','san jose',4.13)
insert into sal values(1004,'motika','london',8.11)
insert into sal values(1007,'rifkin','barcelona',6.15)
insert into sal values(1003,'axel rod','new york',2.10)
insert into sal values(1005,'fran','london',7.26)

update sal set city='null' where snum=1004
update sal set city='null' where snum=1005
drop table cus
create table cus(cnum int primary key,cname varchar(20) not null ,city varchar(20) not null,rating int not null,snum int not null  FOREIGN KEY (cnum) REFERENCES cus(cnum) )
select * from cus
insert into cus values (2001,'hoffman','london',100,1001)
insert into cus values (2002,'goivanni','rome',200,1002)
insert into cus values (2003,'liu','san jose',200,1002)
insert into cus values (2004,'grass','berlin',300,1007)
insert into cus values (2006,'clemens','london',100,1003)
insert into cus values (2008,'cisneros','san jose',300,1005)
update cus set city='null' where cnum=2006
select * from sal s join cus c on s.snum=c.snum
 1.
 select * from sal
 2.
 select cname,rating from cus where rating>=100 
 3.
 select cname,city from cus where city='null'
 create table ord(onum int primary key ,amt  DECIMAL(7,2)  NOT NULL, odate  Date   NOT NULL, cnum  int  NOT NULL,  FOREIGN KEY (cnum) REFERENCES cus(cnum) )

select * from ord
insert into ord values(3001, 18.69, '1996/03/10', 2008)
insert into ord values(3003, 767.19 , '1996/03/10', 2001)
insert into ord values(3002, 1900.10 , '1996/03/10', 2007)
insert into ord values(3005, 5160.45 , '1996/03/10', 2003)
insert into ord values(3006, 1098.16 , '1996/03/10', 2008)
insert into ord values(3009, 1713.23 , '1996/04/10', 2002)
insert into ord values(3007, 75.75 , '1996/04/10', 2002)
insert into ord values(3008, 4723.00 , '1996/05/10', 2006)
insert into ord values(3010, 1309.95 , '1996/06/10', 2004)
insert into ord values(3011,  9891.88 , '1996/06/10', 2006)
4.
 select * from  sal s join cus c  on s.snum=c.snum join ord o on c.cnum=o.cnum
5.
 select s.sname,o.odate,max(o.amt) as large_amt from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum group by s.sname,o.odate
 
 6.
 select * from ord order by cnum desc
 7.
 select s.snum,o.odate from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum group by o.odate,s.snum order by o. odate desc
 8.
 select c.cname,s.sname from sal s join cus c on s.snum=c.snum where c.cname=s.sname group by c.cname,s.sname
 9.
 select s.sname,s.snum,count(c.cname) as cust  from sal s join cus c on s.snum=c.snum group by s.sname,s.snum having count(c.cname)>1
 10.
 select s.sname,count(amt)as cnt from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum group by s.sname order by s.sname desc
 13.
 select cname,rating from cus where city='san jose' and rating>200 group by rating,cname
 14.
 select sname,commision from sal where city='london' group by sname,commision
 15.
 select o.odate from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum where s.sname='serres' group by o.odate
 16.
 select c.cname ,o.odate from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum where  o.odate='1996-03-10'
 18.
 select * from orders where amt>(amt(odate='1996-06-10' order by cnum)
 11.
 select s.sname,c.cname,c.city from sal s join cus c on s.snum=c.snum
 12.
 select max(o.amt) as large_ord,s.sname from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum group by s.sname
 26.
 select * from cus where rating>200
 29.
 select 
 124.
 select min(c.rating) as ,s.snum from sal s join cus c on s.snum=c.cnum join ord o on c.cnum=o.cnum group by s.sname having s.snum<min(o.amt)
 27.
 select s.sname,count(s.sname) as list_of_orders from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum group by s.sname
 31.
 select sname from sal where sname like'p%-i%'
 33.
 select s.sname, max(o.amt)as lrg_ord from sal s join cus c on s.snum=c.cnum join ord o on c.cnum=o.cnum group by s.sname having s.sname='serres' or s.sname='rifkin'
 34.
 select snum,sname,commision,city from sal
 35.
 select cname from cus where cname like 'H%_N' order by cname
 37
 select avg(amt) as  avgamt ,cnum from ord where odate='1996-04-10' 
 select * from ord

 select amt from ord
 select amt ,floor(amt) as flooramt,round(amt,1)as roundamt,ceiling(amt) as"ceilingamt" from ord
 38.
 select count(amt) as "total orders", odate from ord group by odate
 40.
 select rating,cname from cus where city='san jose'
 41.
 select o.amt,o.onum from ord where o.amt<(select max(amt) from cus c join ord o on c.cnum=o.cnum where city ='sanj jose')
 47.
 select sname from sal where city in('barcelona','london')
 48.
 select s.snum,count(c.cnum) from sal s join cus c on s.snum=c.snum  group by c.cname having count(c.cnum)=1 
50.
select amt from ord where amt>1000
51.
 select o.amt ,c.cname from cus c join ord o  on c.cnum=o.cnum 
 53.
 select city,max(rating) as "max rating" from cus group by city having max(rating)>=(select max(c.rating) from sal s  join cus c on s.snum=c.snum where s.sname= 'serres')
 54.
 select amt from ord where odate in('1996-03-10','1996-04-10')
 56.
 select cname, max(rating) "max rating" from cus where city='rome' group by cname
 57.
 select cname,city,rating from cus where city='rome' and rating<=300
 58.select *,row_number() over (order by snum) as "row no" from cus where snum=1001
 62.
 select sname ,commision from sal 
 64.select s.sname,c.cname from sal s join cus c on s.snum=c.snum order by s.sname.
  65.
  select avg(o.amt),c.rating,c.cname from cus c join ord o on c.cnum=o.cnum where rating
 66.
  select sum(amt) as "total purchase" from ord
  67.
  select onum,amt,odate from ord
  68.
  select count(rating) as"count of rating" from cus where rating is not null
  70.
  select s.sname,s.commision,c.cname,c.city from sal s join cus c on s.snum=c.snum where c.city ='london'
  73.
  select s.sname,c.cname from sal s join cus c on s.snum=c.snum where  sname in ('peel','motika')
  76.
  select s.sname,o.amt from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum where s.sname='london'
  77.
  select s.sname,min(o.amt) from  sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum group by s.sname having sname=min(o.amt)
  79.
  select cname from cus where cname like 'c%'
  80.
  select city,max(rating) as "rating" from cus group by city 
  81.
  select s.snum,o.amt from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum 
  82.
  select rating,cname,cnum from cus  order by rating
  83.
  select sname ,avg(commision) as "avg comm" from sal  where city='london' group by sname
  85.
  select sname from sal where comm='0.12' or '0.13'
  86.
  select sname,city from sal where city='london' and commision>0.10 
  88.
  select c.cname,min(amt) as "smallest order" from cus c join ord o on c.cnum=o.cnum group by cname
  89.
  select cname from cus where cname like'g%'
  90.
  select city from cus where city is not null
  91.
  select avg(amt) from ord 
  92.
  select cname,rating from cus where city!= 'san jose' and rating>200
  94.
  select snum,sname,commision from sal where commision>0.12 or commision<0.14
  95.
  select amt  from sal s join cus c on s.snum=c.snum join  ord o on c.cnum=o.cnum where o.odate!='1996-03-10' and s.snum=1006 and o.amt>=2000
  97.
  select  s.sname ,c.rating  from sal s join cus c on s.snum=c.snum join  ord o on c.cnum=o.cnum where commision <0.11 and rating<250
  99.
   select avg(s.commision) as "avg comm", s.sname from sal s join cus c on s.snum=c.snum group by s.sname
   102.
   select * from cus order by rating
   104.
   select * from sal where commision=commision
   105.
   select amt from sal s join cus c on s.snum=c.snum join  ord o on c.cnum=o.cnum where o.odate!='1996-03-10' and o.odate!='1996-05-10'
   106.
   select sname from sal s join cus c on s.snum=c.snum join  ord o on c.cnum=o.cnum where amt!=amt
   107.
    select count(c.cname) as "mo of cus",count(o.amt)as counts from cus c join  ord o on c.cnum=o.cnum group by c.cname
   108.
   select o.odate,max(o.amt) from sal s join cus c on s.snum=c.snum join  ord o on c.cnum=o.cnum where o.odate=max(o.amt)
   109.
   select s.sname,max(c.rating) as maxrating from sal s join cus c on s.snum=c.snum group by s.sname having s.sname>max(rating) 
   110
   select c.cname,min(amt)as"waste cust" from cus c join ord o on c.cnum=o.cnum group by c.cname
   112.
   select cname from cus where rating=rating
   120.
   select s.name,c.city from sal s 
   121.
   select s.snum,s.sname,sum(o.amt) as "total amt", sum(o.amt)*commision from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum order by max(o.amt) desc
   123.
   select o.odate,o.onum,o.amt,s.city from sal s join cus c on s.snum=c.snum join ord o on c.cnum=o.cnum where o.amt=(select max(amt) from ord)
   125.
   select sum(amt) as "total income" from ord 
 select * from sal where city in('sanjose','london')
 
 create view sal1 as select * from sal
 
 select * from sal1

 drop view sal1
  
  begin tran
  update sal set city='barcelona' where city='london'

  select *  from sal

  rollback tran 

  begin tran
  update sal set city='barcelona' where city='london'
  commit tran

  rollback tran

  begin tran
  save transaction s1
  update sal set city='london' where city= 'barcelona'

   save transaction s2
  update sal set city='san jose' where city= 'london'


 save transaction s3
  update sal set city='london' where city= 'null'


  rollback tran
  select * from sal

  