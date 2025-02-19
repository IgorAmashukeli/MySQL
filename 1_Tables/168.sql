/*
For each author, the author table shows the number of books written by him in each genre.

Output: author's full name, genre, quantity.

Sort by last name, then in descending order of the number of books written, and then in alphabetical order by genre name.

Important! Implement the task with one selection request.
*/



SELECT 
  name_author, 
  name_genre, 
  COUNT(book_id) AS BookAmount 
FROM 
  genre CROSS 
  JOIN author 
  LEFT JOIN book USING(author_id, genre_id)
GROUP BY 
  name_author, 
  name_genre 
ORDER BY 
  name_author, 
  BookAmount DESC, 
  name_genre;

