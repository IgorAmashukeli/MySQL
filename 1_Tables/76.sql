/*
Let's add books that are not in the book from the supply. To do this, first add the authors to the author, 
then the books, then manually specify the genre for the new books.

Let's change the price of books in book, replacing it with the average price of books of the same genre.
That is, in the main price change request UPDATE book SET... we write a subquery that calculates the average price of books of each genre (AVG(price), 
GROUP BY genre_id) 
and updates the price depending on which genre a particular book belongs to.
*/


INSERT INTO author (name_author) 
SELECT 
  supply.author 
FROM 
  supply 
  LEFT JOIN author ON author.name_author = supply.author 
WHERE 
  author.name_author IS NULL;
SELECT 
  * 
FROM 
  author;
INSERT INTO book (title, author_id, price, amount) 
SELECT 
  supply.title, 
  author.author_id, 
  supply.price, 
  supply.amount 
FROM 
  (
    author 
    INNER JOIN supply ON author.name_author = supply.author
  ) 
  LEFT JOIN book ON book.author_id = author.author_id 
  AND book.title = supply.title 
WHERE 
  book.title IS NULL;
UPDATE 
  book 
SET 
  genre_id = (
    SELECT 
      genre_id 
    FROM 
      genre 
    WHERE 
      name_genre = 'Poetry'
  ) 
WHERE 
  title = 'Poems and poetry' 
  and author_id IN (
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
  and author_id IN (
    SELECT 
      author_id 
    FROM 
      author 
    WHERE 
      name_author = 'Stevenson R.L.'
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
      name_genre = 'Novel'
  ) 
WHERE 
  title = 'Doctor Zhivago' 
  and author_id IN (
    SELECT 
      author_id 
    FROM 
      author 
    WHERE 
      name_author = 'Pasternak B.L.'
  );
UPDATE 
  book 
  INNER JOIN (
    SELECT 
      genre_id, 
      ROUND(
        AVG(price), 
        2
      ) AS avg_price 
    FROM 
      book 
    GROUP BY 
      genre_id
  ) genre_avg ON book.genre_id = genre_avg.genre_id 
SET 
  price = avg_price;
SELECT 
  * 
FROM 
  book;
