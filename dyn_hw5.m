%Robot Dynamics HW5, Q1

clc; clear all; close all;
syms q0 v0 alp0 qf vf alpf t0 tf;
%%
%Plot for time 0 to 3 second
q0 = 20; q1 = 70; q2 = 100; q3 = 120;
v0 = 0; v1 = 0; v2 = 0; v3 = 0; 
alp0 = 0; alp1 = 0; alp2 = 0; alp3 = 0;  
t0 = 0; t1 = 1; t2 = 2; t3 = 3;
M = [1 t0 t0^2 t0^3 t0^4 t0^5 t0^6 t0^7 t0^8 t0^9 t0^10 t0^11;...
    0 1 2*t0 3*t0^2 4*t0^3 5*t0^4 6*t0^5 7*t0^6 8*t0^7 9*t0^8 10*t0^9 11*t0^10;...
    0 0 2 6*t0 12*t0^2 20*t0^3 30*t0^4 42*t0^5 56*t0^6 72*t0^7 90*t0^8 11*t0^9;...
    1 t1 t1^2 t1^3 t1^4 t1^5 t1^6 t1^7 t1^8 t1^9 t1^10 t1^11;...
    0 1 2*t1 3*t1^2 4*t1^3 5*t1^4 6*t1^5 7*t1^6 8*t1^7 9*t1^8 10*t1^9 11*t1^10;...
    0 0 2 6*t1 12*t1^2 20*t1^3 30*t1^4 42*t1^5 56*t1^6 72*t1^7 90*t1^8 11*t1^9;...
    1 t2 t2^2 t2^3 t2^4 t2^5 t2^6 t2^7 t2^8 t2^9 t2^10 t2^11;...
    0 1 2*t2 3*t2^2 4*t2^3 5*t2^4 6*t2^5 7*t2^6 8*t2^7 9*t2^8 10*t2^9 11*t2^10;...
    0 0 2 6*t2 12*t2^2 20*t2^3 30*t2^4 42*t2^5 56*t2^6 72*t2^7 90*t2^8 11*t2^9;...
    1 t3 t3^2 t3^3 t3^4 t3^5 t3^6 t3^7 t3^8 t3^9 t3^10 t3^11;...
    0 1 2*t3 3*t3^2 4*t3^3 5*t3^4 6*t3^5 7*t3^6 8*t3^7 9*t3^8 10*t3^9 11*t3^10;...
    0 0 2 6*t3 12*t3^2 20*t3^3 30*t3^4 42*t3^5 56*t3^6 72*t3^7 90*t3^8 11*t3^9];
    
b = [q0; v0; alp0; q1; v1; alp1; q2; v2; alp2; q3; v3; alp3];
a = inv(M)*b;

t = linspace(t0,t3,100*(t3-t0));
c = ones(size(t));

qd = a(1).*c + a(2).*t + a(3).*t.^2 + a(4).*t.^3 + a(5).*t.^4 + a(6).*t.^5 +...
     a(7).*t.^6 + a(8).*t.^7 + a(9).*t.^8 + a(10).*t.^9 + a(11).*t.^10 + ...
     a(12).*t.^11;

vd = a(2).*c + 2*a(3).*t + 3*a(4).*t.^2 + 4*a(5).*t.^3 + 5*a(6).*t.^4 + ...
     6*a(7).*t.^5 + 7*a(8).*t.^6 + 8*a(9).*t.^7 + 9*a(10).*t.^8 + ...
     10*a(11).*t.^9 + 11*a(12).*t.^10;

ad = 2*a(3).*c + 6*a(4).*t + 12*a(5).*t.^2 + 20*a(6).*t.^3 + 30*a(7).*t.^4 + ...
     42*a(8).*t.^5 + 56*a(9).*t.^6 + 72*a(10).*t.^7 + 90*a(11).*t.^8 + ...
     110*a(12).*t.^9;
%%
%Time vs position graph

subplot(3, 1, 1);
plot(t, qd, 'k');
hold on
title('Time vs Position graph');
xlabel('Time(sec)'); ylabel('Angle(deg)');
hold off

%Time vs velocity graph
subplot(3, 1, 2);
plot(t, vd);
hold on
title('Time vs Velocity graph');
xlabel('Time(sec)'); ylabel('Velocity(deg/sec)');
hold off

%Time vs acceleration graph
subplot(3, 1, 3);
plot(t, ad, 'r');
hold on
title('Time vs Acceleration graph');
xlabel('Time(sec)'); ylabel('Acceleration(deg/sec^2)');
hold off




