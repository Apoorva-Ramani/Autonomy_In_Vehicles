%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ECE 5553 - Autonomy in Vehicles
%%HW 4 - Path Following Linear Model
%%Spring 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Xp,Yp] = bezier_curve(p1)
%%Bezier curve for higher order polynomials%
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-837-computer-graphics-fall-2012/lecture-notes/MIT6_837F12_Lec01.pdf
% Refer to Slide 62

%   Detailed explanation goes here
p = p1;

n = length(p); %number of points
n1=n-1;

for i=0:1:n1
sigma(i+1)=factorial(n1)/(factorial(i)*factorial(n1-i));  % for calculating (x!/(y!(x-y)!)) values 
end
l=[];
UB=[];
for u=0:0.002:1
    for d=1:n
    UB(d)=sigma(d)*((1-u)^(n-d))*(u^(d-1));
    end
l=cat(1,l,UB);                                       
end
P=l*p;

Xp = [P(:,1)]; %X_reference Points
Yp = [P(:,2)]; %Y_reference Points
end

