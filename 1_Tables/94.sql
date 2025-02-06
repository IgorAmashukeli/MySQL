/*
Create a general invoice (buy_pay table) for the payment of an order with the number 5. 
Where to include the order number, the number of books in the order (the name of the Quantity column) and its total cost (the name of the Total column).
Use a SINGLE query to solve the problem.
*/

CREATE TABLE buy_pay (
  SELECT 
    buy_book.buy_id, 
    SUM(buy_book.amount) AS Amount, 
    SUM(buy_book.amount * book.price) AS Total 
  FROM 
    book 
    INNER JOIN buy_book ON book.book_id = buy_book.book_id 
    AND buy_book.buy_id = 5 
  GROUP BY 
    buy_book.buy_id
);
