/*
*/



SELECT 
author AS Author, 
title AS BookTitle, 
price AS Price,
CASE 
    WHEN price <= 600 THEN 'pen'
    WHEN price <= 700 THEN 'children\'s coloring book'
    ELSE 'horoscope'
END
AS Gift
FROM book
WHERE price >= 500
ORDER BY author, title;
