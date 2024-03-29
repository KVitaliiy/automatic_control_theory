% system
A = [0,1;0,0];
B1 = [1,1;1,-1];
B2 = [0;1];
g = 1.57;
% z(t)
C2 = [0,0;2,3;];
D2 = [1;0];

% conditional test
C2'*D2 == 0
det(D2'*D2)
rank(ctrb(A,B2))
rank(obsv(A,C2))

% H_infinity control
Q = icare(A,B2,C2'*C2,D2'*D2,0,eye(2),(g.^-2).*B1*B1')
K = -inv(D2'*D2)*B2'*Q

% W(w->z)
syms s real;
W_s = (C2+D2*K)*inv(s*eye(2,2)-A-B2*K)*B1
[N11, D11] = numden(W_s(1,1));
[N12, D12] = numden(W_s(1,2));
[N21, D21] = numden(W_s(2,1));
[N22, D22] = numden(W_s(2,2));
WN11  = coeffs(N11, 'All');
WD11  = coeffs(D11, 'All');
WN12  = coeffs(N12, 'All');
WD12  = coeffs(D12, 'All');
WN21  = coeffs(N21, 'All');
WD21  = coeffs(D21, 'All');
WN22  = coeffs(N22, 'All');
WD22  = coeffs(D22, 'All');

W = [
    tf(double(WN11), double(WD11)), tf(double(WN12), double(WD12));
    tf(double(WN21), double(WD21)), tf(double(WN22), double(WD22));
    ]

% H_2 norm of transfer fuction
h_2 = norm(W)

% H_inf norm of transfer fuction
h_inf = getPeakGain(W)

% ampW = bodeplot(W);
% setoptions(ampW,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 10]);

% sinValW = sigmaplot(W);
% setoptions(sinValW,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 10]);