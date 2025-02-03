/*
Create a new back_payment table where you can enter information about unpaid fines 
(Last name and initials of the driver, car number, violation, amount of fine and date of violation) from the fine table
*/


CREATE TABLE back_payment (
  SELECT 
    name, 
    number_plate, 
    violation, 
    sum_fine, 
    date_violation 
  FROM 
    fine 
  WHERE 
    date_payment IS NULL
);
SELECT 
  * 
FROM 
  back_payment;