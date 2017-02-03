function [] = aktuator()
clear
clc

% parametery obvodu
U0 = 95;
R = 23;
tau = 60e-3;
L = tau*R;

function didt = rce(t, i)
    %resena rovnice (didt = [di/dt])
    didt = [(U0 - R*i(1)) / L];
end

% [t, i] = euler(@rce, [0, 0.1], [0], 1e3);
[t, i, tau] = aeuler(@rce, [0, 0.1], [0], 1e-1, 1e-3);

UR = R*i;
UL = U0 - UR;

% vykresleni vysledku reseni
subplot(1, 3, 1);
plot(t, UR, '.-b', t, UL, '.-g');
grid on;
xlabel('t (s)');
ylabel('U (V)');
legend('rezistor', 'civka');
xlim([0, 0.1]);

subplot(1, 3, 2);
plot(t, i, '.-k');
grid on;
xlabel('t (s)');
ylabel('I (A)');
xlim([0, 0.1]);

subplot(1, 3, 3);
plot(tau, '.-k');
grid on;
xlabel('n (-)');
ylabel('tau (-)');
end