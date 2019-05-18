function [r1,r2,h1,h2]=transmission(length_frame,signal,bit,snr,msg)
    sd=sqrt(10^(-0.1*snr)/6);
    r1=zeros(1,length_frame/3);
    r2=zeros(1,length_frame/3);
    h1=zeros(1,length_frame/3);
    h2=zeros(1,length_frame/3);

    % Serial-to-parallel conversion (1:3)
    for ii=1:length_frame/3
        a=msg(3*(ii-1)+1);
        b=msg(3*(ii-1)+2);
        c=msg(3*(ii-1)+3);

        % Selection of the transmitted signal (mapping)
        for jj=1:8
            e=bit(1,jj);
            f=bit(2,jj);
            g=bit(3,jj);
            if ((a==e)&&(b==f)&&(c==g))
                transmitted=signal(jj);
            end
        end

        % Generation of the complex AWGN samples
        noise=sd*randn(1)+1i*sd*randn(1);

        % Generation of the fading samples h1 and h2
        % (1) For AWGN channels
        h1(ii)=1;
        h2(ii)=1;

        % (2) For Rayleigh fading channels
        % noise1=sqrt(0.5)*randn(1);
        % noise2=sqrt(0.5)*randn(1);
        % h1(ii)=sqrt(noise1^2 + noise2^2);
        % noise1=sqrt(0.5)*randn(1);
        % noise2=sqrt(0.5)*randn(1);
        % h2(ii)=sqrt(noise1^2 + noise2^2);

        % Expression of the received signal as a function of the transmitted signal
        r1(ii)=h1(ii)*real(transmitted) + real(noise);
        r2(ii)=h2(ii)*imag(transmitted) + imag(noise);
    end
end