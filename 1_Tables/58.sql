/*
Add the last three entries (with key values 6, 7, 8) to the book table, the first 5 entries have already been added.:

book_id	title	author_id	genre_id	price	amount
1 The Master and Margarita 1 1 670.99 3
2 The White Guard 1 1 540.50 5
3 Idiot 2 1 460.00 10
4 The Brothers Karamazov 2 1 799.01 3
5 Player 2 1 480.50 10
6 Poems and poetry 3 2 650.00 15
7 Black man 3 2 570.20 6
8 Lyrics 4 2 518.99 2
*/


INSERT INTO book (
  title, author_id, genre_id, price, 
  amount
) 
VALUES 
  (
    'Poems and poetry', 
    3, 2, 650.00, 15
  ), 
  (
    'The Black Man', 3, 
    2, 570.20, 6
  ), 
  ('Lyrics', 4, 2, 518.99, 2);
SELECT 
  * 
FROM 
  book;