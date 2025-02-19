/*
In the last order (buy_book table) of the client Pavel Baranov, add one copy of all Dostoevsky's books that are in the book table.
*/



INSERT INTO buy_book (buy_id, book_id, amount) (
  SELECT 
    MAX(buy_id) AS buy_id, 
    book_id, 
    1 AS amount 
  FROM 
    author 
    INNER JOIN book USING(author_id) 
    INNER JOIN client ON client.name_client = 'Pavel Baranov' 
    AND author.name_author = 'Dostoevsky F.M.' 
    INNER JOIN buy USING(client_id) 
  GROUP BY 
    book_id, 
    amount
);
SELECT 
  * 
FROM 
  buy_book;


/*another way to do it*/
SET @bl_buy_id := (
    SELECT MAX(buy_id)
    FROM
    buy
    INNER JOIN client USING(client_id)
    WHERE client.name_client = 'Pavel Baranov'
);


INSERT INTO buy_book (buy_id, book_id, amount)
(
    SELECT @bl_buy_id, book_id, 1 AS amount
    FROM
    author
    INNER JOIN book USING(author_id)
    WHERE author.name_author = 'Dostoevsky F.M.'
    
);

SELECT * FROM buy_book;