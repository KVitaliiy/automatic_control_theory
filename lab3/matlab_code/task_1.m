A = [-6, 0, 0, 0; 0, 8,  0, 0; 0, 0, 2, 5; 0, 0, -5, 2];
B = [0; 1; 9; 2];
C = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
D = zeros(4, 1);
sys = ss(A, B, C, D);
x0 = [10; -15; 1; -5];

% Desired decay rate
a = [0.5, 2, 4];
mu = [100, 200, 300];

% Lyapunov inequality
cvx_begin sdp;
variable P(4,4);
variable Y(1,4);
P > 0.0001*eye(4);
P*A' + A*P + 2*a(1,1)*P + Y'*B' + B*Y <= 0;
cvx_end
K_1 = Y*inv(P);

cvx_begin sdp;
variable P(4,4);
variable Y(1,4);
P > 0.0001*eye(4);
P*A' + A*P + 2*a(1,2)*P + Y'*B' + B*Y <= 0;
cvx_end
K_2 = Y*inv(P);

cvx_begin sdp;
variable P(4,4);
variable Y(1,4);
P > 0.0001*eye(4);
P*A' + A*P + 2*a(1,3)*P + Y'*B' + B*Y <= 0;
cvx_end
K_3 = Y*inv(P);