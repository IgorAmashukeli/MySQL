/*
Display information (author, title, and price) about books whose prices do not exceed the minimum book price 
in the warehouse by more than 150 rubles, sorted in ascending order of price.
*/


SELECT 
  author, 
  title, 
  price 
FROM 
  book 
WHERE 
  (
    price - (
      SELECT 
        MIN(price) 
      FROM 
        book
    ) BETWEEN 0 
    AND 150
  ) 
ORDER BY 
  price ASC;