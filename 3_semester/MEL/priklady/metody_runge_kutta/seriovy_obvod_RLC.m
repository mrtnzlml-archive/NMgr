function [] = seriovy_obvod_RLC()
clear
clc

% parametery obvodu
U0 = 10;
R = 2;
L = 3e-3;
C = 1e-5;

function duidt = rce(t, ui)
    %resena soustava rovnic (duidt = [duc/dt, di/dt])
    duidt = [ui(2) / C; (U0 - ui(1) - R*ui(2)) / L];
end

% pocatecni podminky reseni
UC0 = 0;
I0 = 0;

% reseni soustavy
%[t, ui] = euler(@rce, [0, 0.02], [UC0, I0], 1e4);
[t, ui] = runge_kutta(@rce, [0, 0.02], [UC0, I0], 1e3);
UC = ui(:, 1); I = ui(:, 2);

% vypocet napeti na rezistoru a civce
UR = R*I;
UL = U0 - UC - UR;

% vykresleni vysledku reseni
subplot(1, 2, 1);
plot(t, UC, 'r', t, UR, 'b', t, UL, 'g');
grid on;
xlabel('t (s)');
ylabel('u (V)');
xlim([0, 0.02]);
legend('kondenzator', 'rezistor', 'civka');

subplot(1, 2, 2);
plot(t, I, 'k');
grid on;
xlabel('t (s)');
ylabel('i (A)');
xlim([0, 0.02]);
end