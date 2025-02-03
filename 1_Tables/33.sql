/*
For those books in the book table that are in the supply table,
 not only increase their number in the book table (increase their number by the value of the amount column of the supply table),
 but also recalculate their price (for each book, find the sum of prices from the book and supply tables and divide by 2).
*/

/*
book.amount = book.amount + supply.amount is adding only one row
which one? the first that satisfies where condition
*/

UPDATE 
  book, 
  supply 
SET 
  book.amount = book.amount + supply.amount, 
  book.price = (book.price + supply.price) / 2 
WHERE 
  book.title = supply.title;
SELECT 
  * 
FROM 
  book;