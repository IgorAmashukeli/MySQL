/*
Create a new store table in which to enter data from the book and supply tables, 
provided that the number of books is greater than the average number of books in the two tables; if the book is in both tables, 
then choose the larger of the two. Sort the data from the table by author's name in alphabetical order and in descending order of price. 
Output data from the resulting table.
*/



/*one way to do it*/
CREATE TABLE store(
  SELECT 
    title, 
    author, 
    MAX(price) AS price, 
    SUM(amount) AS amount 
  FROM 
    (
      SELECT 
        title, 
        author, 
        price, 
        amount 
      FROM 
        book 
      UNION ALL 
      SELECT 
        title, 
        author, 
        price, 
        amount 
      FROM 
        supply
    ) AS bo_su 
  GROUP BY 
    title, 
    author 
  HAVING 
    SUM(amount) > (
      SELECT 
        AVG(amount) AS tot_a 
      FROM 
        (
          SELECT 
            amount 
          FROM 
            book 
          UNION ALL 
          SELECT 
            amount 
          FROM 
            supply
        ) AS book_supply
    ) 
  ORDER BY 
    title, 
    price DESC
);
SELECT 
  * 
FROM 
  store;



/*another way to do it*/
CREATE TABLE store(
  WITH book_supply AS (
    SELECT 
      title, 
      author, 
      price, 
      amount 
    FROM 
      book 
    UNION ALL 
    SELECT 
      title, 
      author, 
      price, 
      amount 
    FROM 
      supply
  ) 
  SELECT 
    title, 
    author, 
    MAX(price) AS price, 
    SUM(amount) AS amount 
  FROM 
    book_supply 
  GROUP BY 
    title, 
    author 
  HAVING 
    SUM(amount) > (
      SELECT 
        AVG(amount) 
      FROM 
        book_supply
    ) 
  ORDER BY 
    title, 
    author, 
    price DESC
);
SELECT 
  * 
FROM 
  store;

