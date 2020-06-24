function dotX = sird(a,d,r,f,x,t)
  %I=1, S=2, R=3, D=4, 
  infected = x(1);
  susceptible = x(2);
  dead = x(4);
  recovered = x(3);
  newInfections = a * susceptible * infected;
  if(infected>=f)
    recovery = 0.75*r * infected;
    deaths =  2*d * infected;
  else
    recovery = r * infected;
    deaths =  d * infected;
  endif
  dotX(1) = newInfections - recovery - deaths;
  dotX(2) = -newInfections;
  dotX(3) = recovery;
  dotX(4) = deaths;
endfunction
