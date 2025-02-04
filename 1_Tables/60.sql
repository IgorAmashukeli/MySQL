/*
Display all genres that are not represented in the books in stock.
*/

SELECT 
  name_genre 
FROM 
  genre 
  LEFT JOIN book ON genre.genre_id = book.genre_id 
WHERE 
  book.genre_id IS NULL;