%% porovnani Jacobiho a Gauss-Seidelovi metody

% nahrani soustavy
load 335x335.mat

% vizualizace struktury matice soustavy
figure;
spy(A)
title('struktura matice soustavy')

% vektor pocatecniho reseni
x0 = zeros(length(b), 1);

%% Jacobiho metoda

tic
x = jacobi(A,b,x0,1e-4);
toc
sum(A*x-b)

%% Gauss-Seidelova metoda

tic
x = gauss_seidel(A,b,x0,1e-4);
toc
sum(A*x-b)