function [X,T] = X_T(n_elem)

n_nodes = (n_elem + 1) * 2;

X = zeros(n_nodes,2);
T = zeros(n_elem,7); 

col_1 = [0:n_nodes/2-1 0:n_nodes/2-1];

for i = 1:size(X,1)
    if i <= n_nodes/2
        X(i,2) = 0;
        X(i,1) = col_1(i);
    else
        X(i,2) = 1;
        X(i,1) = col_1(i);
    end
end

T(:,1) = 1:n_nodes/2-1;
T(:,2) = 2:n_nodes/2;
T(:,3) = (1 + n_nodes-n_elem):n_nodes;
T(:,4) = (n_nodes-n_elem):(n_nodes - 1);

end



