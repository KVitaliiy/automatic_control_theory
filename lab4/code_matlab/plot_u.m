grid minor;
hold on;

t_1 = out.y_f_3.Time;
u_1 = out.y_f_3.Data(:,2);
graph_1 = plot(t_1, u_1, 'red');
set(graph_1,'LineWidth',1);

t_1_ = out.y_3_.Time;
u_1_ = out.y_3_.Data(:,2);
graph_1 = plot(t_1_, u_1_, 'b');
set(graph_1,'LineWidth',1);


legend('y', 'yhat');
