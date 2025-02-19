/*
Print the genre(s) in which the least copies of books were ordered, specify this number. 
Consider only the genres in which at least one book has been ordered.
When implementing the main request, do not use a LIMIT, because there may be several genres with the minimum number of books ordered.
*/



SELECT name_genre, SUM(buy_book.amount) AS BookAmount
FROM
genre
INNER JOIN book USING(genre_id)
INNER JOIN buy_book USING(book_id)
GROUP BY name_genre
HAVING SUM(buy_book.amount) = (
    SELECT MIN(amounts.BookAmount)
    FROM
    (
        SELECT SUM(buy_book.amount) AS BookAmount
        FROM
        genre
        INNER JOIN book USING(genre_id)
        INNER JOIN buy_book USING(book_id)
        GROUP BY name_genre
    ) AS amounts
);



/*another way to do it*/
SELECT name_genre, SUM(buy_book.amount) AS Количество
FROM
genre
INNER JOIN book USING(genre_id)
INNER JOIN buy_book USING(book_id)
GROUP BY name_genre
HAVING SUM(buy_book.amount) <= ALL(
        SELECT SUM(buy_book.amount) AS Количество
        FROM
        genre
        INNER JOIN book USING(genre_id)
        INNER JOIN buy_book USING(book_id)
        GROUP BY name_genre
);

