function out = binaryGA(problem, params)
    % Binary vector coded

    % Problem
    CostFunction = problem.CostFunction;
    nVar = problem.nVar;

    % Params
    MaxIt = params.MaxIt;
    nPop = params.nPop;
    beta = params.beta;
    pC = params.pC; % percentage crossover
    nC = round(pC*nPop/2)*2; % number of children (*2/2 is to ensure it's an even number)
    mu = params.mu;

    % Template for Empty Individuals
    empty_individual.Position = [];
    empty_individual.Cost = [];

    % Best Solution Ever Found
    bestsol.Cost = inf;

    % Initialization
    pop = repmat(empty_individual, nPop, 1);
    for i = 1:nPop

        % Generate Random Feasible Solution
        pop(i).Position = randi([0, 1], 1, nVar);
        % if ~isempty(problem.Constrain)
        %     while ~problem.Constrain(pop(i).Position)
        %         pop(i).Position = randi([0, 1], 1, nVar);
        %     end
        % end

        % Evaluate Solution
        pop(i).Cost = CostFunction(pop(i).Position);

        % Compare Solution to Best Solution Ever Found
        if pop(i).Cost < bestsol.Cost
            bestsol = pop(i);
        end
    end

    % Best Cost of Iterations
    bestcost = nan(MaxIt, 1);

    % Main Loop
    for it = 1:MaxIt

        % Selection Probabilities
        c = [pop.Cost];
        avgc = mean(c);
        if avgc ~= 0
            c = c/avgc;
        end
        probs = exp(-beta*c);

        % Initialize Offsprings Population
        popc = repmat(empty_individual, nC/2, 2); % organize in 2 columns

        % Crossover
        for k = 1:nC/2

            % Select Parents
            % Random selection
            % q = randperm(nPop);
            % p1 = pop(q(1));
            % p2 = pop(q(2));

            p1 = pop(rouletteWheelSelection(probs));
            p2 = pop(rouletteWheelSelection(probs));

            % Perform Crossover
            [popc(k, 1).Position, popc(k, 2).Position] = ...
                myCrossover(p1.Position, p2.Position);

        end

        % Convert popc to Single-Column Matrix
        popc = popc(:);

        % Mutation
        for l = 1:nC

            % Perform Mutation
            popc(l).Position = mutate(popc(l).Position, mu);

            % Evaluation
            popc(l).Cost = CostFunction(popc(l).Position);

            % Compare Solution to Best Solution Ever Found
            if popc(l).Cost < bestsol.Cost
                bestsol = popc(l);
            end
        end

        % Merge and Sort Population
        pop = sortPopulation([pop; popc]);

        % Remove Extra Individuals
        pop = pop(1:nPop);

        % Update Best Cost of Iteration
        bestcost(it) = bestsol.Cost;

        % Display Iteration Information
        disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestcost(it))])

    end

    % Results
    out.pop = pop;
    out.bestsol = bestsol;
    out.bestcost = bestcost;

end