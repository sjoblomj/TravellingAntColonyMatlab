% Code by Mattias Wahde
function PlotPath(connection, cityLocation, path)
  nCities = length(cityLocation);
  for i = 1:(nCities-1)
    set(connection(i), 'XData', [cityLocation(path(i), 1) cityLocation(path(i+1), 1)]);
    set(connection(i), 'YData', [cityLocation(path(i), 2) cityLocation(path(i+1), 2)]);
  end
  set(connection(nCities), 'XData', [cityLocation(path(nCities), 1) cityLocation(path(1), 1)]);
  set(connection(nCities), 'YData', [cityLocation(path(nCities), 2) cityLocation(path(1), 2)]);
  drawnow;
end
