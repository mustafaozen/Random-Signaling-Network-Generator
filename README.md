# Random Signaling Network Generator
A MATLAB application that generates random intracellular signaling networks based on user-defined network size and the assumptions listed below. The purpose of this app is to allow the researchers to generate a random signaling network of a size and test their methodologies on it. Once the network is generated, user can see the graphical model of the network, connection matrix of the random network, and list of generated regulatory expressions, which can be saved to a file accordingly.

# The folder contains two source files:
1. RandSigNet_GeneratorApp.mlapp: Generates the interface for the application.
2. RandSigNet_Source.m: The source file that generates the random signaling network.

# User defined parameters in the application:
1. netSize: Size of the network 
2. numInput: The number of input nodes that the generated network is requested to have.
3. numOutput: The number of output nodes that the generated network is requested to have.
4. numFeedback: The maximum number of feedback interactions that the generated network is requested to have.
5. numAct: The maximum number of activatory inputs that each node can have. 
6. numInhib: The maximum number of inhibitory inputs that each node can have.
    
# Assumptions:
1. Each intermediate node can have at most numAct + numInhib incoming edges.
2. Each intermediate node has at least one activator and at most numAct activators.
3. The intermediate nodes can have either none or at most numInhib inhibitors.
4. The network does not connect self-cycle.
5. The output nodes do not have outgoing edges.
