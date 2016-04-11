function [ result ] = lenFeat(img,c1,c2 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[m,n,~]=size(img);
l=sqrt(m^2+n^2);
lt=sqrt((c1(1)-c2(1))^2+(c1(2)-c2(2))^2);
b=log10(l*4/5);
a=log10(l*1/5);
%a=0;
x=logspace(a,b,10);
result=zeros(10,1);
if x(10)<lt
    result(10)=1;result(9)=0.4578;result(8)=0.0439;
elseif x(1)>lt
    result(1)=1;result(2)=0.4578;result(3)=0.0439;
else
    for i=1:10
        if x(i)>=lt
            center=i-1;
            break;
        end
    end
    for i=1:10
        switch abs(center-i)
            case {2}
                result(i)=0.0439;
            case {1}
                result(i)=0.4578;
            case 0
                result(i)=1;
            otherwise
        end
    end
end
end

