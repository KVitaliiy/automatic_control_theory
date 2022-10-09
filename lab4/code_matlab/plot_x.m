grid minor;
hold on;

t_1 = out.j_1.Time;
x_1 = out.j_1.Data;
plot(t_1, x_1, 'r');

t_2 = out.j_2.Time;
x_2 = out.j_2.Data;
plot(t_1, x_1, 'b');

t_3 = out.j_3.Time;
x_3 = out.j_3.Data;
plot(t_3, x_3, 'g');

t_4 = out.j_4.Time;
x_4 = out.j_4.Data;
plot(t_4, x_4, 'c');

legend('j1', 'j2', 'j3', 'j4')


%t_3 = out.x_3.Time;
%x_3 = out.x_3.Data(:,4);
%graph_3 = plot(t_3, x_3, 'g');
%set(graph_3,'LineWidth',1);

%legend('x1', 'x1hat', 'x2', 'h2hat', 'x3', 'x3hat');
