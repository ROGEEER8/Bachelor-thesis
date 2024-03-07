clear all; close all; clc


%% 1D mesh - degree 1 quadrilaterals
nOfElements = 10;
[X,T] = X_T(nOfElements); % Standard 1D quadrilaterals degree 1 mesh
figure(1),clf,kk = plotMesh_2(X,T(:,1:nnz(T(1,:))),'plotNodes');

%% 1D mesh - degree 1 quadrilaterals made of degree 1 triangles
nOfElements = 20;
[X,T] = X_T_squared_triangles_squares(nOfElements);
figure(3),clf,kk = plotMesh(X,T(:,1:nnz(T(1,:))),'plotNodes');


%% 1D mesh - degree 2 quadrilaterals
nOfElements = 10;
[X,T] = X_T_quadratic(nOfElements);
figure(1),clf,kk = plotMesh_3(X,T(:,1:nnz(T(1,:))),'plotNodes');


%% 2D mesh - degree 1 quadrilaterals

L = 1;
n = 10;
[X,T] = X_T_Square_Surface(L,n);
figure(4); kk = plotMesh(X,T(:,1:nnz(T(1,:))),'plotNodes');

