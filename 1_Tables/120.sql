/*
Calculate how many additional points each applicant will receive. 
The column with additional points is called a Bonus. 
The information should be displayed in a form sorted by last name.
*/



SELECT 
  enrollee.name_enrollee, 
  IF(
    SUM(achievement.bonus) IS NULL, 
    0, 
    SUM(achievement.bonus)
  ) AS Bonus 
FROM 
  enrollee 
  LEFT JOIN enrollee_achievement USING(enrollee_id) 
  LEFT JOIN achievement USING(achievement_id) 
GROUP BY 
  enrollee.name_enrollee 
ORDER BY 
  enrollee.name_enrollee;