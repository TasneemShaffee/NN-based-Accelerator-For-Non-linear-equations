function F = T_1_matlab(x)
F(1) = 0.050000000001*x(1) + -0.05*x(2) + -0.001;
F(2) = -0.05*x(1) + 0.050000000001*x(2) + 1e-15*(exp((x(2))/0.025852) - 1);
