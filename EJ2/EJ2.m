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
%%
%b
G=2;
H1=G.*F1;H2=G.*F2;H3=G.*F3;H4=G.*F4;H5=G.*F5;H6=G.*F6;

IG1=I.*H1;IG2=I.*H2;IG3=I.*H3;IG4=I.*H4;IG5=I.*H5;IG6=I.*H6;

ig1=real(ifft2(IG1));ig2=real(ifft2(IG2));
ig3=real(ifft2(IG3));ig4=real(ifft2(IG4));
ig5=real(ifft2(IG5));ig6=real(ifft2(IG6));


ig1=uint8(ig1);ig2=uint8(ig2);ig3=uint8(ig3);ig4=uint8(ig4);
ig5=uint8(ig5);ig6=uint8(ig6);

h1=imhist(ig1);
h2=imhist(ig2);h3=imhist(ig3);h4=imhist(ig4);
h5=imhist(ig5);h6=imhist(ig6);


figure,
subplot(3,2,1),plot(h1),xlim([0 255]),title('Hist 1 Filtro Gaussian freq1'),
subplot(3,2,2),plot(h2),xlim([0 255]),title('Hist 2 Filtro Gaussian freq2'),
subplot(3,2,3),plot(h3),xlim([0 255]),title('Hist 3 Filtro BTW freq1'),
subplot(3,2,4),plot(h4),xlim([0 255]),title('Hist 4 Filtro BTW freq2'),
subplot(3,2,5),plot(h5),xlim([0 255]),title('Hist 5 Filtro Ideal freq1'),
subplot(3,2,6),plot(h6),xlim([0 255]),title('Hist 6 Filtro Ideal freq2'),
%%
ha1=cumsum(h1);ha2=cumsum(h2);ha3=cumsum(h3);ha4=cumsum(h4);
ha5=cumsum(h5);ha6=cumsum(h6);

ig1=histeq(ig1,ha1);ig2=histeq(ig2,ha2);ig3=histeq(ig3,ha3);
ig4=histeq(ig4,ha4);ig5=histeq(ig5,ha5);ig6=histeq(ig6,ha6);

ig1=uint8(ig1);ig2=uint8(ig2);ig3=uint8(ig3);ig4=uint8(ig4);
ig5=uint8(ig5);ig6=uint8(ig6);

h1=imhist(ig1);h2=imhist(ig2);h3=imhist(ig3);h4=imhist(ig4);
h5=imhist(ig5);h6=imhist(ig6);


figure,
subplot(3,2,1),plot(h1),xlim([0 255]),title('Hist EQ 1 Filtro Gaussian G=2 freq1'),
subplot(3,2,2),plot(h2),xlim([0 255]),title('Hist EQ 2 Filtro Gaussian G=2 freq2'),
subplot(3,2,3),plot(h3),xlim([0 255]),title('Hist EQ 3 Filtro BTW G=2 freq1'),
subplot(3,2,4),plot(h4),xlim([0 255]),title('Hist EQ 4 Filtro BTW G=2 freq2'),
subplot(3,2,5),plot(h5),xlim([0 255]),title('Hist EQ 5 Filtro Ideal G=2 freq1'),
subplot(3,2,6),plot(h6),xlim([0 255]),title('Hist EQ 6 Filtro Ideal G=2 freq2'),


figure,
subplot(3,2,1),imshow(i1,[]),title('Filtro Gaussian freq1'),
subplot(3,2,2),imshow(ig1,[]),title('Filtro Gaussian G=2 freq1'),
subplot(3,2,3),imshow(i2,[]),title('Filtro Gaussian freq2'),
subplot(3,2,4),imshow(ig2,[]),title('Filt Gaussian G=2 freq2'),
subplot(3,2,5),imshow(i3,[]),title('Filt BTW freq1'),
subplot(3,2,6),imshow(ig3,[]),title('Filt BTW G=2 freq1'),

figure,
subplot(3,2,1),imshow(i4,[]),title('Filtro BTW freq2'),
subplot(3,2,2),imshow(ig4,[]),title('Filtro BTW G=2 freq2'),
subplot(3,2,3),imshow(i5,[]),title('Filtro Ideal freq1'),
subplot(3,2,4),imshow(ig5,[]),title('Filt Ideal G=2 freq1'),
subplot(3,2,5),imshow(i6,[]),title('Filt Ideal freq2'),
subplot(3,2,6),imshow(ig6,[]),title('Filt Ideal G=2 freq2'),