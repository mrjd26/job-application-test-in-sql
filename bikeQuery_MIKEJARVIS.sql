WITH t AS (SELECT end_time,
bike_number,
start_time
 FROM 
 tutorial.dc_bikeshare_q1_2012
 GROUP BY bike_number, start_time, end_time
 ORDER BY bike_number, end_time
 )
 SELECT * FROM(
 SELECT 
   bike_number,
   end_time,
   AGE(LEAD(start_time) OVER (), end_time) AS diff,
   LEAD(start_time) OVER () AS start_time,
   CASE 
     WHEN
       LEAD(bike_number) OVER () = bike_number THEN 1 ELSE 0 
     END AS is_samebike
   FROM t
   )a
   WHERE is_samebike = 1
   ORDER BY diff DESC;




