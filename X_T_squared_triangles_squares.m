function [X,T] = X_T_squared_triangles_squares(nOfElements)


%NUMBER OF ELEMENTS MUST BE EVEN

if mod(nOfElements,2) ~= 0
    error('The number of elements provided must be an even number.')
else
end


n_nodes = nOfElements +  2;

X = zeros(n_nodes,2); % x-y coordinates

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


t1 = zeros(nOfElements,1); 
t1(1,1) = 1; t1(nOfElements,1) = (nOfElements+2)/2; t1(2:nOfElements-1) = (repelem(2:nOfElements/2,1,2))';

t3 = (repelem((nOfElements/2+2):nOfElements+1,1,2))';


t2_o = zeros(nOfElements,1);
for i = 2:2:length(t2_o)-2
    t2_o(i,1) = t3(i+1,1); 
end
t2_o(nOfElements,1) = nOfElements + 2;

t2_aux = zeros(nOfElements,1);
k = 2;

for j = 1:2:length(t2_aux)
    t2_aux(j) = k;
    k = k + 1;
end

t2 = t2_o + t2_aux;

y1 = zeros(nOfElements,1);

T = [t1 t2 t3 y1 y1 y1];

end