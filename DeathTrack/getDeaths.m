function [cumulativeDeaths lastUpdate] = getDeaths(url, index)
  cumulativeDeaths = [];
  lines = strsplit(urlread(url));
  for i = 4:length(lines)-1
    dead = str2num(strsplit(lines{i},','){index});
    lastUpdate = strsplit(lines{i},','){1};
    cumulativeDeaths = [cumulativeDeaths dead];
  endfor
endfunction
