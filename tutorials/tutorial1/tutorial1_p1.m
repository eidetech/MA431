clc; clear all; close all;

% a)
[x,y] = meshgrid(0:0.2:3,-1:0.2:3);
d = 3-2*y;
L = sqrt(1+d.^2);
subplot(2,2,1)
quiver(x,y,1./L,d./L)
axis tight

clear all;
[x,y] = meshgrid(0:0.2:3,-1:0.2:3);
d = 3+2*y;
L = sqrt(1+d.^2);
subplot(2,2,2)
quiver(x,y,1./L,d./L)
axis tight