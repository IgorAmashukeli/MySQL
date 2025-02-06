/*
Put in alphabetical order all the authors who write only in one genre. 
Since our tables contain data in such a way that each author has books in only one genre, 
we will make changes to the book table for this query. Let's say Yesenin's book "The Black Man" belongs to the "Novel" genre,
and Bulgakov's book "The White Guard" belongs to "Adventures" (these changes have already been made to the tables)
*/


/*first idea of SQL request*/
SELECT 
  name_author 
FROM 
  author 
WHERE 
  author_id IN (
    SELECT 
      author_id 
    FROM 
      book 
    GROUP BY 
      author_id 
    HAVING 
      COUNT(
        DISTINCT(genre_id)
      ) = 1
  ) 
ORDER BY 
  name_author;


/*second idea of SQL request*/
SELECT 
  name_author 
FROM 
  author 
  INNER JOIN (
    SELECT 
      author_id 
    FROM 
      book 
    GROUP BY 
      author_id 
    HAVING 
      COUNT(
        DISTINCT(genre_id)
      ) = 1
  ) unique_genre ON author.author_id = unique_genre.author_id 
ORDER BY 
  name_author;