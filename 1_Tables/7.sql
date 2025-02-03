/*
For packaging each book, one sheet of paper is required, priced at 1.65 units of currency.
Calculate the packaging cost for each book (how much money is needed to package all copies of the book).
In the query, display the book title, its amount, and the packaging cost, and name the last column as pack.
*/

SELECT 
  title, 
  amount, 
  amount * 1.65 AS pack 
FROM 
  book;
