%%
% 
%  PRACTICO 4
% 
%Nombre: Suarez Facundo
clc,clear all,close all,
%% 
%EJERCICIO 2
i=imread('2.tif');
i=rgb2gray(i);
[r,c]=size(i);
I=fft2(i);
IC=fftshift(I);



%a
freq1=70;
freq2=110;
F1=lpfilter('gaussian',r,c,freq1);
F2=lpfilter('gaussian',r,c,freq2);
F3=lpfilter('btw',r,c,freq1);
F4=lpfilter('btw',r,c,freq2);
F5=lpfilter('ideal',r,c,freq1);
F6=lpfilter('ideal',r,c,freq2);

I1=I.*F1;I2=I.*F2;I3=I.*F3;I4=I.*F4;I5=I.*F5;I6=I.*F6;

i1=real(ifft2(I1));i2=real(ifft2(I2));i3=real(ifft2(I3));i4=real(ifft2(I4));
i5=real(ifft2(I5));i6=real(ifft2(I6));

i1=uint8(i1);i2=uint8(i2);i3=uint8(i3);i4=uint8(i4);i5=uint8(i5);
i6=uint8(i6);

%b
G=2;
H1=G.*F1;H2=G.*F2;H3=G.*F3;H4=G.*F4;H5=G.*F5;H6=G.*F6;

IG1=I.*H1;IG2=I.*H2;IG3=I.*H3;IG4=I.*H4;IG5=I.*H5;IG6=I.*H6;

ig1=real(ifft2(IG1));ig2=ifft2(IG2);ig3=ifft2(IG3);ig4=ifft2(IG4);
ig5=ifft2(IG5);ig6=ifft2(IG6);


ig1=uint8(ig1);ig2=uint8(ig2);ig3=uint8(ig3);ig4=uint8(ig4);
ig5=uint8(ig5);ig6=uint8(ig6);

h1=imhist(ig1);
h2=imhist(ig2);h3=imhist(ig3);h4=imhist(ig4);
h5=imhist(ig5);h6=imhist(ig6);


figure,
subplot(3,2,1),plot(h1),xlim([0 255]),title('Hist 1'),
subplot(3,2,2),plot(h2),xlim([0 255]),title('Hist 2'),
subplot(3,2,3),plot(h3),xlim([0 255]),title('Hist 3'),
subplot(3,2,4),plot(h4),xlim([0 255]),title('Hist 4'),
subplot(3,2,5),plot(h5),xlim([0 255]),title('Hist 5'),
subplot(3,2,6),plot(h6),xlim([0 255]),title('Hist 6'),

ig1=histeq(ig1,h1);ig2=histeq(ig2,h2);ig3=histeq(ig3,h3);
ig4=histeq(ig4,h4);
ig5=histeq(ig5,h5);ig6=histeq(ig6,h6);


ig1=uint8(ig1);ig2=uint8(ig2);ig3=uint8(ig3);ig4=uint8(ig4);
ig5=uint8(ig5);ig6=uint8(ig6);

h1=imhist(ig1);h2=imhist(ig2);h3=imhist(ig3);h4=imhist(ig4);
h5=imhist(ig5);h6=imhist(ig6);


figure,
subplot(3,2,1),plot(h1),xlim([0 255]),title('Hist 1'),
subplot(3,2,2),plot(h2),xlim([0 255]),title('Hist 2'),
subplot(3,2,3),plot(h3),xlim([0 255]),title('Hist 3'),
subplot(3,2,4),plot(h4),xlim([0 255]),title('Hist 4'),
subplot(3,2,5),plot(h5),xlim([0 255]),title('Hist 5'),
subplot(3,2,6),plot(h6),xlim([0 255]),title('Hist 6'),


