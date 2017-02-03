A = [1 2 3; 4 5 6; 7 8 9];
diag(A)

result = zeros(length(A), 1);
for index = 1:length(A)
    result(index) = A(index, index);
end
result

row = 1;
for index = length(A):-1:1
    result(row) = A(row, index);
    row = row + 1;
end
result
