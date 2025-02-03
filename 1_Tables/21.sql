/*
Calculate the total cost of all copies of each author’s books, excluding the books "Idiot" and "The White Guard".
Include only those authors whose total book cost (excluding "Idiot" and "The White Guard") exceeds 5000 rubles.
Name the calculated column Total_Cost. Sort the results in descending order of cost.
*/


SELECT 
  author, 
  SUM(price * amount) AS Total_Cost 
FROM 
  book 
WHERE 
  (
    title <> 'Idiot' 
    AND title <> 'The White Guard'
  ) 
GROUP BY 
  author 
HAVING 
  SUM(price * amount) > 5000 
ORDER BY 
  Total_Cost DESC;
