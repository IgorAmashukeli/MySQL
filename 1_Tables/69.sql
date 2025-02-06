/*
For books that are already in stock (in the book table), but at a different price than in the supply, it is necessary to increase the quantity 
in the book table by the value specified in the delivery and recalculate the price. And in the supply table, reset the number of these books. 
The formula for recalculating the price:

price = (p_1 * k_1 + p_2 * k_2) / (k_1 + k_2)

where 
k_1, k_2 - amount of books in book and supply
p_1, p_2 - price of books in book and supply

*/


UPDATE 
  book 
  INNER JOIN author ON book.author_id = author.author_id 
  INNER JOIN supply ON supply.author = author.name_author 
  AND supply.title = book.title 
  AND book.price <> supply.price 
SET 
  book.amount = book.amount + supply.amount, 
  book.price = (
    (book.price * book.amount) + (supply.price * supply.amount)
  ) / (book.amount + supply.amount), 
  supply.amount = 0;