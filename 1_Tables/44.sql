/*
Create a fine table with the following structure:

Description Field
fine_id is a key column of an integer type with an automatic increment of the key value by 1
name string length 30
number_plate string length 6
violation string length 50
sum_fine is a real number, the maximum length is 8, the number of decimal places is 2
date_violation date
date_payment date
*/


CREATE TABLE fine (
  fine_id INT PRIMARY KEY AUTO_INCREMENT, 
  name VARCHAR(30), 
  number_plate VARCHAR(6), 
  violation VARCHAR(50), 
  sum_fine DECIMAL(8, 2), 
  date_violation DATE, 
  date_payment DATE
);