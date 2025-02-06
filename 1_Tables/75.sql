/*
Delete all authors who write in the genre of "Poetry". 
Delete all books by these authors from the book table. In the request for selecting authors, use the full name of the genre, not its id.
*/


DELETE FROM 
  author USING author 
  INNER JOIN book ON author.author_id = book.author_id 
  INNER JOIN genre ON book.genre_id = genre.genre_id 
WHERE 
  genre.name_genre = 'Poetry';
SELECT 
  * 
FROM 
  author;
SELECT 
  * 
FROM 
  book;
