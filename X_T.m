function [X,T] = X_T(type_mesh, L, n_elems_side)
    
    switch type_mesh
        case 1

            nOfNodes = (n_elems_side + 1) * 2;
            
            X = zeros(nOfNodes,2);
            T = zeros(n_elems_side,7); 
            
            col_1 = [0:nOfNodes/2-1 0:nOfNodes/2-1];
            
            for i = 1:size(X,1)
                if i <= nOfNodes/2
                    X(i,2) = 0;
                    X(i,1) = col_1(i);
                else
                    X(i,2) = 1;
                    X(i,1) = col_1(i);
                end
            end
            
            T(:,1) = 1:nOfNodes/2-1;
            T(:,2) = 2:nOfNodes/2;
            T(:,3) = (1 + nOfNodes-n_elems_side):nOfNodes;
            T(:,4) = (nOfNodes-n_elems_side):(nOfNodes - 1);
            
            X = ((X - min(min(X)))./(max(max(X)) - min(min(X))))*L;
        case 2

            if mod(n_elems_side,2) ~= 0; error('The number of elements provided must be an even number.'); end
        
            nOfNodes = n_elems_side +  2;
            X = zeros(nOfNodes,2); % x-y coordinates
            
            col_1 = [0:nOfNodes/2-1 0:nOfNodes/2-1];
            
            for i = 1:size(X,1)
                if i <= nOfNodes/2
                    X(i,2) = 0;
                    X(i,1) = col_1(i);
                else
                    X(i,2) = 1;
                    X(i,1) = col_1(i);
                end
        
            end
        
        
            t1 = zeros(n_elems_side,1); 
            t1(1,1) = 1; t1(n_elems_side,1) = (n_elems_side+2)/2; 
            t1(2:n_elems_side-1) = (repelem(2:n_elems_side/2,1,2))';
         
            t3 = (repelem((n_elems_side/2+2):n_elems_side+1,1,2))';
            
            t2_o = zeros(n_elems_side,1);
        
            for i = 2:2:length(t2_o)-2
                t2_o(i,1) = t3(i+1,1); 
            end
        
            t2_o(n_elems_side,1) = n_elems_side + 2;
            t2_aux = zeros(n_elems_side,1);
            k = 2;
            
            for j = 1:2:length(t2_aux)
                t2_aux(j) = k;
                k = k + 1;
            end
            
            t2 = t2_o + t2_aux;
            
            y1 = zeros(n_elems_side,1);
            
            T = [t1 t2 t3 y1 y1 y1];

            X = ((X - min(min(X)))./(max(max(X)) - min(min(X))))*L;

        case 3

            nOfNodes = 8 + (n_elems_side - 1) * 5;
            
            X = zeros(nOfNodes,2);
            T = zeros(n_elems_side,8+3); 
            
            %Nodal Coordinates Matrix
            
            % 1st column
            X(1:2*n_elems_side+1,1) = 0:0.5:n_elems_side;
            X(2*n_elems_side+2:(3*n_elems_side+2),1) = 0:n_elems_side;
            X((3*n_elems_side+3):nOfNodes,1) = 0:0.5:n_elems_side;
            
            %X 2nd column
            X(1:2*n_elems_side+1,2) = 0;
            X(2*n_elems_side+2:(3*n_elems_side+2),2) = 0.5;
            X((3*n_elems_side+3):nOfNodes,2) = 1;
            
            %Connectivity Matrix
            T(1:n_elems_side,1:3) = [1:2:2*n_elems_side - 1; 2:2:(2*n_elems_side);3:2:(2*n_elems_side + 1)]';
            T(1:n_elems_side,4) = (T(n_elems_side,3)+2):(T(n_elems_side,3)+1+n_elems_side);
            T(1:n_elems_side,5) = (T(n_elems_side,4)+3):2:(nOfNodes);
            T(1:n_elems_side,6) = (T(n_elems_side,4)+2):2:(nOfNodes-1);
            T(1:n_elems_side,7) = (T(n_elems_side,4)+1):2:(nOfNodes-2);
            T(1:n_elems_side,8) = (T(n_elems_side,3)+1):(T(n_elems_side,3)+n_elems_side);

            X = ((X - min(min(X)))./(max(max(X)) - min(min(X))))*L;

        case 4

            h = L/n_elems_side; %Length of each element given n_elems_side and L
            nOfElements = n_elems_side^2;
            nOfNodes = (n_elems_side + 1) ^ 2;
            
            
            % X, nodal coordinate matrix
            X = zeros(nOfNodes,2);
            X(:,1) = repmat(0:h:L,1,n_elems_side+1)';
            X(:,2) = repelem(0:h:L,1,n_elems_side+1);
            
            % T, connectivity matrix
            a = zeros(n_elems_side,4);
            b = n_elems_side + 1;
            c = n_elems_side - 1;
            a(1:n_elems_side,1) = (1:n_elems_side)';
            a(1:n_elems_side,2) = a(1:n_elems_side,1) + 1;
            a(1:n_elems_side,3) = a(1:n_elems_side,2) + b;
            a(1:n_elems_side,4) = a(1:n_elems_side,3) - 1;
            
            T = repmat(a,n_elems_side,1);
            
            j_prev = 1;
            j = n_elems_side;

            for i = 0:c
                if i == 0
                   T(j_prev:j,:) = T(j_prev:j,:);
                elseif i ~= 0
                T(j_prev:j,:) = T(j_prev:j,:) + (n_elems_side+1)*i; 
                end
            j_prev = j + 1;
            j = j_prev + n_elems_side - 1;
            end
            
            T = [T zeros(nOfElements,3)];


    end

end

