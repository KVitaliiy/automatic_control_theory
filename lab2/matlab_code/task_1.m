% given data
A = [-6, 0, 0, 0; 0, 8,  0, 0; 0, 0, 2, 5; 0, 0, -5, 2];
B = [0; 1; 9; 2];
C = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
D = zeros(4, 1);
sys = ss(A, B, C, D);
x_0 = [1; 1; 1; 1];
eig_A = eig(A);

% Finding the matrix Κ by given spectrum of matrix (A+BK)
G1 = [-6, 0, 0, 0; 0, -3,  0, 0; 0, 0, -3, 5; 0, 0, -5, -3];
Y1 = [1, 1, 1, 1];

% Solving Sylvester's equations
cvx_begin sdp
variable P(4, 4)
A*P - P*G1 == B*Y1;
cvx_end

% first string of matrix equals [0, 0, 0, 0] because detrminant equls 0
% to determinant was more then zero let P(1, 1) = 1
% P is still root of Sylvester's equation 
P(1, 1 ) = 1;

%finding controller
K = - Y1 * inv(P);