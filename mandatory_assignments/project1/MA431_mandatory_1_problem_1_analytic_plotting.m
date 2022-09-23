clc; clear all; close all;

m = 80; % kg
b1 = 15; % Drag coefficient before parachute is deployed
b2 = 7*b1; % Drag coefficient after parachute is deployed
g = -9.81; % Gravity, m/s^2

t = 0;
dt = 10^-4;
idx = 1;
simTime = 350;

while t < simTime

    if t <= 50
        v = -g * m/b1 * exp(-(b1/m)*t) + g * m / b1;
        y = g * m^2/b1^2 * exp(-(b1/m)*t) + g * (m/b1)*t - g * (m^2/b1^2) + 4000;
    else
        v = -44.84 * exp(-(b2/m)*t) + g * (m / b2);
        C_4 = 1663 - (m*(1121*exp(-(b2*0)/m) + 25*g*0))/(25*b2);
y = g * (m^2/b2^2) * exp(-(b2/m)*t) + g * (m/b2)*t + C_4;
    end

    timePlot(idx) = t;
    vPlot(idx) = v;
    yPlot(idx) = y;

    idx = idx+1;
    t = t+dt;
end

yDiff = diff(yPlot)/dt;


subplot(2,1,1)
plot(timePlot(yPlot>=0), yPlot(yPlot>=0), 'LineWidth',2)

subplot(2,1,2)
plot(timePlot, vPlot, 'LineWidth',2)
figure
 plot(timePlot(yDiff>=-100), yDiff(yDiff>=-100), 'o', 'LineWidth',2, 'MarkerIndices', 1:40000:length(yDiff))

x = timePlot(yPlot>=0);
x(end)