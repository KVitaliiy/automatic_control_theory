%given data
A = [-6, -25, -35, -10; 0, -9, -15, 0; 0, 6, 9, 0; 4, 17, 26, 6];
B = [16, 0; 3, 0; -3, 0; -11, 0];
x0 = [1000; -1000; 1000; -1000];
C = eye(4);
D = zeros(4, 2);
%variable matrix
Q_1 = eye(4);
R_1 = 10*eye(2);

Q_2 = 0.5*eye(4);
R_2 = 0.5*eye(2);

Q_3 = 10*eye(4);
R_3 = 0.1*eye(2);

%checking of a sufficient condition for the uniqueness of the solution 
% of the Riccati equation
sys_1 = ss(A, B, Q_1, zeros(4, 2));
sys_2 = ss(A, B, Q_2, zeros(4, 2));
sys_3 = ss(A, B, Q_1, zeros(4, 2));
rank(ctrb(sys_1));
rank(obsv(sys_1));
rank(ctrb(sys_2));
rank(obsv(sys_2));
rank(ctrb(sys_3));
rank(obsv(sys_3));

%solution of the Riccati equation
[P_1,K_1,L_1] = icare(A,B,Q_1,R_1,0,eye(4),0);
K_1 = -K_1;
J_1 = x0'*P_1*x0;

[P_2,K_2,L_2] = icare(A,B,Q_2,R_2,0,eye(4),0);
K_2 = -K_2;
J_2 = x0'*P_2*x0

[P_3,K_3,L_3] = icare(A,B,Q_3,R_3,0,eye(4),0);
K_3 = -K_3;
J_3 = x0'*P_3*x0
