# Random Signaling Network Generator
A MATLAB application that generates random intracellular signaling networks based on user-defined network size and the assumptions listed below. The purpose of this app is to allow the researchers to generate a random signaling network of a size of their choice and test their methodologies/hypothesies on it. Once the network is generated, user can see the graphical model of the network, connection matrix of the random network, and list of generated regulatory expressions, which can be saved to a file accordingly.

# The folder contains two source files:
1. RandSigNet_GeneratorApp.mlapp: Generates the interface for the application.
2. RandSigNet_Source.m: The source file that generates the random signaling network.

# User defined parameters in the application:
1. netSize: Size of the network, i.e., the number of nodes. 
2. numInput: The number of input nodes that the generated network is requested to have.
3. numOutput: The number of output nodes that the generated network is requested to have.
4. numFeedback: The maximum number of feedback interactions that the generated network is requested to have.
5. numAct: The maximum number of activatory inputs that each node can have. 
6. numInhib: The maximum number of inhibitory inputs that each node can have.
    
# Assumptions:
1. Each intermediate node can have at most numAct + numInhib incoming edges.
2. Each intermediate node has at least one activator and at most numAct activators.
3. The intermediate nodes can have either none or at most numInhib inhibitors.
4. The network does not have self-cycles.
5. The output nodes do not have outgoing edges.

# How to run?
To run the app, download both RandSigNet_GeneratorApp.mlapp and RandSigNet_Source.m to the same directory, and open RandSigNet_GeneratorApp.mlapp, which will bring the following screen. Then you are good to go!

### Welcome screen:
<img width="896" alt="RandSigNetGenApp" src="https://user-images.githubusercontent.com/17510066/132160686-bbb2aa7c-ab9c-4f90-bdaa-0a10cc2c9923.png">

### Example of a generated random network:
A network with the total number of nodes = 10 (network size) is generated with the constraints 
1. There are exactly two imput nodes,
2. There is exactly one output node,
3. There is exactly one feedback interaction (Inhibitory interaction from INT7 to INT3 in this example),
4. Each individual intermediate nodes can have at most two activatory and two inhibitory interactions.

<img width="896" alt="An example of generated network" src="https://user-images.githubusercontent.com/17510066/218341600-12a38089-e070-4c4b-9488-ab4c148fd529.png">

### The network connection matrix of the generated random network
<img width="896" alt="Network connection matrix" src="https://user-images.githubusercontent.com/17510066/218341628-17449147-00f5-41cd-bdc1-ba0729cf6363.png">

### The list of regulatory interactions of the generated random network 
<img width="896" alt="Network regulatory interactions" src="https://user-images.githubusercontent.com/17510066/218341668-b31ed212-7211-4fe9-8327-8ba3a9dab8e2.png">
