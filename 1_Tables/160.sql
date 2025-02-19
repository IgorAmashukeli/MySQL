/*
Declare the column "price categories" (price_category): <500 - "low", 500 - 700 - "medium", more than 700 - "high"
To deduce the author, title, category, cost (price * quantity), excluding Yesenin from the authors, from the names of the "The White Guard".
Sort by descending cost and name (ascending)
*/


SELECT 
  author, 
  title, 
  CASE WHEN price < 500 THEN 'low' WHEN price < 700 THEN 'middle' ELSE 'high' END AS price_category, 
  price * amount AS cost 
FROM 
  book 
WHERE 
  author <> 'Yesenin S.A.' 
  AND title <> 'The White Guard' 
ORDER BY 
  cost DESC, 
  title;
