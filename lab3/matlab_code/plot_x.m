grid minor;
hold on;

% a = 0.5
t_1 = out.x_1.Time;
x_1 = out.x_1.Data(:,4);
%plot(t_1, x_1);
t_1_ = out.x_1_.Time;
x_1_ = out.x_1_.Data(:,4);
%plot(t_1_, x_1_);

% a = 2
t_2 = out.x_2.Time;
x_2 = out.x_2.Data(:,4);
%plot(t_2, x_2);
t_2_ = out.x_2_.Time;
x_2_ = out.x_2_.Data(:,4);
%plot(t_2_, x_2_);

% a = 4
t_3 = out.x_3.Time;
x_3 = out.x_3.Data(:,4);
plot(t_3, x_3);
t_3_ = out.x_3_.Time;
x_3_ = out.x_3_.Data(:,4);
plot(t_3_, x_3_);

legend('x4', 'x4hat');
