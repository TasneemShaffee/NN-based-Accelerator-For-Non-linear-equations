f=@T_1_matlab;
optiSolver('SNLE')

% used : HYBRJ, MKLTRNLS, LMDER MATLAB
opts = optiset('solver','MKLTRNLS');

opts.tolafun=1e-21;
opts.tolint=1e-21;
opts.tolrfun=1e-21;
opts.maxfeval=100000;
opts.maxiter=1000000;

%set x0 array based on your inital guesses
%x0=[0.45 0.45];%2;%[0.2, 0.2]%12.7;
x0=1*ones(1,2);%26);%[1 1 1 1 1 1 1];
Opt = opti('nleq',f,'x0',x0, 'options', opts);
[x,fval,exitflag,info] = solve(Opt);

fval
info
x

plot(x,'red')
hold on
plot(my_x, 'g*')
hold on
plot(x_107, 'b*')
hold on
legend('Intel Results', 'Our results', '[1] results');

