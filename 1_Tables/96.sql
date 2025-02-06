/*
In the buy_step table, enter the 12.04.2020 invoice date for the payment of the order with the number 5.

It would be more correct to enter the current date rather than a specific one. This can be done using the Now() function. 
But at the same time, different dates will be inserted on different days, and the task cannot be checked, so we will insert the date 04/12/2020.
*/

UPDATE 
  buy_step 
  INNER JOIN step ON buy_step.step_id = step.step_id 
  AND buy_step.buy_id = 5 
SET 
  date_step_beg = '2020-04-12' 
WHERE 
  step.name_step = 'Payment';
