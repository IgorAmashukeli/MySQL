/*
Add new authors to the author table using an add request, and then output all data from the author table. 
Authors who are in the supply table but not in the author table are considered new.
*/

INSERT INTO author (name_author) 
SELECT 
  author 
FROM 
  (
    supply 
    LEFT JOIN author ON supply.author = author.name_author
  ) 
WHERE 
  author_id IS NULL;