% object
A1 = [10, 7, 8; 2, 15, 10; 3, 11, 12]
B1 = [1;2;3]
B2 = zeros(3,4)
A2 = [0.5, 2, 0, 0; -2, 0.5, 0, 0; 0, 0, 0.3, 1; 0, 0, -1, 0.3]
eig(A1)
eig(A2)
rank(ctrb(A1, B1))

% output
C2 = [1, 1, 1]
D2 = [1, -2, -1, -1]

%controller
G = [-1 0 0; 0 -0.5 1; 0 -1 -0.5];
Y1 = [1 1 1];
V = [Y1; Y1*G; Y1*G*G];
cvx_begin sdp
variable P1(3,3)
A1*P1 - P1*G == B1*Y1;     
cvx_end
K1 = -Y1*inv(P1)
eig(A1+ B1*K1)

%follower equation
cvx_begin sdp
    variable P2(3,4)
    variable Y2(1,4)
    P2*A2 - A1*P2 == B1*Y2 + B2;
    C2*P2 + D2 == 0;
cvx_end
K2 = Y2 - K1*P2

c = [C2 D2]
a = [A1+B1*K1 B2+B1*K2; zeros(4,3) A2]
obsv(a, c)
rank(obsv(a,c))

c = [C2 D2]
a = [A1 B2; zeros(4,3) A2]
obsv(a, c)
rank(obsv(a,c))