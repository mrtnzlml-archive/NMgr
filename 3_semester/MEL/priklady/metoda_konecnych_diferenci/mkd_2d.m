function [U] = mkd_2d(x, y, OP, potencial)

% slovnik diferencni aproximace
% 1 .. obecna  
% 2 .. dirichlet
% 3 .. -dU/dx = 0
% 4 .. +dU/dx = 0
% 5 .. -dU/dy = 0
% 6 .. +dU/dy = 0

M = length(x);
N = length(y);

A = sparse(M*N,M*N);
b = zeros(M*N,1);

% naplneni matice a vektoru pravych stran
for i = 1:M
  for j = 1:N
    switch OP(i, j)
      case 1 % obecna diferencni aproximace
        A((i-1)*N+j, (i-1)*N+j)   = (-1/(x(i+1) - x(i)) - 1/(x(i) - x(i-1))) * 2 / (x(i+1) - x(i-1)) + (-1/(y(j+1) - y(j)) - 1/(y(j) - y(j-1))) * 2 / (y(j+1) - y(j-1));
        A((i-1)*N+j, (i-1)*N+j+N) = 1/(x(i+1) - x(i)) * 2 / (x(i+1) - x(i-1)); 
        A((i-1)*N+j, (i-1)*N+j-N) = 1/(x(i) - x(i-1)) * 2 / (x(i+1) - x(i-1));
        A((i-1)*N+j, (i-1)*N+j+1) = 1/(y(j+1) - y(j)) * 2 / (y(j+1) - y(j-1));
        A((i-1)*N+j, (i-1)*N+j-1) = 1/(y(j) - y(j-1)) * 2 / (y(j+1) - y(j-1));
        b((i-1)*N+j) = 0;
      case 2 % Dirichletova okrajova podminka
        A((i-1)*N+j, (i-1)*N+j) = 1;
        b((i-1)*N+j) = potencial(i, j);
      case 3 % Neumannova okrajova podminka (-dU/dx = 0)
        A((i-1)*N+j, (i-1)*N+j)   =  1/(x(i+1) - x(i));
        A((i-1)*N+j, (i-1)*N+j+N) = -1/(x(i+1) - x(i));
        b((i-1)*N+j) = 0;
      case 4 % Neumannova okrajova podminka (+dU/dx = 0)
        A((i-1)*N+j, (i-1)*N+j)   =  1/(x(i) - x(i-1));
        A((i-1)*N+j, (i-1)*N+j-N) = -1/(x(i) - x(i-1));
        b((i-1)*N+j) = 0;
      case 5 % Neumannova okrajova podminka (-dU/dy = 0)
        A((i-1)*N+j, (i-1)*N+j)   =  1/(y(j+1) - y(j));
        A((i-1)*N+j, (i-1)*N+j+1) = -1/(y(j+1) - y(j));
        b((i-1)*N+j) = 0;
      case 6 % Neumannova okrajova podminka (+dU/dy = 0)
        A((i-1)*N+j, (i-1)*N+j)   =  1/(y(j) - y(j-1));
        A((i-1)*N+j, (i-1)*N+j-1) = -1/(y(j) - y(j-1));
        b((i-1)*N+j) = 0;
    end
  end
end

% reseni soustavy
V = A\b;

% pomocne vektory
for i = 1:M
  for j = 1:N
    U(j, i) = V((i-1)*N+j);
  end;
end;

spy(A);