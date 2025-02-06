/*
Print the genre (or genres) in which the most copies of books were ordered, specify this number. The last column should name the Amount.
*/


SELECT 
  genre.name_genre, 
  SUM(buy_book.amount) AS Amount 
FROM 
  genre 
  INNER JOIN book USING (genre_id) 
  INNER JOIN buy_book USING (book_id) 
GROUP BY 
  genre.name_genre 
HAVING 

  Amount = (
    SELECT 
      MAX(Amount) AS MaxAmount 
    FROM 
      (
        SELECT 
          SUM(buy_book.amount) AS Amount 
        FROM 
          genre 
          INNER JOIN book USING (genre_id) 
          INNER JOIN buy_book USING (book_id) 
        GROUP BY 
          genre.name_genre
      ) counts
 )