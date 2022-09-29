grid minor;
hold on;
x1 = out.x1.Data;
t = out.x1.Time;
plot(t, x1);
x2 = out.x2.Data;
t = out.x2.Time;
plot(t, x2);
x3 = out.x3.Data;
t = out.x3.Time;
plot(t, x3);
x4 = out.x4.Data;
t = out.x4.Time;
plot(t, x4)
xlabel('t, sec');
legend('x1', 'x2', 'x3', 'x4');