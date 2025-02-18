/*
Delete from the attempt table all attempts made before May 1, 2020. Also, delete all questions corresponding to these attempts from the testing table.
*/


DELETE FROM attempt
WHERE attempt.date_attempt < '2020-05-01';

SELECT * FROM attempt;
SELECT * FROM testing;