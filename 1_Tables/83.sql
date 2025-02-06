/*
The city table for each city shows the number of days for which an order can be delivered to that city (only the "Transportation" stage is considered).
For those orders that have passed the transportation stage, print the number of days for which the order was actually delivered to the city.
Also, if the order is delivered late, specify the number of days of delay, otherwise output 0. The result should include the order number (buy_id), 
as well as the calculated columns NumberOfDays and Day_Delay.
The information should be displayed in the form sorted by order number.
*/


SELECT 
  buy.buy_id, 
  DATEDIFF(date_step_end, date_step_beg) AS NumberOfDays, 
  IF(
    DATEDIFF(date_step_end, date_step_beg) > city.days_delivery, 
    DATEDIFF(date_step_end, date_step_beg) - city.days_delivery, 
    0
  ) AS Day_Delay 
FROM 
  city 
  RIGHT JOIN client USING(city_id) 
  RIGHT JOIN buy USING(client_id) 
  INNER JOIN buy_step USING(buy_id) 
  INNER JOIN step USING(step_id) 
WHERE 
  name_step = 'Transportation' 
  AND date_step_beg IS NOT NULL 
  AND date_step_end IS NOT NULL 
ORDER BY 
  buy_id;
