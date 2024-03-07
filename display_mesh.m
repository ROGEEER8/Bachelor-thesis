clear all; close all; clc

nOfElements = 20; %(MUST BE EVEN)

E = 210 + zeros(nOfElements,1); nu = zeros(nOfElements,1); % +0.3 
Gc = 2.7e-3 + zeros(nOfElements,1); %Gc(3:4,1) = 2e-5; %We change

%CHANGES IN PARAMETERS MUST BE DONE ABOVE THIS LINE

lambda = E.*nu./((1+nu).*(1-2*nu)); mu = E./(2*(1+nu));

tol = 1.e-2; 
l  = 0.2;
increments = 1e-4; %:1e-4:1e-1;
%% Mesh
degree = 1;
[X,T] = X_T_squared_triangles_squares(nOfElements);
figure(1),clf,kk = plotMesh(X,T(:,1:nnz(T(1,:))),'plotNodes'); 
