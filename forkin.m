function [position_6,attitude_6,pos_cam1,pos_cam2,attitude_cam] = forkin(found_xyz,Q,theta1,theta2,theta3,theta4,theta5,theta6)
a1=35+3;a2=35+3;a3=35+3;a4=15+3;found_l=40;
%≈∑¿≠Ω«
aa = acos(Q(1))*2;    %÷·Ω«œ¬–˝◊™Ω«∂»
a = aa*Q(2)/sin(aa(1)/2);%÷·Ω«x÷·
b = aa*Q(3)/sin(aa(1)/2);%÷·Ω«y÷·
c = aa*Q(4)/sin(aa(1)/2);%÷·Ω«z÷·
x = found_xyz(1);
y = found_xyz(2);
z = found_xyz(3);
t = [theta1,theta2,theta3,theta4,theta5,theta6];

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
T1 = [cos(t(1)),-sin(t(1)),0,found_l/2;
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
point = [0;0;0;1];
atti = [1;0;0;1];
camera_1 = [20;0;0;1];
camera_2 = [-20;0;0;1];
world_position = T0*T1*T2*T3*T4*T5*T6*P4;
world_point = T0*T1*T2*T3*T4*T5*T6*point;
world_atti = T0*T1*T2*T3*T4*T5*T6*atti;
world_cam1 = T0*camera_1;
world_cam2 = T0*camera_2;
world_point_cam = T0*point;
world_atti_cam = T0*atti;

position_6 = world_position(1:3,1);
attitude_od = world_atti-world_point;
attitude_6 = attitude_od(1:3,1);
pos_cam1 = world_cam1(1:3,1);
pos_cam2 = world_cam2(1:3,1);
attitude_ca = world_atti_cam-world_point_cam;
attitude_cam = attitude_ca(1:3,1);
% x = positionofend(1);
% y = positionofend(2);
% z = positionofend(3);
end

function rwave=wave(r)
rwave=[   0,  -r(3),   r(2);
       r(3),      0,  -r(1);
      -r(2),   r(1),     0];
end