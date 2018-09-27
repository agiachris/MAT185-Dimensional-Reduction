% Christopher Agia
% Student #: 100 324 3509
% Part 2: d)

% First remake the variables for the new Christophe picture
C2 = mean_normalized_christophe * mean_normalized_christophe'/number_of_faces;
[V3, B] = eig(C2);
V4 = fliplr(V3);
figure;
face2 = reshape(christophe, 60, 60)';
imagesc(face2);
colormap(gray(256));

% Here we run a loop for k values of 10, 20, 50, 100, 500
figure;
for i = [10,20,50,100,500];
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
    
    coord_Temp = V4 * coord_Temp;
    
    subplot(2,4,n)
    
    face2 = reshape(coord_Temp, 60, 60)';
    
    imagesc(face2);
    
    colormap(gray(256));    
end