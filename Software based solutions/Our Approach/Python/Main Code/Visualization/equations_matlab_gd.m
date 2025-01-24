xx = -0.6:0.001:3.0;
xx_l = -2.3:0.001:0.5;

% x = logsig(xx);
% y = (-5 - 11.01667.*x + 19.79167.*x.^2 - 12.70833.*x.^3 + 3.208333.*x.^4 - 0.275.*x.^5).^2;

plot(xx,f(xx));
hold on;
plot(xx, f(xx,0));
legend('with weight', 'normal function');


%%% draw 3D

