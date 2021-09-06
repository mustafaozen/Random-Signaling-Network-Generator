function net = RandSigNet_Source(netSize, numInput, numOutput, numFeedback, numAct, numInhib)
% This function generates a random signaling network.

% Inputs:
    % netSize: Size of the network 
    % numInput: The number of input nodes that the generated network is requested to have.
    % numOutput: The number of output nodes that the generated network is requested to have.
    % numFeedback: The maximum number of feedback interactions that the generated network is requested to have.
    % numAct: The maximum number of activatory inputs that each node can have. 
    % numInhib: The maximum number of inhibitory inputs that each node can have.
    
% Output:
    % net: The netSize x netSize connection matrix of the genrated network.
         % The orientation of the connection matrix is as follows:
            % If row i and column j is nonzero, this means that node i has an incoming edge from node j where i ~= j.
    
% Assumptions:
    % Each intermediate node can have at most numAct + numInhib incoming edges.
    
    % Each intermediate node has at least one activator and at most numAct activators.
    
    % The intermediate nodes can have either none or at most numInhib inhibitors.
    
    % The network does not connect self-cycle.
    
    % The output nodes do not have outgoing edges.

    

%%    
    net = zeros(netSize, netSize);
    %% Generate the feedworward network first:
    for i = numInput + 1:netSize
        
        % The number of activators of node i is generated based on numAct as well as the number of upstream molecules (i-1) 
        if i - 1 < numAct
            nA = randi([1 i-1],1); % nA is the randomly-generated number of activators node i has
        else
            nA = randi([1 numAct],1);
        end
        
        % The number of inhibitors of node i is generated based on numInhib as well as the remaining nodes that were not assigned as activators ((i-1) - nA) 
        if ((i - 1) - nA > 0) && ((i - 1) - nA < numInhib) 
            nI = randi([0 ((i - 1) - nA)],1); % nI is the randomly-generated number of inhibitors node i has
        elseif (i - 1) - nA >= numInhib
            nI = randi([0 numInhib],1);
        else
            nI = 0;
        end
        
        % The outputs cannot have any outgoing edges. 
        if i <= netSize - numOutput
            inputIndices = 1:i-1;
        else
            inputIndices = 1:netSize - numOutput;
        end
        
        indIncomingAct = randperm(length(inputIndices),nA);
        
        inputIndices(indIncomingAct) = [];
        inhibPerm = randperm(length(inputIndices),nI);
        indIncomingInhib = inputIndices(inhibPerm);
        
        net(i,indIncomingAct) = 1; % The entry 1 is for the activatory inputs
        net(i,indIncomingInhib) = -1; % The entry -1 is for the inhibitory inputs
        
    end
    
    %% Add the feedback interactions:
    if(numFeedback > 0)
        if(min(sort([numInput + 1, netSize - numOutput - 1])) <= numInput || max(sort([numInput + 1, netSize - numOutput - 1])) >= netSize - numOutput)
            warning('The network size was not ptoperly selected! There is either no intermedite node or just one intermediate node. So feedback has not been added!');
        else
            fbReceivingNodes = randi(sort([numInput + 1, netSize - numOutput - 1]),1,numFeedback);

            for i = 1:numFeedback

                node = fbReceivingNodes(1,i);

                % Pick the type of the interaction to be added:
                edgeType = [-1, 1]; % -1: inibitor, 1: activator
                idx_temp = randperm(length(edgeType),1);
                edge = edgeType(idx_temp);

                % Pick the node initiating the feedback:
                fbInitiatingNode = randi([node + 1, netSize - numOutput],1);

                net(node,fbInitiatingNode) = edge;

            end
        end
    end
        
end