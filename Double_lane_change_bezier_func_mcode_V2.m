%Path following

%Initialize the variables
Xp = [];
Yp = [];

load center_points_main.mat


x=center_points(:,1);
y=center_points(:,2);


%DOUBLE LANE CHANGE MANOEUVER 

Veh_width = 1.57; 
L1 = Veh_width*1.1+0.15;
L2 = Veh_width*1.2+0.15;
L3 = Veh_width*1.3+0.15;
L4 = Veh_width*1.4+0.15;
L5 = Veh_width*1.5+0.15;
L6 = Veh_width*1.6+0.15;
L7 = Veh_width*1.7+0.15;
L8 = Veh_width*1.8+0.15;
L9 = Veh_width*1.9+0.15;
L10 = Veh_width*2.0+0.15;
L11 = Veh_width*2.1+0.15;

p = [x,y]; 

%Change the points here to modify the shape of the curve.
%If you are adding new points, make sure you modify the p & p_ub_pts array
%points accordingly
p_lb_pts = [x,y]; %Points on the curve considering 0,0 starting point and no offset L1,L2,L3
p_ub_pts = p_lb_pts;
p = p_lb_pts;

%Beizer Curves passes through first and last points and approximates
%through the middle points. This is the characteristic of the Beizer curve
%splitting in 10
p1 = p(1:38,:); 
p2 = p(39:93,:); 
p3 = p(94:143,:);
p4= p(144:183,:);
p5=p(184:204,:);
p6=p(205:273,:);
p7=p(274:296,:);
p8=p(297:323,:);
p9=p(324:349,:);
p10=p(350:386,:);


[Xp_1,Yp_1] = bezier_curve(p1); %For first curve
[Xp_2,Yp_2] = bezier_curve(p2); %For second curve
[Xp_3,Yp_3] = bezier_curve(p3); %For third curve
[Xp_4,Yp_4] = bezier_curve(p4); %For third curve
[Xp_5,Yp_5] = bezier_curve(p5); %For third curve
[Xp_6,Yp_6] = bezier_curve(p6); %For third curve
[Xp_7,Yp_7] = bezier_curve(p7); %For third curve
[Xp_8,Yp_8] = bezier_curve(p8); %For third curve
[Xp_9,Yp_9] = bezier_curve(p9); %For third curve
[Xp_10,Yp_10] = bezier_curve(p10); %For third curve




Xp = [Xp_1(1:end-1); Xp_2(1:end-1);Xp_3(1:end-1);Xp_4(1:end-1);Xp_5(1:end-1);Xp_6(1:end-1);Xp_7(1:end-1);Xp_8(1:end-1);Xp_9(1:end-1);Xp_10(1:end-1);];
Yp = [Yp_1(1:end-1);Yp_2(1:end-1);Yp_3(1:end-1);Yp_4(1:end-1);Yp_5(1:end-1);Yp_6(1:end-1);Yp_7(1:end-1);Yp_8(1:end-1);Yp_9(1:end-1);Yp_10(1:end-1);];

figure(1)
plot(Xp_1(1:end-1),Yp_1(1:end-1),'Linewidth',2); hold on;
plot(Xp_2(1:end-1),Yp_2(1:end-1),'Linewidth',2); hold on;
plot(Xp_3(1:end-1),Yp_3(1:end-1),'Linewidth',2); hold on;
plot(Xp_4(1:end-1),Yp_4(1:end-1),'Linewidth',2); hold on;
plot(Xp_5(1:end-1),Yp_5(1:end-1),'Linewidth',2); hold on;
plot(Xp_6(1:end-1),Yp_6(1:end-1),'Linewidth',2); hold on;
plot(Xp_7(1:end-1),Yp_7(1:end-1),'Linewidth',2); hold on;
plot(Xp_8(1:end-1),Yp_8(1:end-1),'Linewidth',2); hold on;
plot(Xp_9(1:end-1),Yp_9(1:end-1),'Linewidth',2); hold on;
plot(Xp_10(1:end-1),Yp_10(1:end-1),'Linewidth',2); hold on;

% 
% plot(p(:,1),p(:,2),'k--','Linewidth',2); hold on;  %Middle path
% plot(p_ub_pts(:,1),p_ub_pts(:,2),'x'); hold on;  %Upper points
% plot(p_lb_pts(:,1),p_lb_pts(:,2),'o'); hold on; %Lower points

xlabel('X Position [m]')
ylabel('Y Position [m]')
axis([-200 600 -500 500])
title('Double Lane Change Path')

%Road Curvature Calculations

no_of_pts = length(Xp);
rho_ref = zeros(length(Xp)-1,1); %Create a Zero Vector for initialization

%Compute the Differentiation terms
del_1_Xp = diff(Xp);
del_1_Yp = diff(Yp);
del_2_Xp = diff(Xp,2); %Second order difference
del_2_Yp = diff(Yp,2); %Second order difference
del_pts = 1; %Difference in the index;

%Curvature Formula given in Lecture 21, Slide 27
rho_new = (((del_1_Xp(2:end)/del_pts).*(del_2_Yp/del_pts.^2))-((del_1_Yp(2:end)/del_pts).*((del_2_Xp/del_pts.^2))))./((del_1_Xp(2:end)./del_pts).^2+((del_1_Yp(2:end)./del_pts).^2)).^1.5;

%Calculation of total distance travelled for the lookuo table - xaxis input
Tot_d = 0;
for j = 1:no_of_pts-1
    d(j) = sqrt((Xp(j+1)-Xp(j))^2+(Yp(j+1)-Yp(j))^2);
    Tot_d = Tot_d+d(j);
    Cum_dis(j) = Tot_d; %Cumulative distance
end

dis_vec = Cum_dis(1:end-1); %Distance vector for the lookup table in the model
t_end = Tot_d/V; %for simulation time
