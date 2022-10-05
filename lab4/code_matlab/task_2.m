%given data
A = [-6, -25, -35, -10; 0, -9, -15, 0; 0, 6, 9, 0; 4, 17, 26, 6];
B = [16, 0; 3, 0; -3, 0; -11, 0];
x0 = [1000; -1000; 1000; -1000];
C = eye(4);
D = zeros(4, 2);

% LQR
Q_1 = 0.5*eye(4);
R_1 = 0.5*eye(2);
[P_1,K_1,L_1] = icare(A,B,Q_1,R_1,0,eye(4),0);
K_1 = -K_1;
J_1 = x0'*P_1*x0;

% Controller with desired decay rate
a = [0.2, 0.7];

cvx_begin sdp;
variable P(4,4);
variable Y(2,4);
P > 0.0001*eye(4);
P*A' + A*P + 2*a(1,1)*P + Y'*B' + B*Y <= 0;
cvx_end
K_2 = Y*inv(P);

cvx_begin sdp;
variable P(4,4);
variable Y(2,4);
P > 0.0001*eye(4);
P*A' + A*P + 2*a(1,2)*P + Y'*B' + B*Y <= 0;
cvx_end
K_3 = Y*inv(P);
