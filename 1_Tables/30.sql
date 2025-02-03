/*
Add four entries to the supply table to get the following table:

supply_id title	author	price	amount
1 Lyrics by Pasternak B.L. 518.99 2
2 The black man Yesenin S.A. 570.20 6
3 The White Guard Bulgakov M.A. 540.50 7
4 The idiot Dostoevsky F.M. 360.80 3

*/


INSERT INTO supply (title, author, price, amount) 
VALUES 
  (
    'Lyrics', 'Pasternak B.L.', 518.99, 
    2
  ), 
  (
    'Black Man', 'Yesenin S.A.', 570.20, 
    6
  ), 
  (
    'White Guard', 'Bulgakov M.A.', 540.50, 
    7
  ), 
  (
    'Idiot', 'Dostoevsky F.M.', 360.80, 
    3
  );