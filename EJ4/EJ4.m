%%
% 
%  PRACTICO 4
% 
%Nombre: Suarez Facundo
clc,clear all,close all,
%% 
%EJERCICIO 4
i=imread('4.tif');
[r,c]=size(i);
%h=fspecial('sobel');
h=[-1 -2 -1;0 0 0;1 2 1];
ifilt=imfilter(i,h);
H=fft2(double(h),r,c);
I=fft2(double(i),r,c);
IF=H.*I;
ifilt=real(ifft2(IF));
ifilt=uint8(ifilt);
figure,imshow(ifilt,[])
