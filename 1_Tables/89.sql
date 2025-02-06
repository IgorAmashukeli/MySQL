/*
Add a new person to the table with clients. His name is Ilya Popov, his email is popov@test, and he lives in Moscow.
*/


INSERT INTO client (name_client, city_id, email) 
SELECT 
  'Ilya Popov', 
  city_id, 
  'popov@test' 
FROM 
  city 
WHERE 
  name_city = 'Moscow';

