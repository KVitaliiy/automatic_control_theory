grid minor;
hold on;

y = out.y.Data(:,1);
t = out.y.Time;
plot(t, y);

legend('y');
