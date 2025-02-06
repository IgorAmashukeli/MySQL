/*
Delete all authors and all their books, the total number of books of which is less than 20.
*/


DELETE FROM genre
WHERE genre_id IN (
    SELECT genre_id
    FROM book
    GROUP BY genre_id
    HAVING COUNT(book_id) < 4
);

SELECT * FROM genre;
SELECT * FROM book;
