/*
Due to the increased demand for classical literature by schoolchildren in the format "Is there the same thing, 
but shorter to read less?" The series "Graphoman I." was released. Summary".
In Data selection:
- add "Graphomaniac and " to the author's name;
- to add to the title of the book. " Summary.";
- set the price for the new opus to 40% of the original price, but not more than 250. (If 40% is more than 250, then the price should be 250);
- depending on the remaining stock, output "Demand": up to 3 (inclusive) - high, up to 10 (inclusive) - medium, otherwise low;
- add a "Availability" column depending on the quantity: 1-2 pieces - very few, 3-14 - in stock, 15 and more - a lot;
- Sort by price in ascending order, then by Demand from high to low, and then by book title in alphabetical order.
*/


SELECT 
  CONCAT('Graphomaniac и ', author) AS Author, 
  CONCAT(title, '. Brief content.') AS BookName, 
  LEAST(price * 0.4, 250) AS Price, 
  IF(
    amount <= 3, 
    'high', 
    IF(amount <= 10, 'middle', 'low')
  ) AS Demand, 
  IF(
    amount <= 2, 
    'very few', 
    IF(amount <= 14, 'availavle', 'many')
  ) AS BookAvailability 
FROM 
  book 
ORDER BY 
  Price, 
  amount, 
  BookName;