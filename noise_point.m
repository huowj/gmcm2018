
M = 8;                     % Size of signal constellation
k = log2(M);                % Number of bits per symbol
n = 30000;                  % Number of bits to process
numSamplesPerSymbol = 1;    % Oversampling factor

rng default                 % Use default random number generator
dataIn = randi([0 1],n,1);  % Generate vector of binary data

dataInMatrix = reshape(dataIn,length(dataIn)/k,k);   % Reshape data into binary k-tuples, k = log2(M)
dataSymbolsIn = bi2de(dataInMatrix);                 % Convert to integers

%dataMod = qammod(dataSymbolsIn,M,'bin');         % Binary coding, phase offset = 0
%dataModG = qammod(dataSymbolsIn, M); % Gray coding, phase offset = 0
%dataMod = genqammod(dataSymbolsIn,[-1+1j,1+1j,-1-1j,1-1j,-3+0j,3j,-3j,3]);
%dataMod = qammod(dataSymbolsIn,M,[3 0 2 1]);
dataMod = genqammod(dataSymbolsIn,[-1-1j, -1+1j, -1-3j, -1+3j, 1-1j, 1+1j, 1-3j, 1+3j]);

EbNo = 20;
snr = EbNo + 10*log10(k) - 10*log10(numSamplesPerSymbol);
receivedSignal = awgn(dataMod,snr,'measured');
receivedSignalG = awgn(dataModG,snr,'measured');

sPlotFig = scatterplot(receivedSignal,1,0,'g.');
hold on
scatterplot(dataMod,1,0,'k*',sPlotFig)