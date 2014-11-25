function visibility = GetVisibility(cityLocations)
  numberOfCities = length(cityLocations);
  visibility = zeros(numberOfCities, numberOfCities);
  for i = 1 : numberOfCities
    for j = 1 : numberOfCities
      visibility(i, j) = 1 / GetDistance(cityLocations(i, :), cityLocations(j, :));
    end
  end
end
