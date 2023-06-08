select 
  nextday.id 
from 
  Weather as nextday 
  right join Weather as prevday on DATEDIFF(
    nextday.recordDate, prevday.recordDate
  ) = 1 
where 
  nextday.temperature > prevday.temperature;
