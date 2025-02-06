/*
For each individual book, it is necessary to display information about the number of copies sold and their cost for 2020 and 2019 . 
For 2020, those copies that have already been paid for are considered sold. The calculated columns are named Amount and Sum. 
Sort the information in descending order of cost.
*/


SELECT 
  book.title, 
  all_book_group_info.Amount, 
  all_book_group_info.Summa 
FROM 
  book 
  RIGHT JOIN (
    SELECT 
      book_id, 
      SUM(amount) AS Summa, 
      SUM(amount * price) AS Amount 
    FROM 
      (
        SELECT 
          book_id, 
          amount, 
          price 
        FROM 
          buy_archive 
        UNION ALL 
        SELECT 
          book.book_id, 
          buy_book.amount, 
          price 
        FROM 
          book 
          INNER JOIN buy_book USING (book_id) 
          INNER JOIN buy USING(buy_id) 
          INNER JOIN buy_step USING(buy_id) 
          INNER JOIN step USING(step_id) 
        WHERE 
          step.name_step = 'Payment' 
          AND buy_step.date_step_end IS NOT NULL
      ) AS all_book_info 
    GROUP BY 
      all_book_info.book_id
  ) AS all_book_group_info ON book.book_id = all_book_group_info.book_id
ORDER BY all_book_group_info.Сумма DESC;