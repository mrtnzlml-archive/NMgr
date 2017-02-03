function x = gauss_bez_pivotace(A, b)
% rozsireni matice soustavy
Ab = [A,b];

% dopredna redukce
n = length(b);
for i = 1:n
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