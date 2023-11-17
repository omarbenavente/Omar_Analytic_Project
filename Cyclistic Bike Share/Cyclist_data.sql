-- creating the table 
create table cyclist_data(
	ride_id	VARCHAR(50) PRIMARY KEY,
	rideable_type VARCHAR(50),
	started_at TIMESTAMP,
	ended_at TIMESTAMP,
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(50),
	end_station_name VARCHAR(100),
	end_station_id VARCHAR(50),
	start_lat DECIMAL,
	start_lng DECIMAL,
	end_lat	DECIMAL,
	end_lng	DECIMAL,
	member_casual VARCHAR(50),
	hour SMALLINT,
	day SMALLINT,
	day_of_week VARCHAR(20),
	month VARCHAR(20),
	year SMALLINT
)

-- Import the file.


/*
There are some bikes that only been riden less than a minute or even a second. Seems like people didn't or barely
rode the bike. It's better to include the rows that the length of the bike ride is more than a minute

I'm creating a new table called cyclist by using an existing table "cyclist_data" plus a new column with
the length of the bike ride in minutes. Then, using a condition statement of bikes riden more than a minute
*/

CREATE TABLE cyclist As
select *, ROUND(EXTRACT(EPOCH FROM (ended_at - started_at))/60,2) as length_minutes from cyclist_data
where (EXTRACT(EPOCH FROM (ended_at - started_at))/60) > 1



-- Analysis Question 


-- 1) Which day of the week do people bike ride the most?

select day_of_week, count(*) from cyclist
group by day_of_week
order by 2 desc;

/* People ride on the bikes the most on Saturdays*/





-- 2) What is the average duration of a bike ride?

select round(avg(length_minutes),2) from cyclist;

/* seenms like the average duration of a bike ride is 16.62 minutes */





-- 3) Which bike stations are the most popular for starting and ending rides?
select start_station_name, count(*) from cyclist
group by 1 
order by 2 desc;

/* Streeter Dr & Grand Ave is the most popular starting station stop with the count of 67733 */

select end_station_name, count(*) from cyclist
group by 1 
order by 2 desc;

/* Streeter Dr & Grand Ave is the most popular ending station stop with the count of 69252

Seems like Streeter Dr & Grand Ave is the most popular station overall
*/





-- 4) What are the peak usage hours during the day or week?

select hour, count(*) from cyclist
group by 1
order by 2 desc;

/* The peak hour of bike usage is 5pm, then 4pm, then 6pm
- Makes sense since this is the afternoon rushhour. People either bike home from work, or
people usually bike after work for excercise
*/

select day_of_week, hour, count(*) from cyclist
group by 1,2
order by 3 desc;

/* the peak hour during the week is Wednesday at 5pm with the number of rides of 80,654 */





-- 5) How many users are subscribers, and how many are casual riders?

select member_casual,count(*) from cyclist
group by 1;

/* There are 2,684,276 memebers and 1,718,072 casual bikers*/





-- 6) Which month do people bike the most?
select month, count(*) from cyclist
group by 1
order by 2 desc;

/* Biker bike the most during the month of July */






-- 7) How many bikers start biking in each season?

select 
	case 
	when started_at between timestamp '2022-06-21 00:00:00' and timestamp '2022-09-21 23:59:59' then 'Summer'
	when started_at between timestamp '2022-09-22 00:00:00' and timestamp '2022-12-20 23:59:59' then 'Fall'
	when started_at between timestamp '2022-12-21 00:00:00' and timestamp '2023-03-19 23:59:59' then 'Winter'
	else 'Spring'
	end as season,
	count(*)
from cyclist
group by 1
order by 2 desc;

/*  "Summer"	1,817,369
	"Spring"	1,250,480
	"Fall"		906,541
	"Winter"	427,958
*/




-- 8) what are the % and number of usage of different type of bikes?

select rideable_type,
round(100 *cast(count(rideable_type) as decimal)/cast((select count(*) from cyclist) as decimal),2) as usage_percent
from cyclist
group by 1
order by 2 desc

/* 	"classic_bike"	57.82%
	"electric_bike"	38.70%
	"docked_bike"	3.48%
*/

select rideable_type, count(*) as usage from cyclist
group by 1
order by 2 desc

/*	"classic_bike"	2545652
	"electric_bike"	1703666
	"docked_bike"	153030 
	
most bikers usually bike the classic bike, as well as the electric bike. 	
	*/




--9) Since people don't ride the "docked bike" how many casual/members riden a 'docked bike'
select member_casual, count(*) from cyclist 
where rideable_type ilike '%docked%'
group by member_casual;

/* Interestingly, no members had riden any docked bikes; casual biker rode all of the docked bike (153030) */





--10) a) how many rides traveled longer than the average duration?

select count(*) as ride_count
from(
select ride_id, length_minutes from cyclist
where length_minutes > (select avg(length_minutes) from cyclist)) c

/* There are 1,272,515 rides that rode more than the average length */

--   b) list the ride traveled longer than the average duration while showing the average duration

select ride_id, length_minutes, (select avg(length_minutes) from cyclist) from cyclist
where length_minutes > (select avg(length_minutes) from cyclist)



