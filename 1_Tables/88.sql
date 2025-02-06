/*
Count CCR = 1 - regular customers in 2 years / all customers in 2019
*/



SELECT 
  ROUND(1 - now_count/before_count, 2) AS CCR
FROM 
  (
    SELECT 
      COUNT(
        DISTINCT(buy_archive.client_id)
      ) AS before_count, 
      COUNT(
        DISTINCT(buy.client_id)
      ) AS now_count 
    FROM 
      buy 
      RIGHT JOIN buy_archive ON buy_archive.client_id = buy.client_id
  ) counts;