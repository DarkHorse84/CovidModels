clear
totalPop = 15000000;
i_0=100/totalPop; %one person
r = 0.7;
d = 0.03;
a0 = 0.04;
a1 = 0.01;

initCond = [i_0; 100-i_0,; 0; 0];
t = [0:0.002:50]';
maxD = [];
D = [];

sirdArg = @(x,t) sird(a0,a0,0,d,r,x,t);% anonymous function
x = lsode(sirdArg,initCond , t);
figure 1
plot(t, x);

for tl = 0:0.1:20
  sirdArg = @(x,t) sird(a0,a1,tl,d,r,x,t);% anonymous function
  x = lsode(sirdArg,initCond , t);
  D = [D x(:,4)];
  maxD = [maxD max(x(:,4))];
endfor
  
"done"

figure 2
hold on
plot([0:0.1:20], maxD);

sirdArg = @(x,t) sird(a0,a1,9,d,r,x,t);% anonymous function
x = lsode(sirdArg,initCond , t);
plot(t, x(:,4));
plot(t, x(:,1));


hold off
clear