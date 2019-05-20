function [signal,bit]=constellation()
    % Definition of the constellation and mapping

    signal(1)=1+1i*1;
    bit(1,1)=1;
    bit(2,1)=1;
    bit(3,1)=0;
    bit(4,1)=0;
    
    signal(2)=3+1i*1;
    bit(1,2)=1;
    bit(2,2)=1;
    bit(3,2)=0;
    bit(4,2)=1;
    
    signal(3)=1+1i*3;
    bit(1,3)=1;
    bit(2,3)=1;
    bit(3,3)=1;
    bit(4,3)=0;
    
    signal(4)=3+1i*3;
    bit(1,4)=1;
    bit(2,4)=1;
    bit(3,4)=1;
    bit(4,4)=1;
    
    signal(5)=-1+1i*1;
    bit(1,5)=1;
    bit(2,5)=0;
    bit(3,5)=0;
    bit(4,5)=0;
    
    signal(6)=-3+1i*1;
    bit(1,6)=1;
    bit(2,6)=0;
    bit(3,6)=0;
    bit(4,6)=1;
    
    signal(7)=-1+1i*3;
    bit(1,7)=1;
    bit(2,7)=0;
    bit(3,7)=1;
    bit(4,7)=0;

    signal(8)=-3+1i*3;
    bit(1,8)=1;
    bit(2,8)=0;
    bit(3,8)=1;
    bit(4,8)=1;
    
    signal(9)=-1-1i*1;
    bit(1,9)=0;
    bit(2,9)=0;
    bit(3,9)=0;
    bit(4,9)=0;
    
    signal(10)=-3-1i*1;
    bit(1,10)=0;
    bit(2,10)=0;
    bit(3,10)=0;
    bit(4,10)=1;
    
    signal(11)=-1-1i*3;
    bit(1,11)=0;
    bit(2,11)=0;
    bit(3,11)=1;
    bit(4,11)=0;
    
    signal(12)=-3-1i*3;
    bit(1,12)=0;
    bit(2,12)=0;
    bit(3,12)=1;
    bit(4,12)=1;
    
    signal(13)=1-1i*1;
    bit(1,13)=0;
    bit(2,13)=1;
    bit(3,13)=0;
    bit(4,13)=0;
    
    signal(14)=3-1i*1;
    bit(1,14)=0;
    bit(2,14)=1;
    bit(3,14)=0;
    bit(4,14)=1;
    
    signal(15)=1-1i*3;
    bit(1,15)=0;
    bit(2,15)=1;
    bit(3,15)=1;
    bit(4,15)=0;
    
    signal(16)=3-1i*3;
    bit(1,16)=0;
    bit(2,16)=1;
    bit(3,16)=1;
    bit(4,16)=1;
end