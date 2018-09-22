M = 8;                     
k = log2(M);               
n = 300000;                  
rng default                 
dataIn = randi([0 1],n,1); 


dataInMatrix = reshape(dataIn,length(dataIn)/k,k);   
dataSymbolsIn = bi2de(dataInMatrix);                 
dataModR = genqammod(dataSymbolsIn,[-1-1j, -1+1j, -1-3j, -1+3j, 1-1j, 1+1j, 1-3j, 1+3j]);

fid = fopen('test_16_qam_refine.txt','w');

for ii = 0:0.05:20
    snr = ii;
    receivedSignal = awgn(dataModR,snr,'measured');
    dataSymbolsOut = genqamdemod(receivedSignal,[-1-1j, -1+1j, -1-3j, -1+3j, 1-1j, 1+1j, 1-3j, 1+3j]);
    dataOutMatrix = de2bi(dataSymbolsOut,k);
    dataOut = dataOutMatrix(:);

    [numErrors,ber] = biterr(dataIn,dataOut);
    fprintf(fid,'%d,%5.2e \n', ii,ber);
end
fclose(fid);  
