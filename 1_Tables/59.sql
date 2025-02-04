/*
Display the name, genre, and price of those books with more than 8 in descending order of price.
(with book being parent table and genre being referenced table)
*/


SELECT 
  title, 
  name_genre, 
  price 
FROM 
  genre 
  INNER JOIN book ON genre.genre_id = book.genre_id 
WHERE 
  amount > 8 
ORDER BY 
  price DESC;