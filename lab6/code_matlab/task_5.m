% 7 task

% plant parameters
A1 = [0 1; 0 0];
B1 = [0; 1];
B2 = [0 0 0 0 0 0; 0 0 0 0 0 0];
A2 = [0 1 0 0 0 0; -1 0 0 0 0 0; 0 0 0 3 0 0; 0 0 -3 0 0 0; 
    0 0 0 0 0 5; 0 0 0 0 -5 0;];
C1 = [1 0];
C2 = -C1;
D1 = [1 0 1 0 1 0];
D2 = [8/pi 0 8/(3*pi) 0 8/(5*pi) 0];
w0 = [0;1;0;1;0;1];

% step 1.1: serching K1
G = [-2 2; -2 -2];
y = [1 1];
V = [y; y*G];
if rank(V) == 2
    cvx_begin sdp
        variable p(2,2)
        A1*p - p*G == B1*y;                                      %#ok<*VUNUS> 
    cvx_end
    K1 = -y*inv(p)                                                  %#ok<*MINV,NOPTS> 
end

% step 1.2: searching L1 & L2
g = [-1.5 0 0 0 0 0 0 0;
    0 -0.5 0 0 0 0 0 0;
    0 0 -0.2 0 0 0 0 0;
    0 0 0 -0.4 0 0 0 0;
    0 0 0 0 -2 0 0 0;
    0 0 0 0 0 -3 4 0;
    0 0 0 0 0 -4 -3 0;
    0 0 0 0 0 0 0 -0.3;]
c = [C1 D1];
a = [A1 B2; zeros(6,2) A2];
y = [-1; -1; -1; -1; -1; -1; -1; -1];

% check if pair (g, y) is controllable to count l
rank([y g*y (g^2)*y (g^3)*y (g^4)*y (g^5)*y (g^6)*y (g^7)*y])

cvx_begin sdp
    variable p(8,8)
    g*p - p*a == y*c;
cvx_end
l = inv(p)*y;
L1 = l(1:2); L2 = l(3:8);

% step 2.3: solve
cvx_begin sdp
    variable P(2,6)
    variable Y(1,6)
    P*A2 - A1*P == B1*Y + B2;
    C2*P + D2 == 0;
cvx_end

K2 = Y - K1*P