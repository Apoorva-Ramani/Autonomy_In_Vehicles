%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ECE 5553 - Autonomy in Vehicles
%%HW 4 - Path Following Linear Model
%%Spring 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Vehicle Parameters
L=2.85; % Distance between the axles [m]
g=9.81; % 
Lr = 1.513;% Distance from the center of gravity of the vehicle (CG) to the rear axle
Lf = 1.195; % Distance from the center of gravity of the vehicle (CG) to the front axle
Cf = 85275; % Cornering Stiffness of Front Tires
Cr = 68922; % Cornering Stiffness of Rear Tires
m = 1719; %Mass of the vehicle [kg]
J = 3700; %Yaw moment of Inertia
mu = 0.7; %Dry coefficient of Friction
R = 0.3;
Cs=77098;

%%Operating condition
V = 5; %Longitudinal Velocity [m/s]
ls = 2; %Preview Distance [m]

%Linear Parameters Calculation
a11 = -(Cr+Cf)/(m*V);
a12 = -1-((Cf*Lf-Cr*Lr)/(m*V^2));
a21 = (Lr*Cr-Lf*Cf)/J;
a22 = -((Cf*Lf^2)+(Cr*Lr^2))/(V*J);
b11 = Cf/(m*V); %Only Front wheel steering
b12 = 0; %delta_r parameter
b21 = Cf*Lf/J; %Only Front wheel steering
b22 = 0; %delta_r parameter
e2 = 1/J; % For yaw moment term - Not used in Path following model currently

%%%%State Space Representation
A_matrix = [a11 a12 0 0; a21 a22 0 0; 0 1 0 0; V ls V 0];
B_matrix = [b11 0; b21 0; 0 -V; 0 -ls*V];
C_matrix = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %Output is beta, r and ey
D_matrix = [0 0; 0 0; 0 0; 0 0];

