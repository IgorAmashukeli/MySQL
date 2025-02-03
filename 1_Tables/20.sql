/*
Calculate the average price and the total cost of those books whose number of copies falls within the range from 5 to 14, inclusive. 
Name the columns Average_Price and Total_Cost, and round the values to two decimal places.
*/


SELECT 
  ROUND(
    AVG(price), 
    2
  ) AS Average_Price, 
  ROUND(
    SUM(price * amount), 
    2
  ) AS Total_Cost 
FROM 
  book 
WHERE 
  (
    amount >= 5 
    AND amount <= 14
  );
