% This program simulates the BER performance of 16-QAM modulation over AWGN

% Range of SNR to be tested, (snr is the SNR per info bit (Eb/N0) expressed in dB)
snr_dB=2:12;

% number of soft decision bits
nsdec = 10; 

% Number of information bits per frame
length_frame=3000;

% Number of frames
number_frames=1000;

% Total number of information bits
number_bits=length_frame*number_frames;

fprintf(' BER performance of coded 16QAM over AWGN (soft-decision)\n');
fprintf(' Number of bits per frame = %d\n',length_frame);
fprintf(' Number of frames = %d\n',number_frames);
fprintf(' Number of info bits = %d\n',number_bits);

% Constellation and Gray mapping
[signal,bit]=constellation();

% Initial result vector
BER=zeros(1,length(snr_dB));

for i=1:length(snr_dB)
    snr=snr_dB(i);
    fprintf('\n');
    fprintf('=============== SNR (in dB) = %d\n',snr_dB(i));
    fprintf('\n');

    number_errors=zeros(1, number_frames);
    for frame=1:number_frames
        % Random vector of information bits
        msg = round(rand(1,length_frame));
        
        % Definition of the convolutional code
        t = poly2trellis(3, [7 5]);
        
        % Encoding of the information bits and puncturing
        coded = convenc(msg, t, [1 1 0]);

        % Mapping and transmission through the AWGN or Rayleigh fading channel
        [r1,r2,h1,h2] = transmission(length_frame,signal,bit,snr,coded);

        % Demapping
        demod = demodulation(length_frame,signal,bit,snr,nsdec,r1,r2,h1,h2);
        
        % Viterbi decoding
        decoded = vitdec(demod, t, 100, 'trunc', 'soft', nsdec); 

        % Error count
        [number_errors(frame),ratio] = biterr(msg,decoded);
    end

    % Computation of the total number of errors and BER
    sum_errors = sum(number_errors);
    BER(i) = sum_errors/number_bits;
    fprintf('Total number of errors = %d\n',sum_errors);
    fprintf('BER = %12.8f\n',BER(i));
end

fprintf('\n\n');
plotHandle=semilogy(snr_dB,BER,'g-o');
set(plotHandle,'LineWidth',1.5);
hold on;
