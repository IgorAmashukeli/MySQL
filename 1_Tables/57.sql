/*
Create a book table with the same structure as in the previous step. 
We assume that when an author is deleted from the author table, 
all book entries written by that author should be deleted from the book table. 
And when deleting a genre from the genre table, set the corresponding book entry to Null in the genre_id column.
*/

CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    author_id INT NOT NULL,
    genre_id INT,
    price DECIMAL(8, 2),
    amount INT,
    FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE SET NULL
);
