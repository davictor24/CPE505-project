function [signal,bit]=constellation()
    % Definition of the constellation and mapping

    signal(1)=1;
    bit(1,1)=1;
    bit(2,1)=1;
    bit(3,1)=1;

    signal(2)=0.7071+1i*0.7071;
    bit(1,2)=0;
    bit(2,2)=1;
    bit(3,2)=1;

    signal(3)=1i;
    bit(1,3)=0;
    bit(2,3)=1;
    bit(3,3)=0;

    signal(4)=-0.7071+1i*0.7071;
    bit(1,4)=0;
    bit(2,4)=0;
    bit(3,4)=0;

    signal(5)=-1;
    bit(1,5)=0;
    bit(2,5)=0;
    bit(3,5)=1;

    signal(6)=-0.7071-1i*0.7071;
    bit(1,6)=1;
    bit(2,6)=0;
    bit(3,6)=1;

    signal(7)=-1i;
    bit(1,7)=1;
    bit(2,7)=0;
    bit(3,7)=0;

    signal(8)=0.7071-1i*0.7071;
    bit(1,8)=1;
    bit(2,8)=1;
    bit(3,8)=0;
end