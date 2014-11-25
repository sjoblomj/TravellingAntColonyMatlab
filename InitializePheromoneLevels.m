function pheromoneLevels = InitializePheromoneLevels(numberOfCities, level)
  pheromoneLevels = zeros(numberOfCities, numberOfCities);
  for i = 1 : numberOfCities
    for j = 1 : numberOfCities
      pheromoneLevels(i, j) = level;
    end
  end
end
