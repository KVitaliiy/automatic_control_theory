% given data
A = [5, -9, -7, 1; -9, 5,  -1, 7; -7, -1, 5, 9; 1, 7, 9, 5];
B = [3; 3; 1; 3];
C = [2, -2, 2, 2; -2, 4, 2, 4];
D = zeros(2, 1);
sys = ss(A, B, C, D);
eig_A = eig(A);

% Сontrollability matrix
U = ctrb(sys);
rank_U = rank(U);

% Observabillity matrix
O = obsv(sys);
rank_O = rank(O);
