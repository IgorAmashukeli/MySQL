/*
Create a book table with the following structure:

Type field, description of the Link
book_id	INT PRIMARY KEY AUTO_INCREMENT	 
title VARCHAR(50)
author_id INT foreign key:
main author table,
associated author column.author_id,
empty value is not allowed
price DECIMAL(8, 2)
amount INT

Rewrite the request to create the book table so that its structure matches the structure shown in the logical diagram (the genre table has already been created, 
the column order is as in the logical diagram in the book table, genre_id is the foreign key).
For genre_id, the restriction about the inadmissibility of empty values is not set.
Use the genre table with the following structure as the main table for describing the genre_id field:

Type and description field
genre_id	INT PRIMARY KEY AUTO_INCREMENT
name_genre	VARCHAR(30)

DIAGRAM: 
author (author_id) > book (author_id)
genre (genre_id) -> book (genre_id)
*/

CREATE TABLE book (
  book_id INT PRIMARY KEY AUTO_INCREMENT, 
  title VARCHAR(50), 
  author_id INT NOT NULL, 
  genre_id INT, 
  price DECIMAL(8, 2), 
  amount INT, 
  FOREIGN KEY (author_id) REFERENCES author (author_id), 
  FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
);