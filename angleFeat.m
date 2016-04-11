function [ result ] = angleFeat( c1,c2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
cosab=dot(c1,c2)/(norm(c1)*norm(c2));
angle=rad2deg(acos(cosab));
center=ceil(angle/20);
result=zeros(9,1);
for i=1:9
        switch abs(center-i)
            case {2,7}
                result(i)=0.0439;
            case {1,8}
                result(i)=0.4578;
            case 0
                result(i)=1;
            otherwise 
        end
end
end

