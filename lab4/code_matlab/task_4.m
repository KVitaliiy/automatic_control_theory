%given data
A = [-6, -25, -35, -10; 0, -9, -15, 0; 0, 6, 9, 0; 4, 17, 26, 6];
B = [16, 0; 3, 0; -3, 0; -11, 0];
x0 = [10; -10; 5; -5];
x_0 = [5; 10; -5; 10];
C = [2, 2, 0, 4; 0, 3, 6, 0];
D = [0, 0; 0, 4];
sys = ss(A,B,C,D);

%variable matrix
Q = inv(0.2*eye(4));
R = inv(0.04*eye(2));

Q_1 = eye(4);
R_1 = eye(2);

%checking of a sufficient condition for the uniqueness of the solution 
% of the Riccati equation
sys_1 = ss(A, B, C, D);
rank(ctrb(sys_1));
rank(obsv(sys_1));

%solution of the Riccati equation
P = icare(A',C',Q,R,0,eye(4),0);
L = -P*C'*inv(R);

[P_1,K_1,L_1] = icare(A,B,Q_1,R_1,0,eye(4),0);
K = -inv(R_1)*B'*P_1;
