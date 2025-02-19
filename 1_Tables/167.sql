/*
To make a rating of books depending on which book will bring the most revenue (in percent), 
subject to the sale of all books. Sort the rating in descending order of revenue. 
Revenue as a percentage is calculated as the cost of all copies of the book divided by the total cost of all copies of books in stock and multiplied by 100, 
rounded to two decimal places.
Judging by the result, the store has invested well in Yesenin's Poetry.
*/


SELECT 
  author, 
  title, 
  price, 
  amount, 
  ROUND(
    100 * price * amount / (
      SUM(price * amount) OVER()
    ), 
    2
  ) AS income_percent 
FROM 
  book 
ORDER BY 
  income_percent DESC;
