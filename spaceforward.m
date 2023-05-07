function [positionofend,T0,T1,T2,T3,T4,T5,T6] = spaceforward(x,y,z,a,b,c,t)
a1=35+3;a2=35+3;a3=35+3;a4=15+3;
k = [a;b;c];
phi = norm(k);
if phi==0
    k = [0;0;0];
else
    k = k/norm(k);
end
R0 = cos(phi)*eye(3)+(1-cos(phi))*(k*k.')+sin(phi)*wave(k);
T0 = [R0(1,1),R0(1,2),R0(1,3),x;
    R0(2,1),R0(2,2),R0(2,3),y;
    R0(3,1),R0(3,2),R0(3,3),z;
    0,0,0,1];
T1 = [cos(t(1)),-sin(t(1)),0,20;
    sin(t(1)),cos(t(1)),0,0;
    0,0,1,0;
    0,0,0,1];
T2 = [cos(t(2)),-sin(t(2)),0,a1;
    0,0,1,0;
    -sin(t(2)),-cos(t(2)),0,0;
    0,0,0,1];
T3 = [cos(t(3)),-sin(t(3)),0,a2;
    sin(t(3)),cos(t(3)),0,0;
    0,0,1,0;
    0,0,0,1];
T4 = [cos(t(4)),-sin(t(4)),0,a3;
    0,0,1,0;
    -sin(t(4)),-cos(t(4)),0,0;
    0,0,0,1];
T5 = [cos(t(5)),-sin(t(5)),0,0;
    0,0,-1,0;
    sin(t(5)),cos(t(5)),0,0;
    0,0,0,1];
T6 = [cos(t(6)),-sin(t(6)),0,0;
    0,0,1,0;
    -sin(t(6)),-cos(t(6)),0,0;
    0,0,0,1];
P4 = [a4;0;0;1];
positionofend = T0*T1*T2*T3*T4*T5*T6*P4;
end