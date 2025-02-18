/*
Select all the steps that address nested queries (i.e. the step name mentions nested queries). 
Specify which lesson and module they belong to. To do this, output 3 fields:

in the Module field, specify the module number and its name separated by a space.;
In the Lesson field, specify the module number, the lesson sequence number (lesson_position) separated by a dot and the lesson name separated by a space.;
In the Step field, specify the module number, the lesson sequence number (lesson_position) separated by a dot, the step sequence number (step_position) 
separated by a dot, and the step name separated by a space.
The length of the Module and Lesson fields should be limited to 19 characters, while the labels that are too 
long should be marked with an ellipsis at the end (16 characters are the number of the module or lesson, a space and the name of the Lesson or Module, 
and add "..." to them). 
Sort the information in ascending order of module numbers, lesson sequence numbers, and step sequence numbers.
*/


/*case insensitive (ci) collation to search for both uppercase and lowercase substrings*/
/*case insensitive (ci) collation to search for both uppercase and lowercase substrings*/
SET 
  @descL := '%nested% quer%' COLLATE utf8mb4_0900_ai_ci;
SET 
  @limit := 19;
SET 
  @dots := '...';
SET 
  @dot := '.';
SET 
  @space = ' ';
SELECT 
  IF (
    LENGTH(
      CONCAT(
        module.module_id, @space, module.module_name
      )
    ) <= @limit, 
    CONCAT(
      module.module_id, @space, module.module_name
    ), 
    CONCAT(
      LEFT(
        CONCAT(
          module.module_id, @space, module.module_name
        ), 
        @limit - LENGTH(@dots)
      ), 
      @dots
    )
  ) AS Module, 
  IF(
    LENGTH(
      CONCAT(
        module.module_id, @dot, lesson.lesson_position, 
        @space, lesson.lesson_name
      )
    ) <= @limit, 
    CONCAT(
      module.module_id, @dot, lesson.lesson_position, 
      @space, lesson.lesson_name
    ), 
    CONCAT(
      LEFT(
        CONCAT(
          module.module_id, @dot, lesson.lesson_position, 
          @space, lesson.lesson_name
        ), 
        @limit - LENGTH(@dots)
      ), 
      @dots
    )
  ) AS Lesson, 
  CONCAT(
    module.module_id, @dot, lesson.lesson_position, 
    @dot, step.step_position, @space, 
    step.step_name
  ) AS Step 
FROM 
  module 
  INNER JOIN lesson USING(module_id) 
  INNER JOIN step USING(lesson_id) 
WHERE 
  step.step_name LIKE @descL 
ORDER BY 
  module.module_id, 
  lesson.lesson_position, 
  step.step_position;