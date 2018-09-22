M = 16;                  
k = log2(M);            
n = 300000;              
numSamplesPerSymbol = 1;  
rng default
dataIn = randi([0 1],n,1);

dataInMatrix = reshape(dataIn,length(dataIn)/k,k);   
dataSymbolsIn = bi2de(dataInMatrix);                 
dataModR = qammod(dataSymbolsIn,M,[11 9 8 10 3 1 0 2 7 5 4 6 15 13 12 14]);

fid = fopen('test_16_qam.txt','w');

for ii = 0:0.05:20
    snr = ii;
    receivedSignal = awgn(dataModR,snr,'measured');
    dataSymbolsOut = qamdemod(receivedSignal,M,[11 9 8 10 3 1 0 2 7 5 4 6 15 13 12 14]);
    dataOutMatrix = de2bi(dataSymbolsOut,k);
    dataOut = dataOutMatrix(:);

    [numErrors,ber] = biterr(dataIn,dataOut);
    fprintf(fid,'%d,%5.2e \n', ii,ber);
end
fclose(fid);   
