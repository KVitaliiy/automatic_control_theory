%plot the control ellipsoid
% c_e = fimplicit(@(x1,x2) [x1; x2]'*inv(P)*[x1; x2] - 1,'DisplayName','control ellipsoid', Color='red');
% set(c_e, 'LineWidth',2);
% xlabel("x1")
% ylabel("x2")
% grid minor;
% hold on;
% xlim([-0.4 0.4])
% ylim([-0.3 0.3])
% legend

% plot state vectors
hold on;
xlabel("t, sec")
ylabel("y(2)")
t_1 = out.y1.Time;
x_1 = out.y1.Data(:, 2);
plot(t_1, x_1, 'b');

t_2 = out.y2.Time;
x_2 = out.y2.Data(:, 2);
plot(t_2, x_2, 'g');

t_3 = out.y3.Time;
x_3 = out.y3.Data(:, 2);
plot(t_3, x_3, 'c');

t_4 = out.y4.Time;
x_4 = out.y4.Data(:, 2);
plot(t_4, x_4, 'yellow');

legend('y1', 'y2', 'y3', 'y4')

% fimplicit(@(y1,y2) [y1; y2]'*inv(C*P*C')*[y1; y2] - 1,'DisplayName','limiting output ellipsoid', Color='Blue')
% xlabel("y1")
% ylabel("y2")
% grid on;
% hold on;
% xlim([-9 9])
% ylim([-18 18])
% legend