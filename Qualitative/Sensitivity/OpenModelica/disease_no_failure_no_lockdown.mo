model disease_no_failure_no_lockdown
     parameter Real a;
     Real T = 100; //Total population (100%)
     Real I(start = 1 / 15000000 * 100);  //Sick people
     Real S;  //Uninfected people
     Real D(start = 0);  //Dead People
     Real R(start = 0);  //Recovered people
     inputs params;
equation
  T = s + u + d + r;
  der(s) = 0.02 * s * (u);
  der(r) = 0.7 * s - 0.01 * r;
  der(d) = 0.015 * s;
  der(u) = 0.01 * r - 0.02 * s * (u);
  der(T) = 0;
end disease_no_failure_no_lockdown;
