function pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel, rho, pathCollection, pathLengthCollection)
  deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection);
  numberOfCities = length(pheromoneLevel);

  for i = 1 : numberOfCities
    for j = 1 : numberOfCities
      pheromoneLevel(i, j) = (1 - rho)*pheromoneLevel(i, j) + deltaPheromoneLevel(i, j);
    end
  end
end
