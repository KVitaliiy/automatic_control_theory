grid minor;
hold on;

t = out.z1.Time;
z1 = out.z1.Data(:,1);
plot(t, z1);
t_ = out.z1.Time;
z2 = out.z1.Data(:,2);
plot(t_, z2);
z3 = out.z1.Data(:,3);
plot(t_, z3);

% t = out.rel_norm.Time;
% r = out.rel_norm.Data;
% plot(t, r);

xlabel('t, sec')

legend('z1', 'z2', 'z3');
