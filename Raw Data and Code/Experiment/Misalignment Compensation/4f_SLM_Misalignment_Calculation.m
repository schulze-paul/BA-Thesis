clc; close all; clear all;

%% parameters
lambda = 0.00053; %mm
ff = 100; %mm


Dslm = 0.008;      %slm pixel size

NN = 2054;
MM = 2452;

dx = 0.00345; %mm   % Object pixel sizes
dy = 0.00345; %mm

du = lambda * ff / (dx * NN);
dv = lambda * ff / (dy * MM);

u_b = double(loadFPImage('USAF_z=0.fpimg'));
u_b_shifted = [u_b(:,2252:2452),u_b(:,1:2251)];


for xx = 127
    for yy = 206        
        [uu,vv] = meshgrid(du*(-MM/2+1:MM/2),dv*(-NN/2+1:NN/2));
        u_a = loadFPImage(['USAF_z=5_' sprintf('%03d',xx) '_' sprintf('%03d',yy ) '.fpimg']);      %loading the intensity image captured at propagation distance z=10
        %u_a_shifted = [u_a(:,2452-28:2452),u_a(:,1:2452-29)];
        %u_a_shifted = [u_a_shifted(17:2054,:);
        %                u_a_shifted(1:16,:)];
        
        %figure, imshow(u_a,[])
        
        %% convolution with the transfer function
        U_a = ifftshift(fft2(double(u_a)));

        [NN,MM] = size(u_a);
        zz = -5; %backpropagation distance

        U_r = U_a .* (exp(-1i * 2*pi/lambda * zz * sqrt( 1 -  (uu.^2 + vv.^2) / ff^2)));        %convolution with transfer function

        u_backprop = abs(ifft2(U_r));       %numerically backpropagated image

        
        saveFPImage(u_backprop,['USAF_backprop_z=-5_' sprintf('%03d',xx) '_' sprintf('%03d',yy) '.fpimg']);

        %% cross correlation with z=0 image

        
        figure, imshow(u_backprop,[])
        figure, imshow(u_b,[])

        U_backprop = shiftedfft(u_backprop);
        U_b = shiftedfft(u_b);

        CC = abs(shiftedfft(U_b.*conj(U_backprop)));        %correlation with real amplitude image captured at z=0

        [xPeak, yPeak] = find(CC==max(CC(:)));
        
        xPixel = xPeak-NN/2-1;
        yPixel = yPeak-MM/2-1;
        
        xShift = dx*xPixel;           %shift in the images, vertical
        yShift = dy*yPixel;            %horizontal

        uShift = ff/zz*xShift;        %shift on the SLM
        vShift = -ff/zz*yShift;
        
        uPixel = xx + uShift/0.008
        vPixel = yy + vShift/0.008
        
        figure, surf(CC), shading flat

    end 
end

