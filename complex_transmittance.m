function [ ct ] = complex_transmittance( z, lda, D_p, f,  x_res, y_res, x_offset, y_offset)
%complex_transmittance: Gives out a matrix of the coplex transmittance.

%calculating the difference-from-center-matrix
j = 1 : y_res;
y_dist = (j - y_offset).^2;

j = 1 : x_res;
x_dist = (j - x_offset).^2;

%distance matrix 
dist = sqrt(x_dist.'*ones(1,y_res) + ones(x_res,1)*y_dist);

%complex transmittance (CT)
ct = exp(1i * 2 * pi * z / lda * sqrt( 1 - (D_p*dist).^2 / f^2));

end

