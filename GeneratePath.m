function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
  numberOfCities = length(pheromoneLevel);
  tabuList  = zeros(1, numberOfCities);
  firstNode = randi(numberOfCities);
  nextNode  = firstNode;

  for i = 1 : numberOfCities
    nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta, nextNode);
    tabuList(i) = nextNode;
  end
  path = [tabuList firstNode];
end
