function [ result ] = edgefeature( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% imA°üÀ¨pic,no,person,feature,edgefeat¡£person°üÀ¨patchNum,data{n,2}£¬num£¬patch{n,pN,2},patchfeature{n,pN},feature{n}
%
result=zeros(21,nchoosek(img.person.num,2)*img.person.patchNum^2);
counter=1;
pN=img.person.patchNum;
for i=1:img.person.num
    %     m=round(img.person.patch{i,1,1}(1)+img.person.patch{i,1,2}(1)/2);
    %     n=round(img.person.patch{i,1,1}(2)+img.person.patch{i,1,2}(2)/2);
    for j=1:pN
        m=round(img.person.patch{i,j,1}(1)+img.person.patch{i,j,2}(1)/2);
        n=round(img.person.patch{i,j,1}(2)+img.person.patch{i,j,2}(2)/2);
        for k=(i+1):img.person.num
%             x=round(img.person.patch{k,1,1}(1)+img.person.patch{k,1,2}(1)/2);
%             y=round(img.person.patch{k,1,1}(2)+img.person.patch{k,1,2}(2)/2);
            for b=1:pN
                x=round(img.person.patch{k,b,1}(1)+img.person.patch{k,b,2}(1)/2);
                y=round(img.person.patch{k,b,1}(2)+img.person.patch{k,b,2}(2)/2);
                %tmp=(0.0001+img.person.patchfeature{i,j})./(0.0001+img.person.patchfeature{k,b});
                result(:,counter)=[(i-1)*pN+j;(k-1)*pN+b;angleFeat([m,n],[x,y]);lenFeat(img.pic,[m,n],[x,y])];%(tmp+1./tmp)];
                counter=counter+1;
            end
        end
    end
end
%    imgSetA{1,c}.feature=[imgSetA{1,c}.feature,imgSetA{1,i}.edgefeat];
end

