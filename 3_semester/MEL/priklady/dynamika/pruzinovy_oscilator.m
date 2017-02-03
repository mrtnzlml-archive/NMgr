function [] = pruzinovy_oscilator()
clear
clc

m = 1; % hmotnost zavazi
alpha = 0.2; % koeficient treni
k = 0.5; % tuhost pruziny

function dsvdt = rce(t, sv)
    % resena soustava rovnic (dsvdt = [ds/dt, dv/dt])
    dsvdt = [sv(2); -alpha/m*sv(2) - k/m*sv(1)];
end

% pocatecni podminky reseni
s0 = 0;
v0 = 1;

% reseni soustavy
%[t, sv] = euler(@rce, [0, 60], [s0, v0], 1e4);
[t, sv] = runge_kutta(@rce, [0, 60], [s0, v0], 1e3);
%[t, sv] = ode45(@rce, [0, 60], [s0, v0]);

% vykresleni vysledku reseni
subplot(1, 2, 1);
s = sv(:,1);
plot(t, s);
xlabel('t (s)');
ylabel('s (m)');

subplot(1, 2, 2);
v = sv(:,2);
plot(t, v);
xlabel('t (s)');
ylabel('v (m/s)');
end