clear
totalPop = 150000000
%Initial Conditions
i_n = (totalPop-1)/totalPop;
s_n = 100 - i_n;
r_n = 0;
d_n = 0;

%Arrays
S = [s_n];
I = [i_n];
R = [r_n];
D = [d_n];
T = [1:5];

%Parameters
a = 0.04;
b = 0.0007;
c = 0.00001;
q = 0.001;

%step
for t = T
  s_n1 = s_n*(1-a*i_n) + q*r_n;
  i_n1 = i_n*(a*s_n - b - c);
  r_n1 = r_n*(1-q) + b*i_n;
  d_n1 = d_n + c*i_n;
  
  S = [S s_n1];
  I = [I i_n1];
  R = [R r_n1];
  D = [D d_n1];
  
  s_n = s_n1;
  i_n = i_n1;
  r_n = r_n1;
  d_n = d_n1;
endfor
T = [0 T];

plot(T, S);