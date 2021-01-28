% Set up Script for the Lateral Control Tutorial example.
%
% This script initializes the Lateral Control Tutorial example model.
% It loads necessary control constants and sets up the buses required for 
% the model.
%
%   This is a helper script for example purposes and may be removed or
%   modified in the future.

%   Copyright 2018 The MathWorks, Inc.

%% Vehicle Parameters
wheelbase = 9.2;         % Wheelbase of the vehicle (m)

%% General Model Parameters
Ts = 0.05;               % Simulation sample time (s) 

%% Create scenario and road specifications
[scenario,roadCenters,laneSpecification,speed] = helperCreateDrivingScenario;

% You can use Driving Scenario Designer to explore the scenario
% drivingScenarioDesigner('LateralControl')

%% Generate data for Simulink simulation  
[refPoses,x0,y0,theta0,curvatures,cumLengths, simStopTime] = helperCreateReferencePath(scenario);

directions   = ones(size(refPoses, 1), 1);
speedProfile = ones(size(refPoses, 1), 1)*speed;

%% Bus Creation
% Create the bus of actors from the scenario reader
modelName = 'LateralControlTutorial';
wasModelLoaded = bdIsLoaded(modelName);
if ~wasModelLoaded
    load_system(modelName)
end

% Create buses for lane sensor and lane sensor boundaries
helperCreateLaneSensorBuses;



%scenario1 = drivingScenario('SampleTime',0.5);
%ego = actor(scenario,'Position',[0 0 0],'Yaw',0);


%plot(scenario,'Waypoints','on')
%title('Followed Path')
%while advance(scenario1)
 %   pause(0.1)
 %   xlim([150 300])
  %  ylim([0 150])
%end

function helperPlotRoadAndPath(scenario,refPoses)
%helperPlotRoadAndPath Plot the road and the reference path
h = figure('Color','white');
ax1 = axes(h, 'Box','on');
plot(scenario,'Parent',ax1)
hold on
plot(ax1,refPoses(:,1),refPoses(:,2),'b')
xlim([150, 300])
ylim([0 150])
ax1.Title = text(0.5,0.5,'Road and Reference Path');
end


