function demod=demodulation(length_frame,signal,bit,r1,r2,h1,h2)
    demod=zeros(1,length_frame);
    
    % Computation of the Euclidean distance between the received signal and
    % the 16 possible 16-QAM signals. Note that the receiver knows the value 
    % of the fading samples h1 and h2.
    
    for ii=1:length_frame/3
        a=r1(ii);
        b=r2(ii);
        distance=zeros(1, 16);
        for jj=1:16
            c=h1(ii)*real(signal(jj));
            d=h2(ii)*imag(signal(jj));
            distance(jj)=(a-c)^2+(b-d)^2;
        end
        
        % The signal closest to the received signal is chosen
        closest=find(distance==min(distance));

        % The corresponding bits are “extracted”
        demod(1,4*(ii-1)+1)=bit(1,closest);
        demod(1,4*(ii-1)+2)=bit(2,closest);
        demod(1,4*(ii-1)+3)=bit(3,closest);
        demod(1,4*(ii-1)+4)=bit(4,closest);
    end
end