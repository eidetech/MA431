clc; close all; clear all;

m = 80; % kg
b1 = 15; % Drag coefficient before parachute is deployed
b2 = 7*b1; % Drag coefficient after parachute is deployed
g = -9.81; % Gravity, m/s^2

simTime = 300; % s

dt = 10^-4; % Timestep
t = 0; % Start time
idx = 1; % Index for logging

% I.C
y = 4000; % y(0) = 4000 m
yDot = 0; % y'(0) = 0 m/s

% Calculation
while t < simTime

    % Set the drag coefficient based on if the parachute has been deployed
    if t <= 50
        b = b1;
    else
        b = b2;
    end

    % Calculate forces
    F_g = m*g; % Force caused by gravity = mass * gravity (acceleration)
    F_c = yDot*b; % Force caused by drag/wind resistance = velocity * drag coefficient

    % Newton's second law: F = ma
    %                      a = F/m
    yDotDot = (F_g-F_c)/m;

    % Save results for plotting
    timePlot(idx) = t;
    yPlot(idx) = y;
    yDotPlot(idx) = yDot;
    yDotDotPlot(idx) = yDotDot;

    % Time integrate y, yDot and update time, index variables
    y = y+yDot*dt;          % Position
    yDot = yDot+yDotDot*dt; % Velocity
    t = t+dt;               % Current time
    idx = idx+1;            % Index for logging
end

% Plotting
subplot(3,1,1)
plot(timePlot(yPlot >= 0), yPlot(yPlot >= 0), 'LineWidth',2)
grid
subplot(3,1,2)
plot(timePlot(yPlot >= 0), yDotPlot(yPlot >= 0), 'LineWidth',2)
grid
subplot(3,1,3)
plot(timePlot(yPlot >= 0), yDotDotPlot(yPlot >= 0), 'LineWidth',2)
grid

x = timePlot(yPlot>=0);
endTime = x(end)