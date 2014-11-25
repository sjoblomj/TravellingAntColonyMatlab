function AntSystem
  clear all;
  clc;

  % Max target length - stop if the length of the path is below this value:
  targetPathLength = 123.0;

  numberOfAnts = 50;
  alpha = 1.0;
  beta  = 4.0;
  rho   = 0.55;

  cityLocations  = LoadCityLocations();
  numberOfCities = length(cityLocations);

  nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocations);
  tau0 = numberOfAnts / nearestNeighbourPathLength;

  range = [0 20 0 20];
  tspFigure      = InitializeTspPlot(cityLocations, range);
  connection     = InitializeConnections(cityLocations);
  pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0);
  visibility     = GetVisibility(cityLocations);

  minimumPathLength = inf;

  bestPath  = [];
  outputstr = '';
  iter      = 0;
  tStart    = tic;
  while (minimumPathLength > targetPathLength)
    iter = iter + 1;
    pathCollection = cell(numberOfAnts, numberOfCities + 1);
    pathLengthCollection = zeros(numberOfAnts, 1);
    clc
    disp(outputstr);
    disp(sprintf('Working on iteration %d. Time taken: %d s.', iter, round(toc(tStart))));

    for ant = 1:numberOfAnts
      path = GeneratePath(pheromoneLevel, visibility, alpha, beta);
      pathLength = GetPathLength(path,cityLocations);

      if (pathLength < minimumPathLength)
        minimumPathLength = pathLength;
        bestPath = path;
        outputstr = strcat(outputstr, sprintf('\nIteration %2d, ant %2d: path length = %.5f  Time taken: %3d s', ...
                                              iter, ant, minimumPathLength, round(toc(tStart))));
        title = sprintf('\nIteration %d. Path length = %.5f', iter, minimumPathLength);
        set(tspFigure, 'Name', title);
        PlotPath(connection, cityLocations, bestPath);
      end
      pathCollection{ant} = path;
      pathLengthCollection(ant) = pathLength;
    end

    pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel, rho, pathCollection, pathLengthCollection);
    PlotPath(connection, cityLocations, bestPath);
  end
  clc
  disp(outputstr);
  disp(sprintf('\nBest path found:'));
  bestPath
end
