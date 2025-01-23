-- create join table 
select *
from absenteeism_at_work as a 
left join reasons as r 
	on a.`Reason for absence` = r.`number`
 left join compensation as c
	on a.id = c.id ;
    
    
 -- find the helthiest employees for the bonus 
 select * 
 from absenteeism_at_work 
 where `Social drinker` = 0 and `Social smoker` = 0 and `Body mass index` < 25 and `Absenteeism time in hours` <
 (select avg (`absenteeism time in hours`) from absenteeism_at_work) ;
    
    
-- compensation rate for non smokers \ budget = 983,221 and total hours by nonsmokers in a year = 1,426,880\ so increase per hour = 0.68 \ so annual increase by each non smoker = 1,433$
select count(*) as nonsmoker
from absenteeism_at_work
where `Social smoker` = 0 ;


-- optimize the query  
select a.ID, 
r.Reason as `Reason of absence`,
a.`Month of absence`, 
case 
	when `month of absence` in (12,1,2) then "Winter"
	when `month of absence` in (3,4,5) then "Spring"
	when `month of absence` in (6,7,8) then "Summer"
    when `month of absence` in (12,1,2) then "Fall" else "Unkown"
end as `Season name`, 
a.`Body mass index` as BMI,
case 
		when `Body mass index` <18.5 then "Underweight"
        when `Body mass index` between 18.5 and 25 then "Healthy weight"
        when `Body mass index` between 25 and 30 then "overweight"
        when `Body mass index` > 18.5 then "Obes" else "Unkown"
end as `BMI Category`, 
seasons, `day of the week`,`Transportation expense`,Education,son,pet ,`Social drinker`,`Social smoker`,`Disciplinary failure`,age,
`work load average/day`, `Absenteeism time in hours`
from absenteeism_at_work as a 
left join reasons as r 
	on a.`Reason for absence` = r.`number`
 left join compensation as c
	on a.id = c.id ;

  