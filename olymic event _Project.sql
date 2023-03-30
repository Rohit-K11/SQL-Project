select * from athlete_events;

# find which sports event India won the highest medels?
select event,count(medal)
from athlete_events
where team = 'INDIA'
and medal <>'NA'
group by event 
order by count(medal) desc;

#find which sports event India won the highest medels by year?
select event,count(medal)
from athlete_events
where team = 'INDIA'
and medal <>'NA'
group by  year,event 
order by count(medal) desc;

#Identitfy the sports which was played most consecutiely in the summer olympic games?
select event,count(event)
from athlete_events
where Season = 'summer'
group by event
order by count(Event) desc;

#Countires which has won most no of silver and bronz medels and at least one goal medelse
select team,sum(silver),sum(Bronze),sum(Gold)
 from ( select*,
case medal when 'silver' then 1 else 0 end as silver,
case medal when 'bronze' then 1 else 0 end as bronze,
case medal when 'Gold' then 1 else 0 end as Gold
from athlete_events
)innerT
group by team
having sum(Gold) > 0
order by sum(silver) desc;

# player won max gold
select name,sum(Gold)
from ( select *,
case medal when 'Gold' then 1 else 0 end as Gold
from athlete_events) innerT
group by  name
order by sum(gold) desc;

# sports with max event
select sport,count(*)
from athlete_events
group by sport 
order by count(*) desc;


