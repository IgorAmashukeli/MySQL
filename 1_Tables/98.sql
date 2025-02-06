/*
Complete the "Payment" stage for order number 5 by inserting the date 04/13/2020 into the date_step_end column, 
and start the next stage ("Packaging") by setting the same date in the date_step_beg column for this stage.
Implement two requests to complete a stage and start the next one. They should be written down in a general way so that it can be applied to any stage, 
changing only the current stage. For example, let's say this is the 
"Payment" stage.
*/


UPDATE buy_step
INNER JOIN step ON buy_step.step_id = step.step_id AND buy_step.buy_id = 5
SET date_step_end = '2020-04-13'
WHERE step.name_step = 'Payment';

UPDATE buy_step
INNER JOIN step ON buy_step.step_id = step.step_id AND buy_step.buy_id = 5
SET date_step_beg = '2020-04-13'
WHERE step.step_id = (
    SELECT step.step_id + 1
    FROM step
    WHERE step.name_step = 'Payment'
);