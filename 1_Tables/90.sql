/*
Create a new order for Ilya Popov. His comment for the order: "Contact me about the delivery."

Important! The solution cannot use VALUES or select by client_id.
*/


INSERT INTO buy (buy_description, client_id) 
SELECT 
  'Contact me about the delivery', 
  client_id 
FROM 
  client 
WHERE 
  name_client = 'Ilya Popov';
