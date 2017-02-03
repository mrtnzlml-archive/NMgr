% swap 2 and 3 row

A = [1 2 3; 4 5 6; 7 8 9];
A2 = A(2, :); % row 2
A3 = A(3, :); % row 3
A(2, :) = A3;
A(3, :) = A2;

A
