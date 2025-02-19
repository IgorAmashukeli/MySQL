/*
Reduce the prices of books that cost more than 600 rubles by 20%. 
Display information about books, discount (sale_20 column) and the discounted book price (price_sale).  
Round the results to two decimal places. For those books for which the discount does not apply, print the "-" symbol in the last two columns.  
Sort the information first by the author's last name, and then by the book title.
*/


SELECT 
  author, 
  title, 
  price, 
  amount, 
  IF(
    price > 600, 
    ROUND(price * 0.2, 2), 
    '-'
  ) AS sale_20, 
  IF(
    price > 600, 
    ROUND(price * 0.8, 2), 
    '-'
  ) AS price_sale 
FROM 
  book 
ORDER BY 
  author, 
  title;