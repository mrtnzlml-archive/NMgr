function [x, y] = runge_kutta(fce, interval, y0, n)
% RUNGE_KUTTA Runge-Kuttova metoda pro reseni soustav obycejnych diferencialnich rovnic
%   [x, y] = RUNGE_KUTTA(fce, interval, y0, n) Funkce vraci vektor nezavisle promenne x
%                                              a vektor reseni y soustavy y' = f(x, y(x))
%   fce - odkaz na funkci, ktera navraci reseni soustavy pro zadany vektor x
%   interval - interval reseni, [pocatek, konec]
%   y0 - vektor pocatecnich podminek
%   n - pocet kroku deleni intervalu

a = interval(1);
b = interval(2);

% vytvoreni vektoru nezavisle promenne
x = linspace(a, b, n+1)';
h = (b-a)/n;

% vytvoreni prazdneho vektoru reseni
y = zeros(n+1, length(y0));

y(1,:) = y0;
for i = 1 : (length(x) - 1)
    % odhady derivaci resene soustavy
    k_1 = fce(x(i), y(i,:))';
    k_2 = fce(x(i) + 1/2*h, y(i,:) + 1/2*h*k_1)';
    k_3 = fce(x(i) + 1/2*h, y(i,:) + 1/2*h*k_2)';
    k_4 = fce(x(i) + h, y(i, :) + k_3*h)';

    % vypocet reseni v novem kroku
    y(i+1,:) = y(i,:) + h*(k_1 + 2*k_2 + 2*k_3 + k_4)/6;
end
end