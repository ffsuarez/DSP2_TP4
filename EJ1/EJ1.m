%%
% 
%  PRACTICO 4
% 
%Nombre: Suarez Facundo
clc,clear all,close all,
%% 
%EJERCICIO 1
 i=imread('1.jpg');
 i=rgb2gray(i);
 I=fft2(i);
 IC=fftshift(I);
 
 %a
 figure,subplot(1,3,1),imshow(i),title('Imagen original'),
 subplot(1,3,2),imshow(I),title('Transformada No Centralizada'),
 subplot(1,3,3),imshow(IC),title('Transformada Centralizada');
 
 m_IC=abs(IC);
 log_m_IC=log(1+m_IC);
 a_I=fftshift(angle(I));
 
  
 %b
 figure,subplot(1,2,1),mesh(log_m_IC),title('Transform Fourier Centralizada'),
 subplot(1,2,2),mesh(a_I),title('Fase Transf Fourier Centralizada');
 
 figure,subplot(1,2,1),mesh(log(1+abs(I))),title('Transf Fourier No Centralizada');
 subplot(1,2,2),mesh(angle(I)),title('Ang Transf Fourier No Centralizada')
 
 