/*
For each author, the author table shows the number of books he has written in each genre.
*/


SELECT 
  name_author, 
  name_genre, 
  COUNT(title) AS Amount 
FROM 
  (
    SELECT 
      name_author, 
      name_genre, 
      author_id, 
      genre_id 
    FROM 
      author CROSS 
      JOIN genre
  ) author_genre 
  LEFT JOIN book ON author_genre.author_id = book.author_id 
  and author_genre.genre_id = book.genre_id 
GROUP BY 
  name_author, 
  name_genre 
ORDER BY 
  name_author, 
  Amount DESC;