select 
  mid as machine_id, 
  round(
    avg(proctime), 
    3
  ) as processing_time 
from 
  (
    select 
      q1.machine_id as mid, 
      q1.process_id as pid, 
      endtime - starttime as proctime 
    from 
      (
        select 
          machine_id, 
          process_id, 
          timestamp as starttime 
        from 
          Activity 
        where 
          activity_type = 'start'
      ) as q1 
      join (
        select 
          machine_id, 
          process_id, 
          timestamp as endtime 
        from 
          Activity 
        where 
          activity_type = 'end'
      ) as q2 on q1.machine_id = q2.machine_id 
      and q1.process_id = q2.process_id
  ) as q3 
group by 
  mid;
