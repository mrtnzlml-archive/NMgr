function x = newton(fce, interval, x0, epsilon)
% NEWTON Newtonova metoda pro reseni nelinearnich algebraickych rovnic
%   x = NEWTON(fce, interval, x0, epsilon) Funkce vraci reseni rovnice f(x) = 0
%   fce - odkaz na funkci, ktera navraci reseni rovnice pro zadane x
%   interval - interval reseni, [pocatek, konec]
%   x0 - pocatecni reseni
%   epsilon - pozadovana relativni chyba reseni

a = interval(1);
b = interval(2);
n = 1e4; % omezeni poctu iteraci

% odhad kroku pro vypocet derivace
dx = (b-a)/n;

for i = 1:n
    % kontrola intervalu
    if x0 < a || x0 > b
        x = inf;
        return
    end

    % vypocet reseni rovnice pro x0
    y0 = fce(x0);

    % vypocet derivace rovnice v x0
    dy = (fce(x0+dx)-y0)/dx;
    if dy == 0
        x = inf;
        return
    end

    % vypocet noveho parametru a reseni
    x = x0 - y0/dy;
    y = fce(x);

    % vypocet chyby reseni
    err = abs(y-y0)/y;

    % kontrola na pozadovanou chybu reseni
    if err <= epsilon
        return
    end

    x0 = x;
end
end