% Christopher Agia
% Student #: 100 324 3509
% Part 2.c 

% Part 2 b) code is needed for c)
% b): 
C = mean_normalized_faces * mean_normalized_faces'/number_of_faces;
[V, B] = eig(C);
V2 = fliplr(V);

%       First we set up the variable V2 that we will use to create our coord
%c):    First we use the reshape function

f = faces(:, 200);
coords = V2' * f; 
figure;
face = reshape(faces(:, 200), 60, 60)';
imagesc(face);
colormap(gray(256));

% now we run a loop for k values of: 10, 20 ,50 ,100, and 500
figure;
for i = [10, 20, 50, 100, 500]
    
    if i == 10
        n=1;
    end
    
    if i == 20
        n = 2;
    end
    
    if i == 50
        n =3;
    end
    
    if i == 100
        n = 4;
    end
    
    if i == 500
        n = 5;
    end
    
    coord_Temp = coords;
    
    for j= i+1:3600
        coord_Temp(j) = 0;
    end 
    
    coord_Temp = V2 * coord_Temp;
    subplot(2,4,n)
    face = reshape(coord_Temp, 60, 60)';
    imagesc(face);
    colormap(gray(256));    
end
