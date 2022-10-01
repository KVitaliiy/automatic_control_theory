% system object
A = [5, -9, -7, 1; -9, 5,  -1, 7; -7, -1, 5, 9; 1, 7, 9, 5];
B = [3; 3; 1; 3];
C = [2, -2, 2, 2; -2, 4, 2, 4];
x0 = [1; 1; 1; 1];
eig_A = eig(A);

% system observer
x_0 = [2; 3; 4; -5];

% Controllability of eigen values
e1_hautus = [(A - eig_A(1,1)*eye(4)); C];
rank_e1_hautus = rank(e1_hautus);

e2_hautus = [(A - eig_A(2,1)*eye(4)); C];
rank_e2_hautus = rank(e2_hautus);

e3_hautus = [(A - eig_A(3,1)*eye(4)); C];
rank_e3_hautus = rank(e3_hautus);

e4_hautus = [(A - eig_A(4,1)*eye(4)); C];
rank_e4_hautus = rank(e4_hautus);

% Finding the matrix L by given spectrum of matrix (A+LC) and K for (A +
% BK)
G1 = [-12, 0, 0, 0; 0, -11,  0, 0; 0, 0, -10, 0; 0, 0, 0, -9];
Y1 = [1, 1; 1, 1; 1, 1; 1, 1];
G2 = [-1, 0, 0, 0; 0, -2,  0, 0; 0, 0, -3, 0; 0, 0, 0, -4];
Y2 = [1, 1, 1, 1];

% Solving Sylvester's equations
cvx_begin sdp
variable Q(4, 4)
variable P(4, 4)
G1*Q - Q*A == Y1*C;
A*P - P*G2 == B*Y2;
cvx_end

%finding observer
L = inv(Q) * Y1;

%finding controller
K = - Y2 * inv(P);

% transfers function
syms s;
W = K*inv(A + B*K + L*C - s*eye(4))*L;
W_y1 = simplifyFraction(W(1,1));
[n_y1, d_y1] = numden(W_y1);
n_y1 = coeffs(n_y1, s);
%n_y1 = double(n_y1 / 1000000000000000000000000000);
d_y1 = coeffs(d_y1, s);
%d_y1 = double(d_y1 / 1000000000000000000000000000);

W_y2 = simplifyFraction(W(1,  2));
[n_y2, d_y2] = numden(W_y2);
n_y2 = coeffs(n_y2, s);
%n_y2 = double(n_y2 / 1000000000000000000000000000);
d_y2 = coeffs(d_y2, s);
%d_y2 = double(d_y2 / 1000000000000000000000000000);
