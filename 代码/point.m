x = (0:7)';                    % Integer input
%y1 = qammod(x,8,'bin');        % 16-QAM output
y1 = genqammod(x,[-1-1j, -1+1j, -1-3j, -1+3j, 1-1j, 1+1j, 1-3j, 1+3j]);

scatterplot(y1)
text(real(y1)+0.1, imag(y1), dec2bin(x,4))
title('16-QAM-Refine, Binary Symbol Mapping')
axis([-4 4 -4 4])