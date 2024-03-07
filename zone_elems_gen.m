function [zone_elems,center_pos] = zone_elems_gen(n,dim)

if n<3 || rem(n,2) ~= 1 || n>73
    error('n has to be a natural odd number not larger than 73. ')
end

%% Finding the center element

center_pos = 5;
k = 8;
for i = 5:2:n
    if i ~= 3
    center_pos = center_pos + k;
    k = k + 4;
    elseif n <= 3 || rem(n,2) == 0
        disp('n is smaller than 3 or even, must be 3 or bigger and odd!')
    end
end


%% Dimensions of the center with higher Gc

% dim = [];

% if n < 9
%        error('Minimum n is 9');
% elseif n == 11||n == 13|| n == 15|| n == 17|| n == 19||n == 21|| n == 23|| n == 25
%         dim = 1;
% elseif n == 27||n == 29|| n == 31|| n == 33
%         dim = 3;
% elseif n == 35||n == 37|| n == 39|| n == 41
%         dim = 5;
% elseif n == 43||n == 45|| n == 47|| n == 49
%         dim = 7;
% elseif n == 51||n == 53|| n == 55|| n == 57
%         dim = 9;
% elseif n == 59||n == 61|| n == 63|| n == 65
%         dim = 11;
% elseif n == 67||n == 69|| n == 71|| n == 73
%         dim = 13;
% end

%% Elements of the zone

%Ara que sabem el centre i la dimensió de la zona amb Gc superior, hem de
%seleccionar els elements que en formen part.

zone = zeros(dim,dim); %Elements which form part of the "central" zone
zone((dim+1)/2,(dim+1)/2) = center_pos;

if dim == 3

    zone(dim-1,:) = center_pos-1:center_pos+1;
    
    zone(dim-2,:) = zone(dim-1,:) + n;
    
    zone(dim,:) = zone(dim-1,:) - n;

elseif dim == 5

    zone(dim-2,:) = center_pos-2:center_pos+2;
    
    zone(dim-1,:) = zone(dim-2,:) - n;
    
    zone(dim,:) = zone(dim-2,:) - 2 * n;
        
    zone(dim-3,:) = zone(dim-2,:) + n;
    
    zone(dim-4,:) = zone(dim-2,:) + 2 * n;

elseif dim == 7

    zone(dim-3,:) = center_pos-3:center_pos+3;

    zone(dim-2,:) = zone(dim-3,:) - n;
    
    zone(dim-1,:) = zone(dim-3,:) - 2 * n;
    
    zone(dim,:) = zone(dim-3,:) - 3 * n;
        
    zone(dim-4,:) = zone(dim-3,:) + n;
    
    zone(dim-5,:) = zone(dim-3,:) + 2 * n;

    zone(dim-6,:) = zone(dim-3,:) + 3 * n;

elseif dim == 9

    zone(dim-4,:) = center_pos-4:center_pos+4;

    zone(dim-3,:) = zone(dim-4,:) - n;
    
    zone(dim-2,:) = zone(dim-4,:) - 2 * n;
    
    zone(dim-1,:) = zone(dim-4,:) - 3 * n;

    zone(dim,:) = zone(dim-4,:) - 4 * n;
        
    zone(dim-5,:) = zone(dim-4,:) + n;
    
    zone(dim-6,:) = zone(dim-4,:) + 2 * n;

    zone(dim-7,:) = zone(dim-4,:) + 3 * n;

    zone(dim-8,:) = zone(dim-4,:) + 4 * n;

elseif dim == 11

    zone(dim-5,:) = center_pos-5:center_pos+5;

    zone(dim-4,:) = zone(dim-5,:) - n;

    zone(dim-3,:) = zone(dim-5,:) - 2 * n;
    
    zone(dim-2,:) = zone(dim-5,:) - 3 * n;
    
    zone(dim-1,:) = zone(dim-5,:) - 4 * n;

    zone(dim,:) = zone(dim-5,:) - 5 * n;
        
    zone(dim-6,:) = zone(dim-5,:) + n;
    
    zone(dim-7,:) = zone(dim-5,:) + 2 * n;

    zone(dim-8,:) = zone(dim-5,:) + 3 * n;

    zone(dim-9,:) = zone(dim-5,:) + 4 * n;

    zone(dim-10,:) = zone(dim-5,:) + 5 * n;

elseif dim == 13

    zone(dim-6,:) = center_pos-6:center_pos+6;

    zone(dim-5,:) = zone(dim-6,:) - n;

    zone(dim-4,:) = zone(dim-6,:) - 2 * n;

    zone(dim-3,:) = zone(dim-6,:) - 3 * n;
    
    zone(dim-2,:) = zone(dim-6,:) - 4 * n;
    
    zone(dim-1,:) = zone(dim-6,:) - 5 * n;

    zone(dim,:) = zone(dim-6,:) - 6 * n;
        
    zone(dim-7,:) = zone(dim-6,:) + n;
    
    zone(dim-8,:) = zone(dim-6,:) + 2 * n;

    zone(dim-9,:) = zone(dim-6,:) + 3 * n;

    zone(dim-10,:) = zone(dim-6,:) + 4 * n;

    zone(dim-11,:) = zone(dim-6,:) + 5 * n;

    zone(dim-12,:) = zone(dim-6,:) + 6 * n;

elseif dim == 15

    zone(dim-7,:) = center_pos-7:center_pos+7;

    zone(dim-6,:) = zone(dim-7,:) - n;

    zone(dim-5,:) = zone(dim-7,:) - 2 * n;

    zone(dim-4,:) = zone(dim-7,:) - 3 * n;

    zone(dim-3,:) = zone(dim-7,:) - 4 * n;
    
    zone(dim-2,:) = zone(dim-7,:) - 5 * n;
    
    zone(dim-1,:) = zone(dim-7,:) - 6 * n;

    zone(dim,:) = zone(dim-7,:) - 7 * n;
        
    zone(dim-8,:) = zone(dim-7,:) + n;
    
    zone(dim-9,:) = zone(dim-7,:) + 2 * n;

    zone(dim-10,:) = zone(dim-7,:) + 3 * n;

    zone(dim-11,:) = zone(dim-7,:) + 4 * n;

    zone(dim-12,:) = zone(dim-7,:) + 5 * n;

    zone(dim-13,:) = zone(dim-7,:) + 6 * n;

    zone(dim-14,:) = zone(dim-7,:) + 7 * n;
    
end

zone_elems = reshape(zone,length(zone)^2,1);

end

