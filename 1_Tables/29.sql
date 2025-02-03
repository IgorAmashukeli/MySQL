/*
Create a stock that contains the same structure as the product book.

Type field, description
supply_id INT PRIMARY KEY AUTO_INCREMENT
header VARCHAR(50)
author VARCHAR(30)
price DECIMAL(8, 2)
amount INT
*/

CREATE TABLE supply (
  supply_id INT PRIMARY KEY AUTO_INCREMENT, 
  title VARCHAR(50), 
  author VARCHAR(30), 
  price DECIMAL(8, 2), 
  amount INT
);