function x = gauss(A, b)
% GAUSS Gaussova eliminacni metoda pro reseni soustav linearnich algebraickych rovnic
%   x = GAUSS(A, b) Funkce vraci vektor reseni soustavy rovnic Ax = b
%   A - matice soustavy
%   b - vektor pravych stran

% rozsireni matice soustavy
Ab = [A,b];

% dopredna redukce
n = length(b);
for i = 1:n
    % radkova pivotace
    step = 1;
    while Ab(i,i) == 0
        Ab([i, i+step],:) = Ab([i+step, i],:);
        step = step + 1;
    end

    % prevod na horni trojuhelnikovou matici
    for j = (i+1):n
        if Ab(j,i) ~= 0
            Ab(j,:) = Ab(j,:) - Ab(i,:) * Ab(j,i)/Ab(i,i);
    end
end

% zpetna substituce
x = Ab(:,n+1);
for i = n:-1:1
    x(i) = (x(i) - Ab(i,(i+1):n) * x((i+1):n)) / Ab(i,i);
end
end