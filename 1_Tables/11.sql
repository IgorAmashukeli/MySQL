/*
Display the title, author, price, and amount of all books where the price is less than 500 or greater than 600,
and the total cost of all copies of these books is greater than or equal to 5000
*/


SELECT 
  title, 
  author, 
  price, 
  amount 
FROM 
  book 
WHERE 
  (
    price > 600 
    OR price < 500
  ) 
  AND (price * amount >= 5000);