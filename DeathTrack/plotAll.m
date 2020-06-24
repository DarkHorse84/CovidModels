clear
provinces = ["_"; "_"; "EC"; "FS"; "GP"; "KZN"; "LP"; "MP"; "NC"; "NW"; "WC"];
legends = []
hold on
for index = 3:11
  [deaths lastUpdate] = getDeaths("https://raw.githubusercontent.com/dsfsi/covid19za/master/data/covid19za_provincial_cumulative_timeline_deaths.csv", index);
  semilogy(deaths);
  legends = [legends; strcat("Deaths for: ", provinces(index,:)) ];
endfor

[deaths lastUpdate] = getDeaths("https://raw.githubusercontent.com/dsfsi/covid19za/master/data/covid19za_provincial_cumulative_timeline_deaths.csv", 13);
semilogy(deaths);
legends = [legends; "nationwide deaths "];
legend(legends,'location','eastoutside');
hold off