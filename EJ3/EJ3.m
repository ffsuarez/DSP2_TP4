%%
% 
%  PRACTICO 4
% 
%Nombre: Suarez Facundo
clc,clear all,close all,
%% 
%EJERCICIO 3
i=imread('3.tif');
i=rgb2gray(i);
[r,c]=size(i);
I=fft2(i);
IC=fftshift(I);
freq1=90;freq2=