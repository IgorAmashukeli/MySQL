

/*one of the ways to do it*/
SET 
  @num_pr := 0;
SET 
  @row_num := 1;
  
  
UPDATE 
  applicant_order 
  INNER JOIN (
    SELECT 
      program_id,
      enrollee_id,
      if(
        program_id = @num_pr, @row_num := @row_num + 1, 
        @row_num := 1
      ) AS str_num, 
      @num_pr := program_id AS add_var 
    from 
      applicant_order
  ) AS str_num_tb ON applicant_order.program_id = str_num_tb.program_id AND applicant_order.enrollee_id = str_num_tb.enrollee_id
SET 
  applicant_order.str_id = str_num_tb.str_num;



/*another way to do it*/

SET 
  @num_pr := 0;
SET 
  @row_num := 1;
  
UPDATE applicant_order
SET str_id := IF(@num_pr = program_id, @row_num := @row_num + 1, @row_num := 1 AND @num_pr := program_id);

