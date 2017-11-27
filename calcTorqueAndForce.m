function [force, torque,maxAngles] = calcTorqueAndForce(angle,timeResponse)
%this function calculates the forces and torques necessary to bring the pod
%back to zero deviance from variable angle in any time response

%inputs are the angle in degrees and the time response in seconds which you would like to
%respond

%outputs are force and torque vectors. The max force and torque are the
%last entries in the vectors, i.e. force(end) and torque(end)


maxAngles = linspace(0.01,angle)*(pi/180); %rad

%geometry
w = 24*(0.0254);  %inches to meters
l = 86.5*(0.0254);
%mass properties
mass = 323*(0.453592);  %lbs to kg

I = (1/12)*mass*(w^2 + l^2);

alpha = 2*maxAngles./timeResponse^2;

torque = I*alpha;

%assuming equal distance from COM

distFromCOM = 0.60325; %meters

force = torque./distFromCOM;

end