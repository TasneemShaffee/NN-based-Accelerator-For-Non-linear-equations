f=@gd_f_2w;
num_samples = 500;
a = -3;
b = 3;
w1 = (b-a).*rand(num_samples, 1) + a;
w2 = (b-a).*rand(num_samples, 1) + a;

opt = [w1 w2];
inp = f(w1,w2);