grid minor;
hold on;

t = out.w.Time;
x_1 = out.w.Data(:,1);
plot(t, x_1);

t_2 = out.w.Time;
x_2 = out.w.Data(:,2);
plot(t, x_2);

t_3 = out.w.Time;
x_3 = out.w.Data(:,3);
plot(t, x_3);

t_4 = out.w.Time;
x_4 = out.w.Data(:,3);
plot(t, x_4);

legend('w1', 'w2', 'w3', 'w4');