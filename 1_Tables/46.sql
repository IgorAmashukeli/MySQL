/*
The first 5 rows have already been entered in the fine table. Add entries with key values 6, 7, and 8 to the table.

fine_id	name	number_plate	violation	sum_fine	date_violation	date_payment
1 Baranov P.E. R 523 W Speeding
(from 40 to 60) 500.00 2020-01-12 2020-01-17
2 Abramova K.A. O111AV Passage to the
forbidding signal 1000.00 2020-01-14 2020-02-27
3 Yakovlev G.R. T330TT Speeding
(from 20 to 40) 500.00 2020-01-23 2020-02-23
4 Yakovlev G.R. M701AA Speeding
(from 20 to 40) 2020-01-12	 
5 Kolesov S.P. K892AH Speeding
(from 20 to 40) 2020-02-01	 
6 Baranov P.E. R 523 W Speeding
(from 40 to 60) 2020-02-14	 
7 Abramova K.A. O111AV Passage to the
forbidding signal 2020-02-23	 
8 Yakovlev G.R. T330TT Passage to the
forbidding signal 2020-03-03
*/

INSERT INTO fine (
  name, number_plate, violation, sum_fine, 
  date_violation, date_payment
) 
VALUES 
  (
    'Baranov P.E.', 'Р523ВТ', 
    'Speeding(from 40 to 60)', 
    NULL, '2020-02-14', NULL
  ), 
  (
    'Abramova K.A.', 'О111АВ', 
    'Driving on a no-go signal', 
    NULL, '2020-02-23', NULL
  ), 
  (
    'Yakovlev G.R.', 'Т330ТТ', 
    'Driving on a no-go signal', 
    NULL, '2020-03-03', NULL
  );
SELECT 
  * 
FROM 
  fine;