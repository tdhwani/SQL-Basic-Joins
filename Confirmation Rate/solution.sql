select 
  user_id, 
  round(
    case when allac = 0 then 0 else allconf / allac end, 
    2
  ) as confirmation_rate 
from 
  (
    select 
      t1.user_id, 
      sum(
        if(action = 'confirmed', 1, 0)
      ) as allconf, 
      sum(
        if(action != 'null', 1, 0)
      ) as allac 
    from 
      Signups as t1 
      left join Confirmations as t2 on t1.user_id = t2.user_id 
    group by 
      t1.user_id
  ) as q1;
