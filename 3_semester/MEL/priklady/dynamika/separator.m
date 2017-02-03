function [] = separator()
clear
clc

Q = 1e-9; % naboj castice
m = 1e-3; % hmotnost castice

U = 90e3; % napeti elektrod
d = 0.1; % vzdalenost elektrod

g = 9.72; % gravitacni zrychleni

function [dsvdt] = rce(t, sv)
    % resena soustava rovnic (dsvdt = [ds/dt, dv/dt])

    F = Q*U/d;
    ax = F/m;
    if (sv(2) < -0.6)
        ax = 0;
    end

    dsvdt = [sv(3); sv(4); ax; -g];
end

% pocatecni podminky reseni
sx0 = 0; sy0 = 0;
vx0 = 0; vy0 = 0;

% reseni soustavy
[t, sv] = runge_kutta(@rce, [0, 1], [sx0, sy0, vx0, vy0], 1e3);

% vykresleni vysledku reseni
subplot(2,1,1)
sx = sv(:,1); sy = sv(:,2);
plot(sx, sy)
xlabel('x (m)')
ylabel('y (m)')
xlim([-1, 1])

subplot(2,1,2)
vx = sv(:,3); vy = sv(:,4);
v = sqrt(vx.^2 + vy.^2);
plot(t, v)
xlabel('t (s)')
ylabel('v (m/s)')
end