w = -2.3:0.1:2.8;
[w1, w2] = meshgrid(w);

% x = 5.*logsig(w1+w2)-1;
% z = (-5 - 11.01667.*x + 19.79167.*x.^2 - 12.70833.*x.^3 + 3.208333.*x.^4 - 0.275.*x.^5).^2;
% 
% surf(w1, w2, z);

x = w2.*tanh(w1);
z = 0.0315.*(-5 - 11.01667.*x + 19.79167.*x.^2 - 12.70833.*x.^3 + 3.208333.*x.^4 - 0.275.*x.^5).^2;
surf(w1, w2, z);
xlabel('w1');
ylabel('w2');
ax = gca;               % get the current axis
ax.Clipping = 'off';    % turn clipping off
zlim([0 2])
