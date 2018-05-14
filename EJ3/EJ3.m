%%
% 
%  PRACTICO 4
% 
%Nombre: Suarez Facundo
clc,clear all,close all,
%% 
%EJERCICIO 3
i=imread('3.tif');
%i=rgb2gray(i);
[r,c]=size(i);
I=fft2(i);
IC=fftshift(I);
freq1=90;freq2=245;
A=2;G=2;

Fideal=lpfilter('ideal',r,c,freq1);
HPideal=A+G.*Fideal;

Fgauss=lpfilter('gaussian',r,c,freq1);
HPgauss=A+G.*Fgauss;

Fbtw=lpfilter('btw',r,c,freq1);
HPbw=A+G.*Fbtw;

IF1=I.*HPideal;IF2=I.*HPgauss;IF3=I.*HPbw;

if1=real(ifft2(IF1));if1=uint8(if1);
if2=real(ifft2(IF2));if2=uint8(if2);
if3=real(ifft2(IF3));if3=uint8(if3);


F2ideal=lpfilter('ideal',r,c,freq2);
HP2ideal=A+G.*F2ideal;

F2gauss=lpfilter('gaussian',r,c,freq2);
HP2gauss=A+G.*F2gauss;

F2btw=lpfilter('btw',r,c,freq2);
HP2bw=A+G.*F2btw;

IF4=I.*HP2ideal;IF5=I.*HP2gauss;IF6=I.*HP2bw;

if4=real(ifft2(IF4));if4=uint8(if4);
if5=real(ifft2(IF5));if2=uint8(if5);
if6=real(ifft2(IF6));if3=uint8(if6);

figure,subplot(3,2,1),imshow(if1,[]),title('I filtrada ideal freq1'),
subplot(3,2,2),imshow(if2,[]),title('I filtrada gauss freq1'),
subplot(3,2,3),imshow(if3,[]),title('I filtrada btw freq1'),
subplot(3,2,4),imshow(if4,[]),title('I filtrada ideal freq2'),
subplot(3,2,5),imshow(if5,[]),title('I filtrada ideal freq2'),
subplot(3,2,6),imshow(if6,[]),title('I filtrada ideal freq2'),



figure,subplot(3,2,1),mesh(log(1+abs(fftshift(HPideal)))),title('I filtrada ideal freq1'),
subplot(3,2,2),mesh(log(1+abs(fftshift(HPgauss)))),title('I filtrada gauss freq1'),
subplot(3,2,3),mesh(log(1+abs(fftshift(HPbw)))),title('I filtrada btw freq1'),
subplot(3,2,4),mesh(log(1+abs(fftshift(HP2ideal)))),title('I filtrada ideal freq2'),
subplot(3,2,5),mesh(log(1+abs(fftshift(HP2gauss)))),title('I filtrada gauss freq2'),
subplot(3,2,6),mesh(log(1+abs(fftshift(HP2bw)))),title('I filtrada btw freq2'),