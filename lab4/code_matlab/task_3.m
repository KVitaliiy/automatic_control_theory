%given data
A = [-6, -25, -35, -10; 0, -9, -15, 0; 0, 6, 9, 0; 4, 17, 26, 6];
B = [0; 0; 0; 0];
x0 = [10; -10; 5; -5];
x_0 = [5; 10; -5; 10];
C = [2, 2, 0, 4; 0, 3, 6, 0];
D = zeros(2, 1);
sys = ss(A,B,C,D);

%variable matrix
Q = inv(0.1*eye(4));
R = inv(0.04*eye(2));

Q_1 = inv(eye(4));
R_1 = inv(10*eye(2));

Q_2 = inv(0.5*eye(4));
R_2 = inv(0.5*eye(2));

Q_3 = inv(10*eye(4));
R_3 = inv(0.1*eye(2));

%checking of a sufficient condition for the uniqueness of the solution 
% of the Riccati equation
sys_1 = ss(A, Q_1, C, zeros(2, 4));
sys_2 = ss(A, Q_2, C, zeros(2, 4));
sys_3 = ss(A, Q_3, C, zeros(2, 4));
rank(ctrb(sys_1));
rank(obsv(sys_1));
rank(ctrb(sys_2));
rank(obsv(sys_2));
rank(ctrb(sys_3));
rank(obsv(sys_3));

%solution of the Riccati equation
P = icare(A',C',Q,R,0,eye(4),0);
L = -P*C'*inv(R);

[P_1] = icare(A',C',Q_1,R_1,0,eye(4),0);
L_1 = -P_1*C'*inv(R_1);

[P_2] = icare(A',C',Q_2,R_2,0,eye(4),0);
L_2 = -P_2*C'*inv(R_2);

[P_3] = icare(A',C',Q_3,R_3,0,eye(4),0);
L_3 = -P_3*C'*inv(R_3);
