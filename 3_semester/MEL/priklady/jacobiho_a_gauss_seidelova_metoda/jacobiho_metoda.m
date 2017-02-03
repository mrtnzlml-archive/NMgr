%% zakladni pouziti funkce JACOBI
% porovnani vysledku reseni pro ruzne zvolenou relativni chybu reseni

A = [5,2,0,3; 2,6,1,1; 1,0,3,2; 1,-2,2,5]
b = [14; 1; 9; 16]

% vektor pocatecniho reseni
x0 = [0;0;0;0]

%% relativni chyba 1e-1

x = jacobi(A,b,x0,1e-1);
A*x-b

%% relativni chyba 1e-3

x = jacobi(A,b,x0,1e-3);
A*x-b

%% relativni chyba 1e-9

x = jacobi(A,b,x0,1e-9);
A*x-b