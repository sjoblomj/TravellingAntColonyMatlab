function len = GetPathLength(path, cityLocation)
  len = 0;
  for i = 1 : length(path) - 1
    len = len + GetDistance(cityLocation(path(i), :), cityLocation(path(i + 1), :));
  end
end
