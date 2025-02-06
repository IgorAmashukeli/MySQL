/*
Enter the genre "Poetry" for the book "Poems and Poetry" by Lermontov, and "Adventures" for the book "Treasure Island" by Stevenson. (Use two queries).
*/


UPDATE 
  book 
SET 
  genre_id = (
    SELECT 
      genre_id 
    FROM 
      genre 
    WHERE 
      name_genre = 'Poems'
  ) 
WHERE 
  title = 'Poems and poetry' 
  AND author_id = (
    SELECT 
      author_id 
    FROM 
      author 
    WHERE 
      name_author = 'Lermontov M.U.'
  );
UPDATE 
  book 
SET 
  genre_id = (
    SELECT 
      genre_id 
    FROM 
      genre 
    WHERE 
      name_genre = 'Adventures'
  ) 
WHERE 
  title = 'Treasure Island' 
  AND author_id = (
    SELECT 
      author_id 
    FROM 
      author 
    WHERE 
      name_author = 'Stevenson R.L.'
  );