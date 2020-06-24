clear;

a_start = 0;
a_step = 0.01;
a_end = 1;
alpha = a_start:a_step:a_end;
F = 0:1:100;
d_a = [];
d_f = [];
totalPop = 15000000;
i_0=100/totalPop; %one person
r = 0.7;
d = 0.015;
initCond = [i_0; 100-i_0,; 0; 0];
t = [0:0.002:1000]';
figure 1
hold on
for a = alpha
  a
  sirdArg = @(x,t) sird(a,d,r,0.1,x,t);% anonymous function
  x = lsode(sirdArg,initCond , t);
  d_a = [d_a max(x(:,4))];
  inf= [inf max(x(:,1))];
  plot(t,x(:,1));
endfor
hold off
figure 2
plot(alpha, d_a)
title("Projected deaths by infection co-efficient and health care distress at 0.1% infected");
%a = 0.3
%for f = F
%  f
%  sirdArg = @(x,t) sird(a,d,r,f,x,t);% anonymous function
%  x = lsode(sirdArg,initCond , t);
%  d_f = [d_f max(x(:,4))];
%endfor

%figure 2
%plot(F, d_f)
%title("Projected deaths by health care distress threshold with an infection co-efficient 0f 0.3");
%d_f2=[];

