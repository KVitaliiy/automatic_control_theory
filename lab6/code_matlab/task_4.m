%object
A1 = [1, 1, 0; -1, 1, 0; 0, 0, -3]
B1 = [1;1;1]
B2 = [1,1,1;1,1,1;1,1,1]
A2 = [0 5 0; -5 0 0; 0 0 0.01]
eig(A1)
eig(A2)
rank(ctrb(A1, B1))

%measurable output
C1 = [1,1,1];
D1 = [-1,-1,-1];

% adjustable output
C2 = [1, 1, 1]
D2 = [-1, -1, -1]



% check observabillity
c = [C1, D1]
a = [A1, B2; zeros(3,3), A2]
o = obsv(a, c)
size(o)
rank(o)

% find K1
G = [-2 0 0; 0 -0.5 1; 0 -1 -0.5];
Y1 = [1 1 1];
V = [Y1; Y1*G; Y1*G*G];
cvx_begin sdp
variable P1(3,3)
A1*P1 - P1*G == B1*Y1;     
cvx_end
K1 = -Y1*inv(P1)

% find observers
g = [
    -1.5  0 0 0 0 0;
    0  -1 1 0 0 0;
    0  -1 -1 0 0 0;
    0  0 0 -0.5 0 0;
    0  0 0 0 -2 2;
    0  0 0 0 -2 -2
    ];
c = [C1 D1];
a = [A1 B2; zeros(3,3) A2];
y = [-1; -1; -1; -1; -1; -1];

% check if pair (g, y) is controllable to count l
rank(a)
rank(ctrb(g, y))

cvx_begin sdp
    variable p(6,6)
    g*p - p*a == y*c;
cvx_end
l = inv(p)*y;
L1 = l(1:3)
L2 = l(4:6)

% find K2
cvx_begin sdp
    variable P2(3,3)
    variable Y2(1,3)
    P2*A2 - A1*P2 == B1*Y2 + B2;
    C2*P2 + D2 == 0;
cvx_end
K2 = Y2 - K1*P2

eig([A1+B1*K1+L1*C1 B2+B1*K2+L1*D1;L2*C1 A2+L2*D1])