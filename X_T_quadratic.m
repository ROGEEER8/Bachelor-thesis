function [X,T] = X_T_quadratic(n_elem)

n_nodes = 8 + (n_elem - 1) * 5;

X = zeros(n_nodes,2);
T = zeros(n_elem,8+3); 

%%

%Nodal Coordinates Matrix

%1st column
X(1:2*n_elem+2,1) = (repmat(0:n_elem,[1,2]))';
X(2*n_elem+2 + 1:2*n_elem+2 + 1 + n_elem - 1,1) = 0.5:n_elem-0.5;
X(2*n_elem+2 + 1 + n_elem:2*n_elem+2 + 1 + n_elem * 2,1) = 0:n_elem;
X(2*n_elem+2 + 2 + n_elem * 2:2*n_elem+2 + 2 + n_elem * 3 - 1,1) = 0.5:n_elem-0.5;

%2nd column
X(1:n_elem + 1,2) = zeros(n_elem + 1, 1);
X(n_elem + 2 : (n_elem + 1) * 2,2) = ones(n_elem + 1, 1);
X((n_elem + 1) * 2 + 1:n_elem * 4 + n_elem*-1 + 2,2) = zeros(n_elem,1);
X(n_elem * 4 + n_elem*-1 + 3:n_elem * 5 + n_elem*-1 + 3,2) = zeros(n_elem + 1,1) + 0.5;
X(n_elem * 5 + n_elem*-1 + 4:8 + 5* (n_elem - 1),2) = ones(n_elem,1);

%%

%Connectivity matrix

T(:,1) = (1:n_elem)';
T(:,2) = ((n_elem + 1) * 2 + 1:n_elem * 4 + n_elem*-1 + 2)';
T(:,3) = (2:n_elem+1)';
T(:,4) = ((n_elem + 1) * 2 + 2+n_elem:n_elem * 4 + n_elem*-1 + 2 +n_elem + 1)';
T(:,5) = (3*n_elem + 1 + (-2*(n_elem - 1)):4*n_elem + (-2*(n_elem-1)));
T(:,6) = ((n_elem + 1) * 2 + 2+n_elem + n_elem:n_elem * 4 + n_elem*-1 + 2 +n_elem + 1 + n_elem)';
T(:,7) = (2+n_elem:2*n_elem+1)';
T(:,8) = ((n_elem + 1) * 2 + 1 + n_elem:n_elem * 4 + n_elem*-1 + 2 + n_elem)';










