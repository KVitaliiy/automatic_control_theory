% given data
A = [0, 7, 0, 0; -7, 0,  0, 0; 0, 0, 0, 1; 0, 0, -1, 0];
B = [0; 0; 0; 0];
C = [0, 5, 5, 0];
D = 0;
sys = ss(A, B, C, D);
x0 = [1; 1; 1; 1];
x_0 = [2; 0; 0; -1];
eig_A = eig(A);

% Finding the matrix L by given spectrum of matrix (A+LC)
G = [-6, 0, 0, 0; 0, -3,  0, 0; 0, 0, -3, 5; 0, 0, -5, -3];
Y = [0.1; 0.1; 0.1; 0.1];

% Solving Sylvester's equations
cvx_begin sdp
variable Q(4, 4)
G*Q - Q*A == Y*C;
cvx_end

% first string of matrix equals [0, 0, 0, 0] because detrminant equls 0
% to determinant was more then zero let P(1, 1) = 1
% P is still root of Sylvester's equation 
%Q(1, 1 ) = 1;

%finding controller
L = inv(Q) * Y;