function [] = newtonova_metoda()
clear
clc

% kvadraticka rovnice
x = newton(@kvadraticka_rce, [0, 10], 9, 1e-3)
kvadraticka_rce(x)

% kubicka rovnice
x = newton(@kubicka_rce, [-3, 8], 4, 1e-3)
kubicka_rce(x)

% linearni rovnice
x = newton(@linearni_rce, [-5, 5], -3, 1e-3)
linearni_rce(x)
end

function [y] = kvadraticka_rce(x)
    y = 5*x^2 - 2*x - 9;
end

function [y] = kubicka_rce(x)
    y = x^3 - x^2;
end

function [y] = linearni_rce(x)
    y = 2*x + 10;
end