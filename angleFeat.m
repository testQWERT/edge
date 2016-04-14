function [ result ] = angleFeat( c1,c2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
divider=10;
cosab=dot(c1,c2)/(norm(c1)*norm(c2));
angle=rad2deg(acos(cosab));
center=ceil(angle/divider);
result=zeros(round(180/divider),1);
for i=1:round(180/divider)
        switch abs(center-i)
            case {2,round(180/divider)-2}
                result(i)=0.0439;
            case {1,round(180/divider)-1}
                result(i)=0.4578;
            case 0
                result(i)=1;
            otherwise 
        end
end
end

