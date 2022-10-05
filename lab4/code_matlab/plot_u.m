grid minor;
hold on;

t_1 = out.u_1.Time;
u_1 = out.u_1.Data(:,1);
graph_1 = plot(t_1, u_1);
graph_1.set('LineWidth', 1);

t_2 = out.u_2.Time;
u_2 = out.u_2.Data(:,1);
graph_2 = plot(t_2, u_2);
graph_2.set('LineWidth', 1);

t_3 = out.u_3.Time;
u_3 = out.u_3.Data(:,1);
graph_3 = plot(t_3, u_3);
graph_3.set('LineWidth', 1);

legend('u1', 'u2', 'u3');