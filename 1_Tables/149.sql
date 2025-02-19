/*
Analyze three price categories (up to 600 rubles, from 600 rubles to 700 rubles, over 700 rubles) and deduce the average price of a book, 
the total value of the remaining books in this price position and the number of items. Round the average price and cost to two decimal places.
Sort the information in ascending order of the lower limit of the price category.
*/


SELECT 
  beg_range, 
  end_range, 
  ROUND(
    AVG(price), 
    2
  ) AS AvgPrice, 
  SUM(price * amount) AS Cost, 
  COUNT(*) AS BookCount 
FROM 
  (
    SELECT 
      beg_range, 
      end_range, 
      price, 
      amount 
    FROM 
      stat 
      INNER JOIN book ON beg_range <= book.price 
      AND book.price <= end_range
  ) AS stat_book 
GROUP BY 
  beg_range, 
  end_range 
ORDER BY 
  beg_range;