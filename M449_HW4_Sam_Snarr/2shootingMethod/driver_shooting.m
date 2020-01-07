
clear all; clc; close all;

a=0; alpha=0; beta=0;
xp = linspace(0,pi/2+0.1, 100);

figure
hold on

for i=1:length(xp)
    b = xp(i);
    shooting
end

