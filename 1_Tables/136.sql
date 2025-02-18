/*
Fill in the step_keyword table as follows: if the keyword is in the step name, 
then include in the step_keyword a string with the step id and the keyword id.
*/



/*the first way*/
INSERT INTO step_keyword (step_id, keyword_id) 
SELECT 
  step.step_id, 
  keyword.keyword_id 
FROM 
  step 
  INNER JOIN keyword 
  /*starts with this word*/
  ON step.step_name LIKE CONCAT(keyword.keyword_name, ' %') 
  /*ends with this word*/
  OR step.step_name LIKE CONCAT('% ', keyword.keyword_name) 
  /*in the middle of the word*/
  OR step.step_name LIKE CONCAT('% ', keyword.keyword_name, ' %') 
  /*has comma just after the word at the start*/
  OR step.step_name LIKE CONCAT(keyword.keyword_name, ',%') 
  /*has comma just after the word in the middle of the sentence*/
  OR step.step_name LIKE CONCAT('% ', keyword.keyword_name, ',%') 
  /*has ( just after the word at the start*/
  OR step.step_name LIKE CONCAT(keyword.keyword_name, '(%') 
  /*has ( just after the word in the middle of the sentence*/
  OR step.step_name LIKE CONCAT('% ', keyword.keyword_name, '(%');


  /*the better way*/
INSERT INTO step_keyword (step_id, keyword_id) 
SELECT 
  step.step_id, 
  keyword.keyword_id 
FROM 
  step 
  INNER JOIN keyword 
  /*regular expression for boundaries*/
  ON step.step_name RLIKE CONCAT(
    '\\b', keyword.keyword_name, '\\b'
  );
