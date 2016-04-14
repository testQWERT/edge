function [ result ] = lenFeat(img,c1,c2 )
%UNTITLED4 Summary of this function goes here
% imA包括pic,no,person,feature,edgefeat,wN,wE。person包括patchNum,data{n,2}，num，patch{n,pN,2},patchfeature{n,pN},feature{n}
%   Detailed explanation goes here
[m,n,~]=size(img.pic);
tmp=0;
for i=1:img.person.num
    tmp=tmp+img.person.data{i,2}(2);
end
tmp=tmp/img.person.num/1.7;  %姑且认为人的平均身高为1.7米，利用这一点来计算每米包含多少个像素。
lt=sqrt((c1(1)-c2(1))^2+(c1(2)-c2(2))^2);
b=log10(tmp*8);
a=log10(tmp*0.3);% 从0.3到8米之间按照对数分布化成10等分
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

