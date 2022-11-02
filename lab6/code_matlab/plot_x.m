grid minor;
hold on;

t = out.x.Time;
x_1 = out.x.Data(:,1);
plot(t, x_1);

t_2 = out.x.Time;
x_2 = out.x.Data(:,2);
plot(t_2, x_2);

x_3 = out.x.Data(:,3);
plot(t, x_3);

t = out.x1.Time;
x_1 = out.x1.Data(:,1);
plot(t, x_1, '--');

t_2 = out.x1.Time;
x_2 = out.x1.Data(:,2);
plot(t_2, x_2, '--');

x_3 = out.x1.Data(:,3);
plot(t, x_3, '--');


% t_4 = out.w.Time;
% x_4 = out.w.Data(:,3);
% plot(t, x_4);

%ylabel('w')
xlabel('t, sec')
legend('w1', 'w2', 'w3', 'w1hat', 'w2hat', 'w3hat');
%legend('u')