function [r1,r2,h1,h2]=transmission(length_frame,signal,bit,snr,coded)
    sd=sqrt((5/3)*(10^(-0.1*snr)));
    r1=zeros(1,length_frame/3);
    r2=zeros(1,length_frame/3);
    h1=zeros(1,length_frame/3);
    h2=zeros(1,length_frame/3);
    
    % Serial-to-parallel conversion (1:4)
    for ii=1:length_frame/3
        a=coded(4*(ii-1)+1);
        b=coded(4*(ii-1)+2);
        c=coded(4*(ii-1)+3);
        d=coded(4*(ii-1)+4);

        % Selection of the transmitted signal (mapping)
        for jj=1:16
            e=bit(1,jj);
            f=bit(2,jj);
            g=bit(3,jj);
            h=bit(4,jj);
            if((a==e)&&(b==f)&&(c==g)&&(d==h))
                transmitted=signal(jj);
            end
        end

        % Generation of complex AWGN samples
        noise=sd*randn(1)+1i*sd*randn(1);
        
        % Generation of the fading samples h1 and h2
        % For AWGN channels
        h1(ii)=1;
        h2(ii)=1;

        % Expression of the received signal as a function of the transmitted signal
        r1(ii)=h1(ii)*real(transmitted) + real(noise);
        r2(ii)=h2(ii)*imag(transmitted) + imag(noise);
    end
end