maxAngle = linspace(0.01,0.2)*(pi/180); %rad
timeResponse =0.1 ; %s

%geometry
w = 24*(0.0254);  %inches to meters
l = 86.5*(0.0254);
%mass properties
mass = 323*(0.453592);  %lbs to kg

I = (1/12)*mass*(w^2 + l^2);

alpha = 2*maxAngle./timeResponse^2;

torqueOutput = I*alpha

%assuming equal distance from COM

distFromCOM = 0.60325; %meters

F = torqueOutput./distFromCOM