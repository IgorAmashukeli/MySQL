/*
Display the cities where the customers who placed orders in the online store live. 
Specify the number of orders to each city, and name the Quantity in this column. 
The information is displayed in descending order of the number of orders, and then in alphabetical order by city name
*/

SELECT 
  city.name_city, 
  COUNT(buy_id) AS Amount 
FROM 
  city 
  LEFT JOIN client ON city.city_id = client.city_id 
  LEFT JOIN buy ON client.client_id = buy.client_id 
GROUP BY 
  city.name_city 
ORDER BY 
  Amount DESC, 
  name_city ASC;
