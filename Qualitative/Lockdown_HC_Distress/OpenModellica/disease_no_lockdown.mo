model disease_no_lockdown
  Real T = 100;  //Total population (100%)
  Real i(start = 1 / 15000000 * 100);  //all infected people (incl, recovered, sick and dead) (initially 1)
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

    a = 0.02;
//health care collapse
  if s > 1 then
    c = 2 * c_base;
    b = 0.75 * b_base;
  else
    c = c_base;
    b = b_base;
  end if;
  T = s + u + d + r;
  der(i) = a * u * (s);
  s = i - r - d;
  der(r) = b * s;
  der(d) = c * s;
end disease_no_lockdown;
