/*
Determine the shipping cost:
- for books costing 500 or less, set the amount to 99.99
- if the number of books in stock is less than 5, set the amount to 149.99
- for all other cases, delivery should be free
Determine the new cost for books:
- for books with a total value of more than 5,000, add 20% to the cost per copy
- for other cases, reduce the cost of one copy by 20%
Configure the filter when selecting:
- only the positions of the authors: Bulgakov and Yesenin, with the number of copies in stock: from 3 to 14 inclusive.
Perform sorting:
- by author's name in ascending order
- then by name in descending order
- by shipping cost (from lower to higher)
The data should be displayed in the table:
- the author
- name
- quantity
- the price is like real_price
- new price as new_price (rounded to two decimal places)
- shipping cost as delivery_price
*/

SELECT 
  author, 
  title, 
  amount, 
  price AS real_price, 
  ROUND(
    IF(
      price * amount > 5000, price * 1.2, price * 0.8
    ), 
    2
  ) AS new_price, 
  IF(
    price < 500, 
    99.99, 
    IF(amount < 5, 149.99, 0)
  ) AS delivery_price 
FROM 
  book 
WHERE 
  (
    author = 'Bulgakov M.A.' 
    OR author = 'Yesenin S.A.'
  ) 
  AND (
    amount >= 3 
    AND amount <= 14
  ) 
ORDER BY 
  author, 
  title DESC, 
  delivery_price;