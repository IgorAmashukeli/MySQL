/*
For customers with orders above the average in terms of customer orders (the total value of all customer orders), output the name, 
the total amount of all orders, the number of orders, and the number of books ordered. We will offer these customers a special loyalty program! 
Sort the information by customer name (in alphabetical order).
*/


SELECT 
  name_client, 
  Total_order_amount, 
  OrdersTotal, 
  BookTotal 
FROM 
  (
    SELECT 
      name_client, 
      SUM(book.price * buy_book.amount) AS Total_order_amount, 
      COUNT(DISTINCT buy_id) AS OrdersTotal, 
      SUM(buy_book.amount) AS BookTotal, 
      AVG(
        SUM(book.price * buy_book.amount)
      ) OVER () AS avg_cost 
    FROM 
      client 
      INNER JOIN buy USING(client_id) 
      INNER JOIN buy_book USING(buy_id) 
      INNER JOIN book USING(book_id) 
    GROUP BY 
      name_client
  ) AS buy_cost 
WHERE 
  Total_order_amount > buy_cost.avg_cost 
ORDER BY 
  name_client;
