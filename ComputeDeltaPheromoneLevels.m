function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection)
  pathCollectionLen = size(pathCollection, 1);
  if (pathCollectionLen < 1)
    deltaPheromoneLevel = [];
    return;
  end

  numberOfCities = length(pathCollection);
  deltaPheromoneLevel = zeros(numberOfCities, numberOfCities);

  for i = 1 : pathCollectionLen
    currentPath = pathCollection{i};
    pathLen     = length(currentPath) - 1;

    for j = 1 : pathLen
      currCity = currentPath(j);
      nextCity = currentPath(j + 1);
      deltaPheromoneLevel(currCity, nextCity) = deltaPheromoneLevel(currCity, nextCity) + (1 / pathLengthCollection(i));
    end

    % Also add pheromones from last city to beginning.
    currCity = currentPath(1);
    nextCity = currentPath(end);
    deltaPheromoneLevel(nextCity, currCity) = deltaPheromoneLevel(nextCity, currCity) + (1 / pathLengthCollection(i));
  end
end
