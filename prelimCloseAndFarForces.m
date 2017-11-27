function [lateralForceClose, lateralForceFar] = prelimCloseAndFarForces(metalCond, mu, beamThick, v, totGap, closeGap, windings, current, crossSectArea)

%input variables, in order, are the conductivity of the i-beam, the
%relative permeability of the i-beam, thickness of the i-beam, 
%velocity of the pod, total gap between the magnets including
%i-beam, the distance of the close magnet to the i-beam
%the windings of the solenoid, the current supplied to the solenoid, and
%the cross sectional area of the solenoid

%Vacuum Permeability
mu0 = 4*pi*10^(-7);
%Relative permeability of soft iron core
%mu= mu0*200000; % this ratio needs to be checked, I haven't confirmed it yet

%Contributions to p from solenoid and the core
psolenoid = windings*current*crossSectArea;
pcore = windings*current*crossSectArea*(1-(mu0/mu));
p=psolenoid + pcore;

%mirror image velocity (w), material property
w = 2/(beamThick*mu*mu0*metalCond);

%relationship between close magnet and far magnet force

lateralForceClose= ( (3*mu0*p^2)./(32*pi*closeGap.^4) ).*(1- w/sqrt( v^2 + w^2) );

farGap = totGap - closeGap - beamThick;

lateralForceFar = ( (3*mu0*p^2)./(32*pi*farGap.^4) ).*(1- w/sqrt( v^2 + w^2) );

end