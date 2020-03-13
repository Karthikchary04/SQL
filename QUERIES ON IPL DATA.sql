select * from ipl
select count(won) from ipl where won='Chennai Super Kings'
select count(won) from ipl where opt='field'
select count(won) from ipl where opt='bat'
select count(won) from ipl where city='Mumbai'
select count(toss) from ipl where team1='Royal Challengers Bangalore'
select count(toss) from ipl where team2='Royal Challengers Bangalore'
select city from ipl where result='tie'

select top(4) won,count(won) as highest from ipl group by won order by count(won)

select top(3) * from orders order by amt
select *,ntile(2) over(order by amt) from orders 


select * from ipl