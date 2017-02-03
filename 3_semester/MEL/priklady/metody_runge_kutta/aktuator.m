function [] = aktuator()
clear
clc

% parametery modelu
U0 = 95;
R = 23;
tau = 60e-3;
L = tau*R;

dF = 500/(U0/R);

S = pi*0.02^2;
P = 1e5;

rho = 8000;
V = pi*(0.02^2 - 0.01^2)*0.04;
m = rho*V;

function disvdt = rce(t, isv)
    %resena soustava rovnic (disvdt = [di/dt, ds/dt, dv/dt])

    i = isv(1);
    s = isv(2);
    v = isv(3);
    
    di = (U0 - R*i) / L;
    ds = v;

    Fm = dF*i;
    if s <= 2.5e-3
        FPM = -100;
    else
        FPM = 20;
    end
    
    F = Fm + FPM - P*S;

    dv = F/m;

    if s >= 5e-3
        ds = 0;
        dv = 0;
    end

    if F < 0.0
        ds = 0;
        dv = 0;
    end
    
    disvdt = [di; ds; dv];
end

[t, isv] = runge_kutta(@rce, [0, 5*tau], [0, 0, 0], 1e3);

i = isv(:, 1);
s = isv(:, 2);
v = isv(:, 3);

UR = R*i;
UL = U0 - UR;

% vykresleni vysledku reseni
subplot(1, 4, 1);
plot(t, UR, 'b', t, UL, 'g');
grid on;
xlabel('t (s)');
ylabel('U (V)');
legend('rezistor', 'civka');
xlim([0, 5*tau]);

subplot(1, 4, 2);
plot(t, i, 'k');
grid on;
xlabel('t (s)');
ylabel('I (A)');
xlim([0, 5*tau]);

subplot(1, 4, 3);
plot(t, s, 'r');
grid on;
xlabel('t (s)');
ylabel('s (m)');
xlim([0, tau]);

subplot(1, 4, 4);
plot(t, v, 'k');
grid on;
xlabel('t (s)');
ylabel('v (m/s)');
xlim([0, tau]);
end