select 
  name 
from 
  Employee 
where 
  id in(
    select 
      managerId 
    from 
      (
        select 
          managerId, 
          count(id) as directreports 
        from 
          Employee 
        where 
          managerId is not null 
        group by 
          managerId
      ) as q1 
    where 
      directreports >= 5
  );
