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

