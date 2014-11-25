function distance = GetDistance(cityOne, cityTwo)
  distance = sqrt((cityOne(1) - cityTwo(1))^2 + (cityOne(2) - cityTwo(2))^2);
end
