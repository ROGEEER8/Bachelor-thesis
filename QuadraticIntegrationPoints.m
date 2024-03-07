clear all; close all; clc

a = sqrt(0.6);

% y = [-a -a; 0 -a; a -a; -a 0; 0 0; a 0; -a a; 0 a; a a];
x = [-a 0 a -a 0 a -a 0 a];
y = [-a -a -a 0 0 0 a a a];
xy = [x; y]';

plot(x,y,'b*')
axis([-1 1 -1 1])
