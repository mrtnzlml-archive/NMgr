function [] = druzice()
clear
clc

k = 6.672e-11; % gravitacni konstanta
r_z = 6378e3; % polomer zeme
m_z = 5.9736e24; % hmotnost zeme
m_d = 5e3; % hmotnost druzice

function [dsvdt] = rce(t, sv)
    % resena soustava rovnic (dsvdt = [dsx/dt, dsy/dt, dvx/dt, dvy/dt])

    r = sqrt(sv(1)^2+sv(2)^2);
    Fg = -k*m_z*m_d/(r^2);
    dsvdt = [sv(3); sv(4); Fg/m_d * sv(1)/r; Fg/m_d * sv(2)/r];
end

% pocatecni podminky reseni
sx0 = r_z + 847e3;
sy0 = 0;
vx0 = 0;
vy0 = 8.5e3;

% reseni soustavy
[t, sv] = runge_kutta(@rce, [0, 15e3], [sx0, sy0, vx0, vy0], 15e3);

% vykresleni drahy
subplot(2,1,1)
sx = sv(:,1); sy = sv(:,2);
plot(r_z*cos(linspace(0, 2*pi, 100)), r_z*sin(linspace(0, 2*pi, 100)), 'k', sx, sy, 'r')
xlabel('x (m)')
ylabel('y (m)')

% vykresleni rychlosti
subplot(2,1,2)
vx = sv(:,3); vy = sv(:,4);
v = sqrt(vx.^2 + vy.^2);
plot(t, v)
xlabel('t (s)')
ylabel('v (m/s)')
end