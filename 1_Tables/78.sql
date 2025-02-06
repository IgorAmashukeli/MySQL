/*
Calculate how many times each book has been ordered, and for the book, output its author (you need to calculate how many orders each book appears in). 
Print the last name and initials of the author, the title of the book, and name the Amount in the last column. 
Sort the result first by the authors' last names, and then by the titles of the books.
*/

SELECT 
  author.name_author, 
  book.title, 
  COUNT(buy_book.amount) AS Amount 
FROM 
  buy_book 
  RIGHT JOIN book ON buy_book.book_id = book.book_id 
  INNER JOIN author ON author.author_id = book.author_id 
GROUP BY 
  author.name_author, 
  book.title 
ORDER BY 
  author.name_author ASC, 
  book.title ASC;
