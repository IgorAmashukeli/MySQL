/*
Add the last three records to the book table. The first record was already added in the previous step:
    book_id	                        title	            author	        price	        amount
INT PRIMARY KEY AUTO_INCREMENT	VARCHAR(50)	        VARCHAR(30)	       DECIMAL(8,2)	     INT
            1	             Master and Margarita	Bulgakov M.A.	    670.99	          3
            2	              The White Guard	    Bulgakov M.A.	    540.50	          5
            3	                The Idiot	        Dostoevsky F.M.	    460.00	          10
            4	            The Brothers Karamazov	Dostoevsky F.M.	    799.01	          2
*/


INSERT INTO book (title, author, price, amount
) 
VALUES (
    'The White Guard', 'Bulgakov M.A.', 540.50, 5
), (
    'The Idiot', 'Dostoevsky F.M.', 460.00, 10
), (
    'The Brothers Karamazov', 'Dostoevsky F.M.', 799.01, 2
);
