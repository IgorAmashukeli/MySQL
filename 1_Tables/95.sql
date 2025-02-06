/*
In the buy_stop table for order number 5, include all the steps from the step table that this order must complete. 
Enter Null in the date_step_beg and date_step_end columns of all records.
*/


INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end)
SELECT 5, step_id, NULL, NULL
FROM step;
