function y = gd_f(x, y)
if(nargin==11)
    x=0.49*tanh(x);%2*logsig(x)-1;
end
y = (-5 - 11.01667.*x + 19.79167.*x.^2 - 12.70833.*x.^3 + 3.208333.*x.^4 - 0.275.*x.^5).^2;
