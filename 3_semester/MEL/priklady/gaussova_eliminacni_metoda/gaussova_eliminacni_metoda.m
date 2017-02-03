%% zakladni pouziti funkce GAUSS

% matice soustavy
A = [5,2,0,3; 2,6,1,1; 1,0,3,2; 1,-2,2,5]

% vektor pravych stran
b = [14; 1; 9; 16]

% reseni a jeho kontrola
x = gauss(A,b)
A*x-b

%% radkova pivotace
% matice obsahuje nulovy prvek v hlavni diagonale

A = [0,2,3; 0,1,1; 1,0,1]
b = [2; 0; 4]

% reseni bez radkove pivotace
x = gauss_bez_pivotace(A,b)

% reseni s radkovou pivotaci
x = gauss(A,b)

%% ridka matice
% mereni vypocetniho casu ridke matice pro dve varianty funkce GAUSS

% nahrani soustavy
load 335x335.mat

% vizualizace struktury matice soustavy
figure;
spy(A)
title('struktura matice soustavy')

% reseni bez kontroly nulovych prvku
tic
x = gauss_bez_kontroly_nulovych_prvku(A,b);
toc
sum(A*x-b)

% reseni s kontrolou nulovych prvku
tic
x = gauss(A,b);
toc
sum(A*x-b)

%% elektricke obvody v ustalenem stavu
% prima aplikace Kirchhoffovych zakonu (priklad z prezentace)

U01 = 7; U02 = 8;
R1 = 3; R2 = 4; R3 = 2;

R = [-1,1,1; R1,0,R3; 0,R2,-R3]
U0 = [0; U01; -U02]

I = gauss(R,U0)
R*I-U0

%% interpolace dat polynomem
% vypocet koeficientu interpolacniho polynomu (priklad z prezentace)

% vykresleni znamych bodu
figure;
plot([1, 2, 3], [2, 0, 12], 'ob')
hold on
xlabel('x')
ylabel('y')
title('interpolace dat polynomem')

% interpolace polynomem 2. stupne
X = [1,1,1; 4,2,1; 9,3,1]
y = [2; 0; 12]
a = gauss(X,y)

% vycisleni a vykresleni polynomu
xa = linspace(1, 3);
ya = polyval(a, xa);
plot(xa, ya, '-r')
hold off