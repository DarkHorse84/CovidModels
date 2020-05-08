disease_lockdown_failure.exe -override=startTime=0,stopTime=100,stepSize=0.002,tolerance=1e-6,solver=dassl,outputFormat=mat,variableFilter="d|s|u|i"
disease_no_failure.exe -override=startTime=0,stopTime=100,stepSize=0.002,tolerance=1e-6,solver=dassl,outputFormat=mat,variableFilter="d|s|u|i"
disease_no_failure_no_lockdown.exe -override=startTime=0,stopTime=100,stepSize=0.002,tolerance=1e-6,solver=dassl,outputFormat=mat,variableFilter="d|s|u|i"
disease_no_lockdown.exe -override=startTime=0,stopTime=100,stepSize=0.002,tolerance=1e-6,solver=dassl,outputFormat=mat,variableFilter="d|s|u|i"
del *.o
del *.c
del *.h
del *.makefile