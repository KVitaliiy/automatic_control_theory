grid minor;
hold on;

t_1 = out.u_1.Time;
u_1 = out.u_1.Data;
plot(t_1, u_1);

t_2 = out.u_2.Time;
u_2 = out.u_2.Data;
plot(t_2, u_2);

t_3 = out.u_3.Time;
u_3 = out.u_3.Data;
plot(t_3, u_3);

legend('u1', 'u2', 'u3');