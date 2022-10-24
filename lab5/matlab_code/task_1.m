%given data
A = [-5, 0; 0, -10];
B = [1; 1];
C = [1, -1; 1, 1];
D = [0; 0];
sys = ss(A, B, C, D);

%grams of system
P = gram(sys, 'c');
Q = gram(sys, 'o');

% eigen P, Q, CPC'
[VP,EP] = eig(P);
[VCPC,ECPC] = eig(C*P*C');
[VQ,EQ] = eig(Q);

%plot the control ellipsoid
% c_e = fimplicit(@(x1,x2) [x1; x2]'*inv(P)*[x1; x2] - 1,Color='red');
% set(c_e, 'LineWidth',2);
% xlabel("x1")
% ylabel("x2")
% xlim([-0.4 0.4])
% ylim([-0.3 0.3])
% grid minor;
% hold on;

% finding input for x(0) = [0; 0] to x(1) = [1; 1]
% x1 = [1; 1];
% t1 = 1;
% opt = gramOptions('TimeIntervals',[0 t1]);
% P = gram(sys, 'c', opt);
% syms t real;
% u = simplify(B'*simplify(expm(A'*(t1-t)), "Steps", 100)*inv(P)*x1);

% plot state vectors
% t_1 = out.x1.Data(:,1);
% x_1 = out.x1.Data(:, 2);
% plot(t_1, x_1, 'b');
% 
% t_2 = out.x2.Data(:, 1);
% x_2 = out.x2.Data(:, 2);
% plot(t_2, x_2, 'g');
% 
% t_3 = out.x3.Data(:, 1);
% x_3 = out.x3.Data(:, 2);
% plot(t_3, x_3, 'c');
% 
% t_4 = out.x4.Data(:, 1);
% x_4 = out.x4.Data(:, 2);
% plot(t_4, x_4, 'yellow');
% 
% legend('control elipsoid', 'u1', 'u2', 'u3', 'u4')

%plot eigen vectors
% plotv( [VP(1, 1); VP(2, 1)]*sqrt(EP(1,1)), 'b');
% plotv( [VP(1, 2); VP(2,2)]*sqrt(EP(2,2)), 'y');
% legend('control ellipsoid', 'a', 'b');

%plot the limiting output ellipsoid
% o_e = fimplicit(@(y1,y2) [y1; y2]'*inv(C*P*C')*[y1; y2] - 1,'DisplayName','limiting output ellipsoid', Color='Blue');
% set(o_e, 'LineWidth',2);
% xlabel("y1")
% ylabel("y2")
% grid on;
% hold on;
% xlim([-0.2 0.2])
% ylim([-0.6 0.6])
% legend

% plot output vectors
% t_1 = out.y1.Data(:,1);
% x_1 = out.y1.Data(:, 2);
% plot(t_1, x_1, 'b');
% 
% t_2 = out.y2.Data(:, 1);
% x_2 = out.y2.Data(:, 2);
% plot(t_2, x_2, 'g');
% 
% t_3 = out.y3.Data(:, 1);
% x_3 = out.y3.Data(:, 2);
% plot(t_3, x_3, 'c');
% 
% t_4 = out.y4.Data(:, 1);
% x_4 = out.y4.Data(:, 2);
% plot(t_4, x_4, 'yellow');
% 
% legend('output elipsoid', 'u1', 'u2', 'u3', 'u4')

%plot eigen vectors
% plotv( [VCPC(1, 1); VCPC(2, 1)]*sqrt(ECPC(1,1)), 'b');
% plotv( [VCPC(1, 2); VCPC(2,2)]*sqrt(ECPC(2,2)), 'y');
% legend('output ellipsoid', 'a', 'b');

%plot the observability ellipsoid
% x_e = fimplicit(@(x1,x2) [x1; x2]'*Q*[x1; x2] - 1,'DisplayName','observe ellipsoid', Color='c');
% set(x_e, 'LineWidth',2);
% xlabel("x1")
% ylabel("x2")
% grid on;
% hold on;
% xlim([-3.5 3.5])
% ylim([-3.5 3.5])

%plot eigen vectors
% plotv( [VQ(1, 1); VQ(2, 1)]/sqrt(EQ(1,1)), 'b');
% plotv( [VQ(1, 2); VQ(2,2)]/sqrt(EQ(2,2)), 'y');
% legend('observe ellipsoid', 'a', 'b');

% initial conditions
% x1 = [-1.39321; 2.47333];
% x2 = [1.93409; -1.58667];
% x3 = [0; -3.16222];
% x4 = [-2.21147; -0.466667];

% Gains
% Gie = sqrt(max(eig(B'*Q*B)));
% Gep = sqrt(max(eig(C*P*C')));
% 
% cvx_begin sdp
% variable P_ee(2,2)
% variable g
% minimize g
% P_ee > 0.0001*eye(2);
% [A*P_ee+P_ee*A' B P_ee*C'; 
%     B' -g D'; 
%     C*P_ee D -g*eye(2)] < 0;
% cvx_end

% transfer function
t_f = tf(sys);

% frequenсy tranfer function 
syms w real;
W_jw = [5/((i*w)^2 + 15*(i*w) + 50) ;
                (2*(i*w) + 15)/((i*w)^2 + 15 *(i*w) + 50)];

% H_2 norm transfer function by defenition
h_2 = sqrt(double(1/(2*pi)*int(simplify(W_jw' * W_jw), 'w', -inf, inf)));

% H_infinity norm transfer function by defenition
sig = simplify(svd(W_jw));
w = 0;
h_inf = double(subs(sig));

% H_2 norm transfer function by grams
h_2_q = sqrt(B'*Q*B)
h_2_p = sqrt(trace(C*P*C'))