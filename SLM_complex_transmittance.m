clear all; close all;

%Display Time 
time = 0.1;

%setting the resolution of the SLM
x_res = 1080;
y_res = 1920;
x_offset = x_res/2+1;
y_offset = y_res/2+1;

%pixel pitch in mm
D_p = 8e-3;
%focal length in mm
f = 100;
%Note: focal length and pixel pitch should be in the same unit

%wavelength in um
lda = 0.633;

%propagation distances in um
for z = 1000:100:2000
%Note: wavelenth and propagation distance should be in the same unit

%calling function complex_transmittance
ct = complex_transmittance(z, lda, D_p, f, x_res, y_res, x_offset, y_offset);

%taking the angle of ct matrix and converting it to rbg
ct_rgb = mat2rgb(angle(ct));


%Output of the CT as PNG with specified z and wavelength
%imwrite(An_CT,['compl_transm_z=' num2str(z) 'um, lambda=' num2str(lda) '.png'])

%Display the CT Full Screen on specified Screen for a specified amount of
%time and close the screen afterwards
fullscreen(ct_rgb,1);
pause(time);


end
closescreen();