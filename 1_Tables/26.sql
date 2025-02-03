/*
Display information about books (author, title, price),
the price of which is less than the largest of the minimum prices calculated for each author.
*/


SELECT 
  author, 
  title, 
  price 
FROM 
  book 
WHERE 
  price < ANY (
    SELECT 
      MIN(price) 
    FROM 
      book 
    GROUP BY 
      author
  );