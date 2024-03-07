clear all; close all; clc

nOfElements = 200;

degree = 1;
[X,T] = X_T_squared_triangles_squares(nOfElements);
figure(1),clf,kk = plotMesh(X,T(:,1:nnz(T(1,:))),'plotNodes'); 
