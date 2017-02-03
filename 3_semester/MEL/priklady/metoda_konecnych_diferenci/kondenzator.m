% definicni oblast reseni

x(1) = 0;
x(2) = 0.05;
x(3) = 0.1;
x(4) = 0.15;
x(5) = 0.2;
x(6) = 0.25;

y(1) = 0;
y(2) = 0.05;
y(3) = 0.1;
y(4) = 0.15;
y(5) = 0.2;
y(6) = 0.25;
y(7) = 0.3;

% nastaveni okrajovych podminek
OP = ones(length(x), length(y));

% Dirichletova okrajova podminka
OP(1, 1) = 2;   potencial(1, 1) = 0;  
OP(1, 2) = 2;   potencial(1, 2) = 0;
OP(1, 3) = 2;   potencial(1, 3) = 0;
OP(1, 4) = 2;   potencial(1, 4) = 0;
OP(1, 7) = 2;   potencial(1, 7) = 10;

OP(2, 1) = 2;   potencial(2, 1) = 0;
OP(2, 2) = 2;   potencial(2, 2) = 0;
OP(2, 3) = 2;   potencial(2, 3) = 0;
OP(2, 4) = 2;   potencial(2, 4) = 0;
OP(2, 7) = 2;   potencial(2, 7) = 10;

OP(3, 1) = 2;   potencial(3, 1) = 0;
OP(3, 2) = 2;   potencial(3, 2) = 0;
OP(3, 3) = 2;   potencial(3, 3) = 0;
OP(3, 4) = 2;   potencial(3, 4) = 0;
OP(3, 7) = 2;   potencial(3, 7) = 10;

OP(4, 7) = 2;   potencial(4, 7) = 10;
OP(5, 7) = 2;   potencial(5, 7) = 10;

OP(6, 1) = 2;   potencial(6, 1) = 10;
OP(6, 2) = 2;   potencial(6, 2) = 10;
OP(6, 3) = 2;   potencial(6, 3) = 10;
OP(6, 4) = 2;   potencial(6, 4) = 10;
OP(6, 5) = 2;   potencial(6, 5) = 10;
OP(6, 6) = 2;   potencial(6, 6) = 10;
OP(6, 7) = 2;   potencial(6, 7) = 10;

% Neumannova okrajova podminka
OP(1, 5) = 3;   % -dU/dx = 0
OP(1, 6) = 3;   % -dU/dx = 0

OP(4, 1) = 5;   % -dU/dy = 0

OP(5, 1) = 5;   % -dU/dy = 0

% reseni ulohy
U = mkd_2d(x, y, OP, potencial);

% vykresleni vysledku
figure();
contour(x, y, U, 'ShowText', 'on');
xlabel('x (m)');
ylabel('y (m)');

figure();
surf (x, y, U);
xlabel('x (m)');
ylabel('y (m)');
zlabel('U (V)');
colorbar;