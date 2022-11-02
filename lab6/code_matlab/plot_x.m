grid minor;
hold on;

t = out.C2x.Time;
x_1 = out.C2x.Data(:,1);
plot(t, x_1);

t = out.D2w.Time;
x_2 = out.D2w.Data(:,1);
plot(t, x_2, '--');

% t = out.y1.Time;
% x_3 = out.y1.Data(:,1);
% plot(t, x_3, '--');
% 
% t = out.x1.Time;
% x_1 = out.x1.Data(:,1);
% plot(t, x_1, '--');
% 
% t_2 = out.x1.Time;
% x_2 = out.x1.Data(:,2);
% plot(t, x_2, '--');
% 
% t = out.x.Time;
% x_3 = out.x.Data(:,1);
% plot(t, x_3, '--');
% 
% 
% t_4 = out.x.Time;
% x_4 = out.x.Data(:,2);
% plot(t, x_4);

%ylabel('w')
xlabel('t, sec')
legend('C2x', '-D2w');
%legend('z')