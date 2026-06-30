use assignments

select * from chartered_speed_fleet_data;

1.	Find all drivers who were overspeeding?

select * from chartered_speed_fleet_data 
where Violation_type = "Overspeeding" 
order by Speed_Kmh desc;

2.	Count total violations by each city?

select count(*) as total_Violation,city 
from chartered_speed_fleet_data
where Violation_type <> "None"
group by city
order by total_Violation desc;

#3.	Find the top 5 drivers with highest fuel consumption?

select Driver_Name,Bus_ID,
sum(Fuel_Consumed_L) as Total_fuel
from chartered_speed_fleet_data
group by driver_name,Bus_ID
order by Total_fuel desc 
limit 5;

4.	Count violations by type — which violation is most common?

select Driver_name,Violation_Type, COUNT(*) AS Count
from chartered_speed_fleet_data
where Violation_Type != 'None'
group by Violation_Type
order by Count DESC;

5.	Find average speed by city?

select City, 
round(avg(Speed_kmh), 2) AS Avg_Speed
from chartered_speed_fleet_data
group by City
order by Avg_Speed desc;

6.	Find drivers who have one violation?

select Driver_name,COUNT(*) as Violation_count
from chartered_speed_fleet_data
where Violation_Type != "None"
group by Driver_name
having COUNT(*) =  1
order by violation_count desc;

7.	Show monthly violation trend — January, February, March?

select Month, COUNT(*) AS Total_Violations
from chartered_speed_fleet_data
where Violation_Type != 'None'
group BY Month
order BY Total_Violations DESC;

8.	Compare Morning vs Evening shift — which has more violations?

select Shift, COUNT(*) AS Violations
from chartered_speed_fleet_data
where Violation_Type != 'None'
group by Shift;

9.	Find the most fuel-consuming route?

select Route, 
sum(Fuel_Consumed_L) AS Total_Fuel
from chartered_speed_fleet_data
group by Route
order by Total_Fuel desc
limit 1;

10.	Find all drivers with NO violations?

select Driver_Name, Bus_ID, City
from chartered_speed_fleet_data
where Violation_Type = 'None'
group by Driver_Name, Bus_ID, City;