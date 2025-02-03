/*
Add a new row to the book table (text values of type VARCHAR should be enclosed either in double or single quotes):

book_id	                           title	                author	        price	    amount
INT PRIMARY KEY AUTO_INCREMENT	VARCHAR(50)	              VARCHAR(30)	  DECIMAL(8,2)	 INT
1	                            Master and Margarita      Bulgakov M.A.	    670.99	      3
*/


INSERT INTO book (title, author, price, amount
) 
VALUES 
  (
    'Master and Margarita', 
    'Bulgakov M.A.', 670.99, 
    3
  );

