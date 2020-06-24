
date = 1;
YYYYMMDD = 2;
EC = 3;
FS = 4;
GP = 5;
KZN = 6;
LP = 7;
MP = 8;
MP = 8;
NC = 9;
NW = 10;
WC = 11;
UNKNOWN = 12;
total = 13;
[deaths lastUpdate] = getDeaths("https://raw.githubusercontent.com/dsfsi/covid19za/master/data/covid19za_provincial_cumulative_timeline_deaths.csv", total);

lambda = [];
doublingTime = [];
fourtyKTime = [];
for i = 30:length(deaths)
  last30days = deaths(i-29:i);
  log30Days = log10(last30days);
  X=[ones(30,1),[0:29]'];
  [b s r] = ols(log30Days', X);
  lambda =[lambda b(2)];
  doublingTime = [doublingTime log10(2)/b(2)];
  fourtyKTime = [fourtyKTime log10(40000/max(deaths(i-29:i)))/b(2)];
endfor
figure ();
plot(deaths);
grid on;
title(strcat("ZA Cumulative deaths, current: ", num2str(max(deaths))));
xlabel("days since 30-03-2020");
figure ();
plot(log2(deaths)); %Plot deaths on a log base 2 scale (easier doubling time measurement)
yticklabels(2.^yticks()); %Use the right y  ticks
grid on;
title("ZA Cumulative deaths (log base 2 scale)");
xlabel("days since 30-03-2020");
figure ();
plot(doublingTime);
grid on;
title("Doubling time calculated as linear least squares approximation of log of exponential data over 30 days");
xlabel("days since 28-04-2020");
figure ();
plot(fourtyKTime);
grid on;
xlabel("days since 28-04-2020");
title("Estimated time to reach 40 000 deaths (measured from doubling time)");
figure ();
hold on
plot(log10(deaths(i-29:i)));
plot(b(2)*[0:29]+b(1));
legend("log of actual","linear least squares approximation");
title(strcat("Log of data vs linear least squares approximation. Max residual: ", num2str(max(r))));
hold off

disp(strcat("Current Lambda: ", num2str(lambda(length(lambda)))));
disp(strcat("Current Doubling Time:", num2str(doublingTime(length(doublingTime)))));
disp(strcat("Current Time to 40 000 deaths:", num2str(fourtyKTime(length(fourtyKTime)))));
disp(strcat("Last Update:", lastUpdate));

totalPop = 15000000;
i_0=100/totalPop; %one person
r = 0.7;
d = 0.005;
a0 = 0.03;
a1 = 0.01;

initCond = [i_0; 100-i_0,; 0; 0];
t = [0:0.002:20]';

sirdArg = @(x,t) sird(0,a0,0,d,r,x,t);% anonymous function

x1 = lsode(sirdArg,initCond , t);
sirdArg = @(x,t) sird(0,a0+0.01,0,d,r,x,t);% anonymous function

totalPop = 7000000;
i_0=100/totalPop; %one person
x2 = lsode(sirdArg,initCond , t);

sirdArg = @(x,t) sird(0,a0-0.01,0,d,r,x,t);% anonymous function
totalPop = 11000000;
i_0=100/totalPop; %one person
x3 = lsode(sirdArg,initCond , t);

simulatedDeaths = x1(:,4)*15000000/100+x2(:,4)*7000000/100+x3(:,4)*11000000/100;
figure();
hold on
plot(simulatedDeaths);
plot(x1(:,4)*15000000/100);
plot(x2(:,4)*7000000/100);
plot(x3(:,4)*11000000/100);
hold off
title("Simulated deaths");