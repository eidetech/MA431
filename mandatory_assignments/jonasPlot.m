close all ; clc ; clear ;
EndTime = 60; %s
StepTime = 0.01; %h
y = 0; % initial fall distance sit .1
y2 = 0; % initial fall distance sit .2
% initialize time :
time = 0; %s sit .1
time2 = 0; %s sit .2
counter = 1;
counter2 = 1;
g = -9.81;
m = 80;
b1 = 15;
b2 = 7*b1;

while time <=50
y = g * m^2/b1^2 * exp(-(b1/m)*time) + g * (m/b1)*time - g * (m^2/b1^2) + 4000;
TimePlot ( counter ) = time ;
yPlot ( counter ) = y;
time = time + StepTime ;
counter = counter + 1;
end
y_60 = 4000 - max(yPlot);

while y2 >= -y
% y2 = -7.47*time2+33.924*exp(-1.3*time2)-33.924;
y2 = 33.93*exp(-1.3*time2)-7.474*time2-33.93
Time2Plot(counter2) = time2 ;
y2Plot(counter2) = y2;

time2 = time2 + StepTime ;
counter2 = counter2 + 1;
end
figure
plot ( TimePlot ,yPlot , 'LineWidth' ,2)
hold on
plot (Time2Plot+50 ,1664+y2Plot , 'LineWidth' ,2)
grid on
T1 = max ( TimePlot ); % time spent in situation 1
T2 = max ( Time2Plot ); % time spent in situation 2
T_fall = T1 + T2 % air time