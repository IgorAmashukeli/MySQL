/*
Display the surname and initials of the author, as well as the minimum, maximum, and average book price for each author. 
Name the calculated columns Minimum_Price, Maximum_Price, and Average_Price, respectively.
*/


select 
  author AS Author, 
  COUNT(title) AS Distinct_Books, 
  SUM(amount) AS Total_Copies 
FROM 
  book 
GROUP BY 
  author;