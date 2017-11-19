syms u0 p z0 p w v F_l w_Ibeam

%relationship between close magnet and far magnet force

closeGap = z0;


F_l = (3*u0*p^2/32*pi*z0^2)*(1- w/sqrt( v^2 + w^2) );


