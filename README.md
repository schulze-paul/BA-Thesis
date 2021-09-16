<h1 align=center>Coherent Light Simulation of Speckle Interference Patterns in Optical Metrology</h1>

<h5 align=center>Spatial Light Modulator Based Propagation of Partially Coherent Speckle Fields in a 4f setup<h5>


<h6 align="center"><a href="https://schulze-paul.github.io">Paul Schulze</a></h6>

<h6 align=center>University of Bremen</h6>
	
<p align=center>
	<a href="https://raw.githubusercontent.com/schulze-paul/BIAS-SPICE/master/BachelorThesis.pdf">Thesis</a> • <a href="https://raw.githubusercontent.com/schulze-paul/BIAS-SPICE/master/BA_Paul_Schulze_Presentation.pdf">Presentation</a>
</p>


<h1 align=center >Abstract</h1>
Contrast measurements of interference patterns emerging from the surface can be used to
evaluate the three dimensional shape of an object. Traditionally, moving the focal plane through
the object involves a mechanical movement in the imaging system. In my thesis, I show that a
spatial light modulator (SLM) utilizing the transfer function of propagation can move the focal
plane with no reduction in image quality and without the need for any mechanical movement. The
SLM is integrated in the Fourier plane of a 4f imaging system. The speckle patterns (interference
patterns) play a central role in the evaluation process of the three dimensional measurement.
I report my findings from a simulation, which relate the size of the speckle to the wavelength
of light used as illumination, the size of the Fourier aperture and the focal length of the utilized
lenses in the 4f setup. A method for speckle size detection is presented. For partially coherent
light, a predictable area of high contrast forms around the objects’ surface, with the rest of
the wave field being of lower contrast. The simulated results are supported by experimental
evidence. I experimentally demonstrate a visible difference in contrast and image sharpness for
microscopic surface features of different height. This paves the road for the development of a
fully functional measuring method that is precise, fast, robust against vibrations and exhibits an
extended depth of focus.
	
Simulation and control software of white light interferometry methods.

<h1 align=center >Results</h1>

<h3 align=center >Amplitude and Phase of Simulated Speckle</h3>
	
<div align="center">
	<img src="https://github.com/schulze-paul/BIAS-SPICE/blob/master/Figures/Specke_amp_phase.PNG?raw=true" alt="Simulation Results" title="Simulation Results" 
	width="600"/>

</div>

<b>Figure 3. Amplitude and phase of numerically simulated coherent speckle wavefield in the sensor plane.</b>  
The amplitude consists of the characteristic speckle pattern. The phase distribution shows phase singularities (e.g. red arrow) and phase jumps (e.g. yellow arrow). I generated the wavefield with 128 scattering points on a square surface of size 5.42 mm × 5.42 mm,
10 mm from the input plane, illuminated with a wavelength of λ = 530 nm. The 4f setup
consists of two f = 100 mm lenses and a Fourier aperture of diameter ρ = 0.25 mm. The
sampled area shown is 512 × 512 pixels with a pixel pitch of ∆x = 5.2 µm. 

<div align="center">
	<img src="https://github.com/schulze-paul/BIAS-SPICE/blob/master/Figures/Specke_cross.PNG?raw=true" alt="Simulation Results" title="Simulation Results" 
	width="300"/>

</div>	
<b>Figure 4. Cross section of the amplitude from the generated speckle field.</b>
I captured the intensities at different z by varying the transfer function Hz in the Fourier domain from z = -500 mm
to z = 500 mm. I generated the wavefield with the same parameters as Figure 3. The
sampled area shown is 1024 × 1024 pixels.

	
<h3 align=center >Intensity Histogram of Simulated Speckle</h3>
	
<div align="center">
	<img src="https://github.com/schulze-paul/BIAS-SPICE/blob/master/Figures/Intensity_Hist.PNG?raw=true" alt="Simulation Results" title="Simulation Results" 
	width="300"/>

</div>

<b>Figure 5. Normalized intensity histogram of the calculated coherent speckle pattern.</b>  
An exponential function
f(I/¯I) = a/¯I exp(b · I/¯I) (blue line)
is fitted to the data (black dots). The
parameters a ≈ 1.01 and b ≈ −1.02
were determined. Both are very close
to the expected values a = 1 and b = -1.
The position of the data point at I/¯I = 0
is an artifact of the histogram calculation
algorithm. The data point is excluded
from the fit calculation.
	
	
<h3 align=center >Size of Simulated Speckle</h3>
	
<div align="center">
	<img src="https://github.com/schulze-paul/BIAS-SPICE/blob/master/Figures/Speckle_Size.PNG?raw=true" alt="Simulation Results" title="Simulation Results" 
	width="600"/>

</div>

<b>Figure 6. Speckle size dependence on wavelength, aperture diameter and focal length in the
4f setup. </b>  
<b>a</b>, Amplitude distributions of speckle fields with different speckle sizes. <b>b</b>, <b>c</b>, <b>d</b>,
Speckle size ∆s plotted over the wavelength of light λ, the reciprocal of aperture diameter
1/ρ and focal length f, respectively. Linear curves were fitted against the data. Error bars
indicate 95% confidence intervals. Linear relationships can be observed in all three cases.
from the fit calculation.
