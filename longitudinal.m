clear all
clc
close all

%% Parameters 
M=2130; % Mass of the vehicle[Kg]
eta_t=0.9; % Transmission Efficiency	
lambda_t=1.0; % Gear Ratio	
lambda_f=4.1; % Final Drive Ratio	
I_w=1; % Inertia of the Wheel[kgm2]
R_w=0.3; % Wheel Radius[m]
Meq=0.1*M; % Equivalent Mass Factor	
C_d=0.29; % Drag coefficient 	
rho=1.225; % Air density[kg/m3]
A_f=2.8;% Frontal area	[m2]
g=9.81;% [N/m2]
C_rr=0.015;%Rolling resistance coefficient	
C_x=3e5; %Longitudinal Stiffness[N]
C_alpha = 1.5e5; % Cornering Stiffness for 1 tire [N/rad]
L=9.2;% Wheelbase[m]
l_f=1.3;% Distance from the center of gravity of the vehicle (CG) to the front axle [m]
l_r=1.55;% Distance from the center of gravity of the vehicle (CG) to the rear axle [m]
C_s=1.5e5;% Cornering Stiffness of Front and Rear Tires [N/rad]
I_z=3700;% Inertia moment around z axis J or Iz [kg/m2]
mu=0.7; % Road friction coefficient
%%
