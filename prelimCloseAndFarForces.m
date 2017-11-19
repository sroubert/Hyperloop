syms u0 p z0 p w v F_l w_Ibeam windings current csectarea

%Vacuum Permeability
mu0 = 4*pi*10^(-7);
%Relative permeability of soft iron core
mu= mu0*200000 % this ratio needs to be checked, I haven't confirmed it yet

%Contributions to p from solenoid and the core
psolenoid = windings*current*csectarea;
pcore = windings*current*csectarea*(1-(mu0/mu));
p=psolenoid + pcore;

%relationship between close magnet and far magnet force

closeGap = z0;


F_l = (3*u0*p^2/32*pi*z0^2)*(1- w/sqrt( v^2 + w^2) );


