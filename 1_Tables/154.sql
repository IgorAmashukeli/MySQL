
/*
Output the author, title, quantity, price (Retail_price). 
For those books whose number is greater than or equal to 10, display the wholesale discount of 15% (Discount), 
round to two decimal places and display the wholesale price taking into account the discount of -15% (Wholesale Price). 
All attributes can be translated into Russian. Sort by author and book title.
*/


SELECT 
  author AS Author, 
  title AS BookName, 
  amount AS BookAmount, 
  price AS Retail_price, 
  IF(amount >= 10, 15, 0) AS Discount, 
  ROUND(
    IF(
      amount >= 10, 
      price, 
      price * 0.85
    ), 
    2
  ) AS Wholesale_price 
FROM 
  book 
ORDER BY 
  author, 
  title;