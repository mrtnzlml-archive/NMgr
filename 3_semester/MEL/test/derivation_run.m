x = 0:0.1:20;
y = zeros(1, length(x));
for i = 1:length(x)
    y(i) = 1 + sin(x(i));
end

[dx, dy] = derivation(x, y);
diff(y); % === dy

shortX = x;
shortX(1) = [];
plot(x, y, 'r', shortX, dy, 'b');
legend('x:y', 'derivation');
