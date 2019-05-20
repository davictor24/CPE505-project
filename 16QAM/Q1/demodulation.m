function demod=demodulation(length_frame,signal,bit,snr,nsdec,r1,r2,h1,h2)
    demod=zeros(1,2*length_frame);
    variance=(5/3)*(10^(-0.1*snr));

    for ii=1:length_frame/3
        a=r1(ii);
        b=r2(ii);
        x0=zeros(1, 4);
        x1=zeros(1, 4);
        x=zeros(1, 4);
        s=zeros(1, 4); 
        
        % De-mapping algorithm, using LLR (log-likelihood ratio)
        
        for jj=1:16
            c=h1(ii)*real(signal(jj));
            d=h2(ii)*imag(signal(jj));
            for kk=1:4
               bit_kk = bit(kk, jj);
               if bit_kk == 0
                   x0(1,kk) = x0(1,kk) + exp(-((a-c)^2+(b-d)^2)/(2*variance));
               else
                   x1(1,kk) = x1(1,kk) + exp(-((a-c)^2+(b-d)^2)/(2*variance));
               end
            end
        end
        
        for kk=1:4
            x(1,kk) = (variance/2)*log(x0(1,kk)/x1(1,kk));
            s(1,kk) = round((2^(nsdec-1))-(x(1,kk)*(2^(nsdec-5))));
            if s(1,kk) < 0
                s(1,kk) = 0; 
            elseif s(1,kk) > (2^nsdec) - 1
                s(1,kk) = (2^nsdec) - 1;
            end
        end

        demod(1,6*(ii-1)+1)=s(1,1);
        demod(1,6*(ii-1)+2)=s(1,2);
        demod(1,6*(ii-1)+3)=2^(nsdec-1);
        demod(1,6*(ii-1)+4)=s(1,3);
        demod(1,6*(ii-1)+5)=s(1,4);
        demod(1,6*(ii-1)+6)=2^(nsdec-1);
    end
end