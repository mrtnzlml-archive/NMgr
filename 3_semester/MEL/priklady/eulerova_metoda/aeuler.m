function [x, y, tau] = aeuler(fce, interval, y0, h, tolerance)
% AEULER adaptivni Eulerova metoda pro reseni soustav obycejnych diferencialnich rovnic
%   [x, y, tau] = AEULER(fce, interval, y0, h, tolerance) Funkce vraci vektor nezavisle promenne x,
%                                                         vektor reseni y soustavy y' = f(x, y(x)) a
%                                                         vektor lokalni diskretizacni chyby tau
%   fce - odkaz na funkci, ktera navraci reseni soustavy pro zadany vektor x
%   interval - interval reseni, [pocatek, konec]
%   y0 - vektor pocatecnich podminek
%   h - maximalni delka kroku h
%   tolerance - tolerance lokalni diskretizacni chyby

x = [interval(1)];
y = [y0];
tau = [];

i = 1;
while x(end) < interval(2)
    hi = h;

    for j = 1:1e2 % omezeni poctu puleni kroku
        % vypocet noveho reseni
        y0 = y(i,:) + hi * fce(x(i), y(i,:))';

        % odhad chyby metodou polovicniho kroku
        hi = hi/2;
        y1 = y(i,:) + hi * fce(x(i), y(i,:))';
        y2 = y1 + hi * fce(x(i)+hi, y1)';
        taui = max(abs(y0 - y2));

        % kontrola nastavene tolerance
        if tolerance > taui
            x(i+1) = x(i) + 2*hi;
            y(i+1,:) = y0;
            tau(i) = taui;
            break
        end
    end

    i = i + 1;
end
end