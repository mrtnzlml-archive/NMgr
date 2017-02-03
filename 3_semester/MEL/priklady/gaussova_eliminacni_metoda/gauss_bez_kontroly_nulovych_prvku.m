function x = gauss_bez_kontroly_nulovych_prvku(A, b)
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
        Ab(j,:) = Ab(j,:) - Ab(i,:) * Ab(j,i)/Ab(i,i);
    end
end

% zpetna substituce
x = Ab(:,n+1);
for i = n:-1:1
    x(i) = (x(i) - Ab(i,(i+1):n) * x((i+1):n)) / Ab(i,i);
end
end