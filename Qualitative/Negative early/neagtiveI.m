clear
totalPop = 15000000;
i_0=100/totalPop; %one person
r = 0.007;
d = 0.0003;
a0 = 0.0003;
a1 = 0.0002;

initCond = [i_0; 100-i_0,; 0; 0];
t = [0:0.02:1400]';

sirdArg = @(x,t) sird(a0,a0,650,d,r,x,t);% anonymous function
x1 = lsode(sirdArg,initCond , t);
subplot(4,1,1)
plot(t, x1);

t = [0:0.02:1400]';
sirdArg = @(x,t) sird(a0,a1,650,d,r,x,t);% anonymous function
x2 = lsode(sirdArg,initCond , t);
subplot(4,1,2)
plot(t, x2);
subplot(4,1,3)
hold on
plot(t, x1(:,1));
plot(t, x2(:,1));
subplot(4,1,4)
hold on
plot(t, x1(:,4));
plot(t, x2(:,4));