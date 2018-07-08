% code for contrast stretching
clear all;
a=imread('cameraman.tif');
[rows,columns]=size(a);
%0<=r<=a , a=50
%a<r<=b,b=200
%b<r
a=double(a);
x1=50;
x2=200;
y1=70;
y2=150;
for i=1:rows
    for j=1:columns
%         disp(a(i,j));
        if a(i,j)<= x1
            b(i,j)=(y1/x1)*a(i,j);
        elseif a(i,j)>x1 & a(i,j)<=x2
            b(i,j)=((y2-y1)/(x2-x1))*(a(i,j)-x1)+y1;
        else
            b(i,j)= ((255-y2)/(255-x2))*(a(i,j)-x2)+y2;
        end
    end
end    
figure;
subplot(1,2,1);
imshow(uint8(a));
title('Original Image');
subplot(1,2,2);
imshow(uint8(b));
title('Contrast Stretching');
figure;
x=[0,x1,x2,255];
y=[0,y1,y2,255];
plot(x,y);
title('contrast stretching function');
axis([0,255,0,255]);
xlabel('Input Intensity Value');
ylabel('Output Intensity Value');