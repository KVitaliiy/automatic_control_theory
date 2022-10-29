grid minor;
hold on;

t = out.z.Time;
z1 = out.z.Data(:,1);
plot(t, z1);
t_ = out.z.Time;
z2 = out.z.Data(:,2);
plot(t_, z2);

% t = out.rel_norm.Time;
% r = out.rel_norm.Data;
% plot(t, r);

xlabel('t, sec')

legend('z1', 'z2');
