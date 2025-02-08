/*
To include a new attempt in the attempt table for Pavel Baranov, a student in the discipline "Fundamentals of Databases".
Set the current date as the date of the attempt.
*/

/*the first way*/
INSERT INTO attempt (
  student_id, subject_id, date_attempt
) 
SELECT 
  student.student_id, 
  subject.subject_id, 
  CURDATE() 
FROM 
  student 
  INNER JOIN subject 
WHERE 
  student.name_student = 'Baranov Pavel' 
  AND subject.name_subject = 'Basics of databases';
SELECT 
  * 
FROM 
  attempt;


/*the second way*/
INSERT INTO attempt(
  student_id, subject_id, date_attempt
) 
VALUES 
  (
    (
      SELECT 
        student_id 
      FROM 
        student 
      WHERE 
        name_student = 'Baranov Pavel'
    ), 
    (
      SELECT 
        subject_id 
      FROM 
        subject 
      WHERE 
        name_subject = 'Basics of databases'
    ), 
    '2020-05-25'
  );