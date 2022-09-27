%given data
A = [-8, -3, -12; -3, -2, -6; 6, 0, 7];
B = [0; 0; 0];
C = [0, 1, 1];
D = 0;
sys = ss(A, B, C, D);
check = isstable(sys);
t_1 = 3;

% Observabillity matrix
U = obsv(sys);
rank_U = rank(U);

% System in Jordan basis (complex)
[P_complex, A_jordan_complex] = eig(A);
C_jordan_complex = C*P_complex;

% System in Jordan basis (real)
[P_real, A_jordan_real] = cdf2rdf(P_complex, A_jordan_complex);
C_jordan_real = C*P_real;

% Hautus matrices
e1_hautus = [(A - A_jordan_complex(1,1)*eye(3)); C];
rank_e1_hautus = rank(e1_hautus);

e2_hautus = [(A - A_jordan_complex(2,2)*eye(3)); C];
rank_e2_hautus = rank(e2_hautus);

e3_hautus = [(A - A_jordan_complex(3,3)*eye(3)); C];
rank_e3_hautus = rank(e3_hautus);

% observabillity gramian for time t_1
% function gram() cannot be used because the system is unstable
syms t real;
exp_a_1 = simplify(expm((A')*t), "Steps", 100);
exp_a_2 = simplify(expm(A*t), "Steps", 100);
f_g = exp_a_1*(C')*C*exp_a_2;
Gr_t_1 = int(f_g, t, 0, t_1);
Gr_t_1 = double(Gr_t_1);
eig_Gr = eig(Gr_t_1);

% initial conditions to lead state vector along the trajectory y(t) during time t_1
y_t = exp(-2*t)*(2*cos(3*t) + sin(3*t)); 
exp_a = expm(A'*t);
exp_a_simplify = simplify(exp_a, "Steps", 100);
f = exp_a_simplify*C'*y_t;
integral_f = int(f, t, 0, t_1);
x_0 = double(pinv(Gr_t_1) * integral_f);