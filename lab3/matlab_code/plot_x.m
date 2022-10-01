grid minor;
hold on;

t_1 = out.x_1.Time;
x_1 = out.x_1.Data(:,4);
plot(t_1, x_1);

t_2 = out.x_2.Time;
x_2 = out.x_2.Data(:,4);
plot(t_2, x_2);

t_3 = out.x_3.Time;
x_3 = out.x_3.Data(:,4);
plot(t_3, x_3);

legend('x1', 'x2', 'x3');
