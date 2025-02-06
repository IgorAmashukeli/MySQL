/*
Select all the clients who ordered Dostoevsky's books, and display the information in alphabetical order. 
In the solution, use the author's last name, not his id.
*/


SELECT 
  DISTINCT(client.name_client) 
FROM 
  client 
  INNER JOIN buy USING(client_id) 
  INNER JOIN buy_book USING(buy_id) 
  INNER JOIN book USING(book_id) 
  INNER JOIN author USING(author_id) 
WHERE 
  author.name_author = 'Dostoevski F.M.' 
ORDER BY 
  client.name_client;

