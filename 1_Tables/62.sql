/*
It is necessary to hold an exhibition of books by each author in each city during 2020.
Choose the date of the exhibition at random. Create a query that outputs the city, author,
and date of the exhibition. The last column is called the Date.
The information should be displayed by sorting first in alphabetical order by city names,
and then in descending order by exhibition dates.
*/

SELECT 
  name_city, 
  name_author, 
  ADDDATE(
    '2020-01-01', 
    FLOOR(
      1 + RAND() * 365
    )
  ) AS ExhibitionDate 
FROM 
  city, 
  author 
ORDER BY 
  name_city ASC, 
  ExhibitionDate DESC;