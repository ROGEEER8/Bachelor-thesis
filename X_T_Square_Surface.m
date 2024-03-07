function [X,T] = X_T_Square_Surface(L,n)

    h = L/n; %Length of each element given n and L
    nOfElements = n^2;
    n_nodes = (n + 1) ^ 2;
    
    
    %% X, nodal coordinate matrix
    
    X = zeros(n_nodes,2);
    
    X(:,1) = repmat(0:h:L,1,n+1)';
    X(:,2) = repelem(0:h:L,1,n+1);
    
    %% T, connectivity matrix
    a = zeros(n,4);
    b = n + 1;
    c = n - 1;
    
    a(1:n,1) = (1:n)';
    a(1:n,2) = a(1:n,1) + 1;
    a(1:n,3) = a(1:n,2) + b;
    a(1:n,4) = a(1:n,3) - 1;
    
    T = repmat(a,n,1);
    
    j_prev = 1;
    j = n;
    
    for i = 0:c
        if i == 0
           T(j_prev:j,:) = T(j_prev:j,:);
        elseif i ~= 0
        T(j_prev:j,:) = T(j_prev:j,:) + (n+1)*i; 
        end
    j_prev = j + 1;
    j = j_prev + n - 1;
    end
    
    T = [T zeros(nOfElements,3)];

end

