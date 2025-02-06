


UPDATE buy_step
INNER JOIN step ON buy_step.step_id = step.step_id AND buy_step.buy_id = 5
SET date_step_end = '2020-04-13'
WHERE step.name_step = 'Оплата';

UPDATE buy_step
INNER JOIN step ON buy_step.step_id = step.step_id AND buy_step.buy_id = 5
SET date_step_beg = '2020-04-13'
WHERE step.step_id = (
    SELECT step.step_id + 1
    FROM buy_step INNER JOIN step ON buy_step.step_id = step.step_id AND buy_step.buy_id = 5
    WHERE step.name_step = 'Оплата'
) AS next_step;
