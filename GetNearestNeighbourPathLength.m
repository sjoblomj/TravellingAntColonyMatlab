function pathlen = GetNearestNeighbourPathLength(cityLocations)
  numberOfCities = length(cityLocations);
  tabuList = randi(numberOfCities);
  pathlen  = 0;

  while length(tabuList) ~= numberOfCities
    currCity = cityLocations(tabuList(end), :);

    % Calculate distance to every other city
    distances = [];
    distanceIndexes = [];
    for i = 1 : numberOfCities
      % Make sure i is not in the tabuList:
      if (isempty(find(tabuList == i, 1)))
        nextCity  = cityLocations(i, :);
        distances = [distances GetDistance(nextCity, currCity)];
        distanceIndexes = [distanceIndexes i];
      end
    end

    [dist, minIndex] = min(distances);
    % Add best index to tabuList
    tabuList = [tabuList distanceIndexes(minIndex)];
    pathlen  = pathlen + dist;
  end

  % Add the path for the way back
  dist = GetDistance(cityLocations(tabuList(end), :), cityLocations(tabuList(1), :));
  pathlen = pathlen + dist;
end
