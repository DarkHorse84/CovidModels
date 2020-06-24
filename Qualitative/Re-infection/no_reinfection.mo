model no_reinfection
  Real i = 0.4; //infection rate
  Real s = 0; //immunity loss rate
  Real d = 0.015; //death rate
  Real r = 0.9; //recovery rate
  
  Real I(start=100/15000000);
  Real S(start=100-100/15000000);
  Real D(start=0);
  Real R(start=0);
equation
  der(S)=s*R-i*S*I;
  der(I)=i*S*I-d*I-r*I;
  der(D)=d*I;
  der(R)=r*I-s*R;
end no_reinfection;
