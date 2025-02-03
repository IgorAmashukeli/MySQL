/*

Display the title and author of books where the title consists of two or more words, and the author's initials contain the letter 'C'. 
Assume that words in the title are separated by spaces and do not contain punctuation marks, 
there is a mandatory space between the author's surname and initials, and the initials are formatted without spaces as: letter, period, letter, period. 
Sort the information by book title in alphabetical order.
*/

SELECT 
  title, 
  author 
FROM 
  book 
WHERE 
  (
    (title LIKE "% %") 
    AND (author LIKE "%C.%")
  );