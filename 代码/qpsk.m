M = 4;
k = log2(M);
n = 300000;
numSamplesPerSymbol = 1;    

rng default 
dataIn = randi([0 1],n,1);
 
dataInMatrix = reshape(dataIn,length(dataIn)/k,k);
dataSymbolsIn = bi2de(dataInMatrix);                
dataModR = qammod(dataSymbolsIn,M,[3 0 2 1]);

fid = fopen('test_qpsk.txt','w');

for ii = 0:0.05:20
    snr = ii;
    receivedSignal = awgn(dataModR,snr,'measured');
    dataSymbolsOut = qamdemod(receivedSignal,M,[3 0 2 1]);
    dataOutMatrix = de2bi(dataSymbolsOut,k);
    dataOut = dataOutMatrix(:);                 

    [numErrors,ber] = biterr(dataIn,dataOut);
    fprintf(fid,'%d,%5.2e \n', ii,ber);
end
fclose(fid);