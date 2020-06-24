clear
totalPop = 15000000;
i_0=100/totalPop; %one person
r = 0.7;
d = 0.03;
a0 = 0.03;
a1 = 0.01;

initCond = [i_0; 100-i_0,; 0; 0];
t = [0:0.002:20]';

sirdArg = @(x,t) sird(0,a0,0,d,r,x,t);% anonymous function

x = lsode(sirdArg,initCond , t);
x1 = x(:,4);
plot(t,x)