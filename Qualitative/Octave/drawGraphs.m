clear;
load disease_no_failure_res.mat;
disease_no_failure_res = data_2;
load disease_no_lockdown_res.mat;
disease_no_lockdown_res = data_2;
load disease_lockdown_failure_res.mat;
disease_lockdown_failure_res = data_2;
load disease_no_failure_no_lockdown_res.mat;
disease_no_failure_no_lockdown_res = data_2;

figure 1
hold on
title("Total Deaths")
plot(disease_no_failure_res(1,:),disease_no_failure_res(2,:), "linewidth", 1.5, "color", "blue")
plot(disease_no_lockdown_res(1,:),disease_no_lockdown_res(2,:), "linewidth", 1.5, "color", "black")
plot(disease_lockdown_failure_res(1,:),disease_lockdown_failure_res(2,:), "linewidth", 1.5, "color", "red")
plot(disease_no_failure_no_lockdown_res(1,:),disease_no_failure_no_lockdown_res(2,:), "linewidth", 1.5, "color", "green")
h = legend("with lockdown, no healthcare failure", 
            "no lockdown, health care failure", 
            "with lockdown, health care failure", 
            "no health care failure, no lockdown")
xlabel('time')
ylabel("Percentage of total population")
print -dpng deaths.png
hold off

figure 2
hold on
title("Sick at any given time")
plot(disease_no_failure_res(1,:),disease_no_failure_res(4,:), "linewidth", 1.5, "color", "blue")
plot(disease_no_lockdown_res(1,:),disease_no_lockdown_res(4,:), "linewidth", 1.5, "color", "black")
plot(disease_lockdown_failure_res(1,:),disease_lockdown_failure_res(4,:), "linewidth", 1.5, "color", "red")
plot(disease_no_failure_no_lockdown_res(1,:),disease_no_failure_no_lockdown_res(4,:), "linewidth", 1.5, "color", "green")
h = legend("with lockdown, no healthcare failure", 
            "no lockdown, health care failure", 
            "with lockdown, health care failure", 
            "no healthcare failure, no lockdown")
xlabel('time')
ylabel("Percentage of total population")
print -dpng sick.png
hold off

figure 3
hold on
title("Total infected")
plot(disease_no_failure_res(1,:),disease_no_failure_res(3,:), "linewidth", 1.5, "color", "blue")
plot(disease_no_lockdown_res(1,:),disease_no_lockdown_res(3,:), "linewidth", 1.5, "color", "black")
plot(disease_lockdown_failure_res(1,:),disease_lockdown_failure_res(3,:), "linewidth", 1.5, "color", "red")
plot(disease_no_failure_no_lockdown_res(1,:),disease_no_failure_no_lockdown_res(3,:), "linewidth", 1.5, "color", "green")
h = legend("with lockdown, no healthcare failure", 
            "no lockdown, health care failure", 
            "with lockdown, health care failure", 
            "no healthcare failure, no lockdown")
xlabel('time')
ylabel("Percentage of total population")
print -dpng infected.png
hold off

figure 4
hold on
title("No lockdown, no health care failure")
plot(disease_no_failure_no_lockdown_res(1,:),disease_no_failure_no_lockdown_res(2,:), "linewidth", 1.5, "color", "blue")
plot(disease_no_failure_no_lockdown_res(1,:),disease_no_failure_no_lockdown_res(3,:), "linewidth", 1.5, "color", "black")
plot(disease_no_failure_no_lockdown_res(1,:),disease_no_failure_no_lockdown_res(4,:), "linewidth", 1.5, "color", "red")
plot(disease_no_failure_no_lockdown_res(1,:),disease_no_failure_no_lockdown_res(5,:), "linewidth", 1.5, "color", "green")
h = legend("Deaths", 
            "Total infections", 
            "Currently sick", 
            "Currently Uninfected")
xlabel('time')
ylabel("Percentage of total population")
print -dpng no_lockdown_no_failure.png
hold off