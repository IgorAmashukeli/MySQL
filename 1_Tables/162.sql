/*
Name the Name, Price, and Shipping Cost columns.
Select all books whose price is above 600.
If the balance of the individual book is less than or equal to 5, then the shipping cost will be 500 rubles, 
if more than 5, then the delivery will be free (insert Free instead of the shipping cost).
Sort the values in descending order of the book price
*/


SELECT 
  title, 
  price, 
  IF(
    amount <= 5, 500, 'Free'
  ) AS DeliveryCost 
FROM 
  book 
WHERE 
  price > 600 
ORDER BY 
  price DESC;