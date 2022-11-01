grid minor;
hold on;

t = out.C2x.Time;
x_1 = out.C2x.Data(:,1);
plot(t, x_1);

t_2 = out.D2w.Time;
x_2 = out.D2w.Data(:,1);
plot(t_2, x_2);

% x_3 = out.w.Data(:,3);
% plot(t, x_3);
% 
% t_4 = out.w.Time;
% x_4 = out.w.Data(:,3);
% plot(t, x_4);

%ylabel('w')
xlabel('t, sec')
legend('C2x', '-D2w');