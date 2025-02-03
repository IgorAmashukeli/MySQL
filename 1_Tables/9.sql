/*
An analysis of book sales revealed that the books of Mikhail Bulgakov are the most popular, followed by the books of Sergey Yesenin. 
Based on this, it was decided to raise the price of Bulgakov's books by 10%, and the price of Yesenin's books by 5%. 
Write a query that includes the author, book title, and the new price, with the last column named new_price. 
The value should be rounded to two decimal places.
*/

SELECT 
  author, 
  title, 
  ROUND(
    IF(
      author = "Bulgakov M.A.", 
      price * 1.1, 
      IF (
        author = "Yesenin S.A.", 
        price * 1.05, price
      )
    ), 
    2
  ) AS new_price FROM book;
