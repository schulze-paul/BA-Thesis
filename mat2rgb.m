function [ C_rgb ] = mat2rgb( C )
%mat2rgb: Takes any n x m natrix, scales and converts it to rgb n x m x 3

%scaling the matrix 
max_C = max(C(:));
min_C = min(C(:));
C_scaled = 255*(C-ones(size(C))*min_C)/(max_C-min_C);


%converting the matrix to UINT8:
C_uint8 = uint8(C_scaled);
%coverting matrix to RGB
C_rgb = cat(3, C_uint8, C_uint8, C_uint8);

end

