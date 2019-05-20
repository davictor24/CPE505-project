function demod=demodulation(length_frame,signal,bit,r1,r2,h1,h2)
    demod=zeros(1,length_frame);

    % Computation of the Euclidean distance between the received signal and the 8
    % possible 8-PSK signals. Note that the receiver knows the value of the fading
    % samples h1 and h2.

    for ii=1:length_frame/3
        a=r1(ii);
        b=r2(ii);
        distance=zeros(1, 8);
        for jj=1:8
            c=h1(ii)*real(signal(jj));
            d=h2(ii)*imag(signal(jj));
            distance(jj)=(a-c)^2+(b-d)^2;
        end

        % The signal closest to the received signal is chosen
        closest=find(distance==min(distance));

        % The corresponding bits are “extracted”
        demod(1,3*(ii-1)+1)=bit(1,closest);
        demod(1,3*(ii-1)+2)=bit(2,closest);
        demod(1,3*(ii-1)+3)=bit(3,closest);
    end
end