f=@diode_vis;
% diode test
r=-0.08:0.01:0.789;
%r=-0.0045:0.001:0.096;
[v1, v2]=meshgrid(r);
% unsupervised.txt weights_gd.txt weights_tasn.txt
T = readtable('unsupervised.txt');%'weights_gd.txt');
n = height(T);
T=table2array(T);
surf(v1,v2,(f(v1,v2)))

ax = gca;               % get the current axis
ax.Clipping = 'off';    % turn clipping off
%zlim([0 13.5])
xlabel('v1');
ylabel('v2');

% History size set

XY = (0.78-0.14) * rand(2,n) + 0.14;
for i=1:n
    if T(i,1)<0.789 && T(i,2)<0.789
        plot3(T(i,1),T(i,2), f(T(i,1),T(i,2)),'or','MarkerSize',5,'MarkerFaceColor','r');
        hold on
        surf(v1,v2,(f(v1,v2)));
        hold off
    end
    pause(.001)
end

