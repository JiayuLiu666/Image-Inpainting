clear all; clc

z1 = im2double(imread('cameraman_contaminated.png'));
z2 = im2double(imread('barbara_contaminated.png'));
inpt=input('cameraman_contaminated for 1, barbara_contaminated for 2.  please input a number:','s');
%initialize a mask for sampling
if inpt=='1'
    z=z1;
    mask = (z<=0.99);
else
    z=z2;
    mask = (z>=0.09);
end
%calcualte the observed image
y =  z.*mask ;
%parameters
lambda = 0.0002;      %调整1  范围
%optional parameters
opts.rho     = 1;   %调整2  力度
opts.gamma   = 1;
opts.max_itr = 200;    %调整3  循环数
opts.print   = true;
tic
out = PlugPlayADMM_inpaint(y,mask,lambda,'TV',opts);


toc
%display
figure;
subplot(121);
imshow(z);
title('Input');
subplot(122);
imshow(out);
title('Output');