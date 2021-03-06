function [net, tr] = create_neural_network(inputs, targets)
% Generate a neural network for distinguishing between different types of
% emissions
% 
% This function is general, but represents the settings that I used with
% the neural network GUI to get a network that performs with ~92% accuracy
% using the nprtool neural network pattern fitting tool

% By Daniel Golden (dgolden1 at stanford dot edu) September 2010
% $Id$

% Autogenerated by nprtool

% Create Network
numHiddenNeurons = 20;  % Adjust as desired
net = newpr(inputs,targets,numHiddenNeurons);
net.divideParam.trainRatio = 70/100;  % Adjust as desired
net.divideParam.valRatio = 15/100;  % Adjust as desired
net.divideParam.testRatio = 15/100;  % Adjust as desired

% net.trainParam.max_fail = 20;

% Train and Apply Network
[net,tr] = train(net,inputs,targets);
outputs = sim(net,inputs);

% Plot
plotperf(tr)
plotconfusion(targets(tr.trainInd), outputs(tr.trainInd), 'Main', ...
  targets(tr.valInd), outputs(tr.valInd), 'Validation', ...
  targets(tr.testInd), outputs(tr.testInd), 'Test', ...
  targets, outputs, 'Total');
