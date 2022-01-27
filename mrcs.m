

function [ f,u]=mrcs(img,n,M)
% function taking input as image and two parameters n=no. of signatures and M=no. of paritions
 
m=d/n;
count=1;
for r=m:m:d
                  x = circleCenterX + r * sin(t);
	y = circleCenterY + r * cos(t); 
    bw = poly2mask(x,y,256,256); % considering n circles with different radii
boundaries = bwboundaries(bw);
thisBoundary = boundaries{1};
x1=thisBoundary(:,2);
y1=thisBoundary(:,1);
indexes = y1<circleCenterY;  
xTop = x1(indexes);
yTop = y1(indexes); 
profile=zeros(1,length(xTop));
for l=1:length(xTop ) 
profile(l) = Y(yTop(l),xTop(l)); %storing circumference pixel values in diffent profiles with respect to each radius

end

p{k,count}=profile;
[A{k,count}, B{k,count}]=findpeaks(p{k,count}); %counting no. of zero to one transitions/ peak values
u{k,count}=numel(A{k,count});



 A=cell(numImages,10);
 B{k,count}=profile;
 A=B;
N = cellfun(@numel, A); 
newN = M * ceil(N / M);
padfun = @(k) [A{k} zeros(1, newN(k) - N(k))] ; % padding is done to make each array of same size
C2 = arrayfun(padfun, 1:numel(A) , 'un', 0) ;
C2 = reshape(C2, size(A));
len{k,count}=length(C2{k,count});
partnum= floor(1+(0:len{k,count}-1)/len{k,count}*M);
n1{k,count} = accumarray(partnum(:),C2{k,count}(:)==1);
n2{k,count}=n1{k,count}.';
n= accumarray(partnum(:),1); 
o=n.';

f{k,count}=n2{k,count}./o; %counting no. of occurrence of 1's in each paritions
count=count+1;



end