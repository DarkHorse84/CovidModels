function dotX = sird(a0,a1,tl,d,r,x,t)
  %I=1, S=2, R=3, D=4,
  infected = x(1);
  susceptible = x(2);
  dead = x(4);
  recovered = x(3);
  
  if t < tl
    newInfections = a0 * susceptible * infected;
    [t (r+d)/susceptible a0]
  else 
    newInfections = a1 * susceptible * infected;
  endif
  recovery = r * infected;
  deaths =  d * infected;
  dotX(1) = newInfections - recovery - deaths;
  dotX(2) = -newInfections;
  dotX(3) = recovery;
  dotX(4) = deaths;
endfunction