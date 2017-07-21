%svd decomposition

clc
close all
clear all

A=[1 1 1 1;1 0 0 1;0 1 0 1;0 0 1 0;0 1 0 1];


[U,S,V] = svd(A,0)
