% U0 = R * i(t) + L * di(t)/dt

tau = 10e-3;
[x, y] = euler(@rl, [0, 5*tau], [0], 10e3);
plot(x, y);

function didt = rl(t, i)
    U = 60;
    R = 23;
    L = 60e-3;
    didt = [U/L - (R/L)*i];
end
