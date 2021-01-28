%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ECE 5553 - Autonomy in Vehicles
%%HW 4 - Path Following Linear Model
%%Spring 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Simulation file
clear all
close all

%Run the State space model m file
Path_following_SS;

%Run the Double lane change manoeuver
Double_lane_change_bezier_func_mcode_V2

sim('Path_following_Model_w_dbl_lane_change');

figure(1);
plot(X_ref,Y_ref,'r--','Linewidth',2); hold on;grid on;
plot(X_actual,Y_actual,'b','Linewidth',2); hold on;grid on;

legend('Reference','Actual')
xlabel('X Position [m]')
ylabel('Y Position [m]')
title('X-Y path')
