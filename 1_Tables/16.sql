/*
Count the number of distinct books and the total number of book copies for each author stored in the warehouse. 
Name the columns Author, Distinct_Books, and Total_Copies, respectively.
*/

select 
  author AS Author, 
  COUNT(title) AS Distinct_Books, 
  SUM(amount) AS Total_Copies 
FROM 
  book 
GROUP BY 
  author;
