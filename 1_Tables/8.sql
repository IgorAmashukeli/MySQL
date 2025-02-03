/*
At the end of the year, the price of each book in the warehouse is recalculated – it is reduced by 30%. 
Write an SQL query that selects the titles, authors, quantities, and calculates the new prices of the books from the book table. 
Name the column with the new price new_price and round the price to 2 decimal places
*/

SELECT 
  title, 
  author, 
  amount, 
  ROUND(price * 0.7, 2) AS new_price 
FROM 
  book;