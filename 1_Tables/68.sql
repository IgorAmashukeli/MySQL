/*
If there are identical books in the supply and book tables that have the same price,
output their name and author, and also calculate the total number of copies of books in the supply and book tables,
name the Name, Author, and Quantity columns.
*/



SELECT book.title AS Title, name_author AS Author, supply.amount + book.amount AS Amount
FROM 
    author 
    INNER JOIN book USING (author_id)   
    INNER JOIN supply ON book.title = supply.title 
                         and author.name_author = supply.author
                         and book.price = supply.price;