/*
Necessary:

enter the date of payment of the corresponding fine from the payment table in the fine table.; 
reduce the accrued fine in the fine table by half 
(only for those fines that are listed in the payment table) if the payment is made no later than 20 days from the date of the violation.
*/

UPDATE 
  fine, 
  payment 
SET 
  fine.date_payment = payment.date_payment, 
  fine.sum_fine = IF(
    DATEDIFF(
      payment.date_payment, payment.date_violation
    ) <= 20, 
    fine.sum_fine / 2, 
    fine.sum_fine
  ) 
WHERE 
  fine.name = payment.name 
  AND fine.number_plate = payment.number_plate 
  AND fine.violation = payment.violation 
  AND fine.date_violation = payment.date_violation;
SELECT 
  * 
FROM 
  fine;