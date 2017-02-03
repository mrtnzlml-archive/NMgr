Ax = [1 2 3 4 5 6 7 8 9 10];
Ay = [6 9 8 4 1 2 5 6 3 5];

Bx = [91 92 93 94 95 96 97 98 99 100];
By = [65 69 68 61 63 65 66 67 62 60];

c = Correlation(false);
k = c.pearson(Ax, Ay)
l = c.pearson(Bx, By)

Cx = [1 2 3 4 5 6 7 8 9 10 91 92 93 94 95 96 97 98 99 100];
Cy = [6 9 8 4 1 2 5 6 3 5 65 69 68 61 63 65 66 67 62 60];
c.pearson(Cx, Cy)

g = GenerateDemoData;
[X, Y] = g.exponential();
[A, B] = g.quadratic();
c.pearson(X, Y);
c.pearson(A, B);
c.spearman(X, Y);
c.spearman(A, B);
%plot(X, Y, 'xr', A, B, 'xb')
