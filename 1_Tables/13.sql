/*

Display the author and title of books where the amount falls within the range from 2 to 14 (inclusive). 
Sort the results first by author in reverse alphabetical order, then by book title in alphabetical order.

*/

SELECT 
  author, 
  title 
FROM 
  book 
WHERE 
  (
    amount >= 2 
    AND amount <= 14
  ) 
ORDER BY 
  author DESC, 
  title;