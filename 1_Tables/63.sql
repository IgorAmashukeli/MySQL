/*
Display information about books (genre, book, author) 
related to the genre that includes the word "novel" in a form sorted by book titles.
*/


SELECT 
  name_genre, 
  title, 
  name_author 
FROM 
  author 
  INNER JOIN book ON author.author_id = book.author_id 
  INNER JOIN genre ON book.genre_id = genre.genre_id 
WHERE 
  name_genre LIKE "%novel%" 
ORDER BY 
  title;