clear all; close all; clc

% type_mesh = 1 -> 1D mesh - degree 1 quadrilaterals
% type_mesh = 2 -> 1D mesh - degree 1 quadrilaterals made of degree 1 triangles
% type_mesh = 3 -> 1D mesh - degree 2 quadrilaterals 8 nodes
% type_mesh = 4 -> 2D mesh - degree 1 quadrilaterals

type_mesh = 1;
n_elems_side = 10;
L = 7;

[X,T] = X_T(type_mesh, L, n_elems_side);

plotMesh(X,T(:,1:nnz(T(1,:))), type_mesh, 'plotNodes')
title(sprintf('Type Mesh = %d, Number of Elements per Side = %d, L = %d', type_mesh, n_elems_side, L), FontSize = 15)