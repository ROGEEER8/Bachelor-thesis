function [X,T] = X_T_Square_Surface(side)


nOfElements = side^2;
n_nodes = (side + 1) ^ 2;

X = zeros(n_nodes,2);

X(:,1) = repmat(0:nOfElements/side,1,side + 1)';
X(:,2) = repelem(0:side,1,side + 1);

a = zeros(side,4);
b = side + 1;
c = side - 1;

a(1:side,1) = (1:side)';
a(1:side,2) = a(1:side,1) + 1;
a(1:side,3) = a(1:side,2) + b;
a(1:side,4) = a(1:side,3) - 1;

T = repmat(a,side,1);

j_prev = 1;
j = side;

for i = 0:c
    if i == 0
       T(j_prev:j,:) = T(j_prev:j,:) + 4*i;
    elseif i ~= 0
    T(j_prev:j,:) = T(j_prev:j,:) + 4*i + 2*i; 
    end
j_prev = j + 1;
j = j_prev + side - 1;
end

end

