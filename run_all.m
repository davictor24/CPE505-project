run('8PSK\main.m')
run('16QAM\Q1\main.m')
run('16QAM\Q2\main.m')

legend('Uncoded 8-PSK over AWGN (hard-decision)','16-QAM over AWGN (soft-decision)','16-QAM over Rayleigh fading (soft-decision)');
axis([2 16 10^-5 1]);
xlabel('Eb/N0 - dB');
ylabel('BER');
title('BER against SNR for different modulation schemes');
grid on;