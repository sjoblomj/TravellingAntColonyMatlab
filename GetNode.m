function nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta, startNode)
  numberOfCities = length(pheromoneLevel);
  pathProb = zeros(1, numberOfCities);
  sumOfAllPaths = 0;

  for i = 1 : numberOfCities
    if (~isempty(find(tabuList == i, 1)))
      pathProb(i) = 0;
    else
      divideSum = 0;
      for k = 1 : numberOfCities
        % Make sure k is not in the tabuList:
        if (isempty(find(tabuList == k, 1)) && k ~= startNode)
          divideSum = divideSum + ((pheromoneLevel(k, startNode)^alpha) * (visibility(k, startNode)^beta));
        end
      end
      pathProb(i) = pheromoneLevel(i, startNode)^alpha * visibility(i, startNode)^beta / divideSum;
    end
    sumOfAllPaths = sumOfAllPaths + pathProb(i);
  end

  % Normalise
  for i = 1 : numberOfCities
    pathProb(i) = pathProb(i) / sumOfAllPaths;
  end

  % Sort the paths on their probabilities,
  % and choose one at random
  [probPaths, origIndices] = sort(pathProb, 'ascend');
  r = rand;
  nextNode = origIndices(end);
  for i = 1 : numberOfCities
    if (r < probPaths(i))
      nextNode = origIndices(i);
      break
    end
  end
end
