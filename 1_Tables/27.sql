/*
Calculate how many and which copies of books suppliers need to order so that the warehouse has the same number of copies
 of each book,
 equal to the value of the largest number of copies of one book in the warehouse.
 Print the name of the book, its author, the current number of copies in stock and the number of ordered copies of books.
  Assign the name Order to the last column.
 The result does not include books that do not need to be ordered.
*/

SELECT 
  title, 
  author, 
  amount, 
  (
    SELECT 
      MAX(amount) 
    FROM 
      book
  ) - amount AS Offer 
FROM 
  book 
WHERE 
  (
    SELECT 
      MAX(amount) 
    FROM 
      book
  ) > amount;