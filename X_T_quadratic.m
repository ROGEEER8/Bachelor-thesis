function [X,T] = X_T_quadratic(n_elem)

    n_nodes = 8 + (n_elem - 1) * 5;
    
    X = zeros(n_nodes,2);
    T = zeros(n_elem,8+3); 
    
    %Nodal Coordinates Matrix
    
    % 1st column
    X(1:2*n_elem+1,1) = 0:0.5:n_elem;
    X(2*n_elem+2:(3*n_elem+2),1) = 0:n_elem;
    X((3*n_elem+3):n_nodes,1) = 0:0.5:n_elem;
    
    %X 2nd column
    X(1:2*n_elem+1,2) = 0;
    X(2*n_elem+2:(3*n_elem+2),2) = 0.5;
    X((3*n_elem+3):n_nodes,2) = 1;
    
    %Connectivity Matrix
    
    T(1:n_elem,1:3) = [1:2:2*n_elem - 1; 2:2:(2*n_elem);3:2:(2*n_elem + 1)]';
    T(1:n_elem,4) = (T(n_elem,3)+2):(T(n_elem,3)+1+n_elem);
    T(1:n_elem,5) = (T(n_elem,4)+3):2:(n_nodes);
    T(1:n_elem,6) = (T(n_elem,4)+2):2:(n_nodes-1);
    T(1:n_elem,7) = (T(n_elem,4)+1):2:(n_nodes-2);
    T(1:n_elem,8) = (T(n_elem,3)+1):(T(n_elem,3)+n_elem);

end








