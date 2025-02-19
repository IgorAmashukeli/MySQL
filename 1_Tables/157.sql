/*
The store found that the classics are no longer popular, so it is necessary in the selection:

1. Change all the authors to "Dontsova Darya".

2. Add "Evlampia Romanova and" to the title of each book at the beginning (a space at the end).

3. Raise the price by 42% (round it to two decimal places).

4. Sort the prices in descending order.
*/



SELECT 
  'Doncova Daria' AS author, 
  CONCAT(
    'Evamplia Romanova and ', 
    title
  ) AS title, 
  ROUND(price * 1.42, 2) AS price 
FROM 
  book 
ORDER BY 
  price DESC;