model disease_no_failure
  Real T = 100; //Total population (100%)
  Real i(start = 1 / 15000000 * 100);  //all infected people (incl, recovered, sick and dead) (initially 1 in 15 million)
  Real s;  //Sick people
  Real u;  //Uninfected people
  Real d(start = 0);  //Dead People
  Real r(start = 0);  //Recovered people
  Real a;  //Infection rate (per day)
  Real b_base = 0.7;  //Recovery rate  (per day)
  Real b;
  Real c_base = 0.015;  //Death Rate (per day, chosen to get a 2% death rate)
  Real c;
equation
  if time < 3 then
    a = 0.02;
  elseif time < 11 then
    a = 0.0005;
  else
    a = 0.01;
  end if;
  
  b = b_base;
  c = c_base;
  T = s + u + d + r;
  der(i) = a * u * (s);
  s = i - r - d;
  der(r) = b * s;
  der(d) = c * s;
end disease_no_failure;
