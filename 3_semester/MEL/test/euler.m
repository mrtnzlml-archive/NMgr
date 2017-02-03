function [x, y] = euler(fce, interval, y0, n)
% EULER Eulerova metoda pro reseni soustav obycejnych diferencialnich rovnic
%   [x, y] = EULER(fce, interval, y0, n) Funkce vraci vektor nezavisle promenne x a vektor
%                                        reseni y soustavy y' = f(x, y(x))
%   fce - odkaz na funkci, ktera navraci reseni soustavy pro zadany vektor x
%   interval - interval reseni, [pocatek, konec]
%   y0 - vektor pocatecnich podminek
%   n - pocet kroku deleni intervalu

a = interval(1);
b = interval(2);

% vytvoreni vektoru nezavisle promenne
x = linspace(a, b, n)';
h = (b-a)/(n-1);

% vytvoreni prazdneho vektoru reseni
y = zeros(n, length(y0));

y(1,:) = y0;
for i = 1:(n-1)
    % vypocet reseni v novem kroku
    y(i+1,:) = y(i,:) + h * fce(x(i), y(i,:))';
end
end