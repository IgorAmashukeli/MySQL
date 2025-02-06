/*
Compare the monthly revenue from the sale of books for the current and previous years. 
To do this, output the year, month, and amount of revenue sorted first in ascending order of months, then in ascending order of years. 
Column names: Year, Month, Amount.
*/



SELECT 
  YEAR(date_payment) AS YEAR, 
  MONTHNAME(date_payment) AS MONTH, 
  SUM(price * amount) AS Amount 
FROM 
  buy_archive 
GROUP BY 
  YEAR(date_payment), 
  MONTHNAME(date_payment) 
UNION ALL 
SELECT 
  YEAR(buy_step.date_step_end) AS YEAR, 
  MONTHNAME(buy_step.date_step_end) AS MONTH, 
  SUM(book.price * buy_book.amount) AS Amount 
FROM 
  book 
  INNER JOIN buy_book USING(book_id) 
  INNER JOIN buy USING(buy_id) 
  INNER JOIN buy_step USING(buy_id) 
  INNER JOIN step USING(step_id) 
WHERE 
  step.name_step = 'Payment' 
  AND buy_step.date_step_end IS NOT NULL 
GROUP BY 
  YEAR(buy_step.date_step_end), 
  MONTHNAME(buy_step.date_step_end) 
ORDER BY 
  MONTH ASC, 
  YEAR ASC;