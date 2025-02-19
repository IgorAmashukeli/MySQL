/*
Find the question to which the maximum number of correct answers was given - 
"the easiest" and the question to which the minimum number of correct answers was given - "the most difficult". To deduce the subject, these two questions, 
and the indication of whether this is the most difficult or easiest question. First, output the easiest query, then the most difficult one.
*/




WITH all_nn (name_subject, name_question, difficulty, max_diff, min_diff)
AS
(SELECT 
  name_subject, 
  name_question, 
  AVG(is_correct) AS difficulty,
  MAX(AVG(is_correct)) OVER() as max_diff,
  MIN(AVG(is_correct)) OVER() as min_diff
FROM 
  subject 
  INNER JOIN question USING(subject_id) 
  INNER JOIN testing USING(question_id) 
  INNER JOIN answer USING(answer_id, question_id) 
GROUP BY 
  name_subject, 
  name_question
) 
SELECT name_subject, name_question, IF(all_nn.difficulty = all_nn.max_diff, 'the easiest', 'the most difficult') AS Difficulty
FROM
all_nn
WHERE all_nn.difficulty = all_nn.max_diff OR all_nn.difficulty = all_nn.min_diff
ORDER BY all_nn.difficulty DESC;



/*using FIELD to sort by string attribute*/

WITH all_nn (
  name_subject, name_question, difficulty, 
  max_diff, min_diff
) AS (
  SELECT 
    name_subject, 
    name_question, 
    AVG(is_correct) AS difficulty, 
    MAX(
      AVG(is_correct)
    ) OVER() as max_diff, 
    MIN(
      AVG(is_correct)
    ) OVER() as min_diff 
  FROM 
    subject 
    INNER JOIN question USING(subject_id) 
    INNER JOIN testing USING(question_id) 
    INNER JOIN answer USING(answer_id, question_id) 
  GROUP BY 
    name_subject, 
    name_question
) 
SELECT 
  name_subject, 
  name_question, 
  IF(
    all_nn.difficulty = all_nn.max_diff, 
    'the easiest', 'the most difficult'
  ) AS Difficulty 
FROM 
  all_nn 
WHERE 
  all_nn.difficulty = all_nn.max_diff 
  OR all_nn.difficulty = all_nn.min_diff 
ORDER BY 
  FIELD(
    Difficulty, 'the easiest', 
    'the most difficult'
  );