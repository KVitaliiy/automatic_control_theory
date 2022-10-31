% system
A = [0,1;0,0];
B1 = [-2,1,0;-3,1,0];
B2 = [0;1];
C1 = [1,0];
D1 = [0,0,2];
g = 14.55;

% z(t)
C2 = [0,0;1,2];
D2 = [-3; 0];

% conditional test
C2'*D2 == 0
det(D2'*D2)
rank(ctrb(A,B2))
rank(obsv(A,C2))
B1*D1' == 0
det(D1*D1')
rank(obsv(A, C1))
rank(ctrb(A, B1))

% controller and observer
Q = icare(A,B2,C2'*C2,D2'*D2,0,eye(2),(g.^-2).*B1*B1')
K = -inv(D2'*D2)*B2'*Q

% find observer matrix
P = icare(A',C1',B1*B1',D1*D1',0,eye(2),(g.^-2).*C2'*C2)
L = -P*inv(eye(2)-(g.^-2).*Q*P)*(C1+(g.^-2).*D1*B1'*Q)'*inv(D1*D1')

max(eig(P*Q))
g^2
max(eig(P*Q)) < g^2

syms s real;
W_wx = inv(eye(2)+inv(s*eye(2)-A)*B2*K*inv(s*eye(2)-A-g^(-2)*B1*B1'*Q-B2*K-L*C1)*L*C1)*inv(s*eye(2)-A)*(B1-B2*K*inv(s*eye(2)-A-g^(-2)*B1*B1'*Q-B2*K-L*C1)*L*D1);
W_wxhat = -inv(eye(2)+inv(s*eye(2)-A-g^(-2)*B1*B1'*Q-B2*K-L*C1)*L*C1*inv(s*eye(2)-A)*B2*K)*inv(s*eye(2)-A-g^(-2)*B1*B1'*Q-B2*K-L*C1)*(L*C1*inv(s*eye(2)-A)*B1+L*D1);
W_s = C2*W_wx+D2*K*W_wxhat;
size(W_s)
[N11, D11] = numden(W_s(1,1));
[N12, D12] = numden(W_s(1,2));
[N13, D13] = numden(W_s(1,3));
[N21, D21] = numden(W_s(2,1));
[N22, D22] = numden(W_s(2,2));
[N23, D23] = numden(W_s(2,3));

WN11  = coeffs(N11, 'All');
WD11  = coeffs(D11, 'All');
WN12  = coeffs(N12, 'All');
WD12  = coeffs(D12, 'All');
WN13  = coeffs(N13, 'All');
WD13  = coeffs(D13, 'All');

WN21  = coeffs(N21, 'All');
WD21  = coeffs(D21, 'All');
WN22  = coeffs(N22, 'All');
WD22  = coeffs(D22, 'All');
WN23  = coeffs(N23, 'All');
WD23  = coeffs(D23, 'All');

W = [
    tf(double(WN11), double(WD11)), tf(double(WN12), double(WD12)), tf(double(WN13), double(WD13));
    tf(double(WN21), double(WD21)), tf(double(WN22), double(WD22)), tf(double(WN23), double(WD23));
    ]
% ampW = bodeplot(W);
% setoptions(ampW,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 5]);

% sinValW = sigmaplot(W);
% setoptions(sinValW,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 5]);

% H_2 norm of transfer fuction
h_2 = norm(W)

% H_inf norm of transfer fuction
h_inf = getPeakGain(W)