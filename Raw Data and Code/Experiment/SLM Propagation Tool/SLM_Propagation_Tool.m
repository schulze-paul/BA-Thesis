%   GUI for diplaying transfer function of propagation on SLM using easygui

function SLM_Display_1_0
    clc; close all; clear all;
    closescreen();

    % gui elements
    myGui = gui.autogui;
    myGui.Name = 'SLM Dislplay Tool';

    showSLM = gui.textmenu('Start / Stop', {'Start', 'Stop'});
    ff = gui.slider('focal length of the 4f setup', [0 1000]);
    zz = gui.slider('Distance z in mm', [-100 100]);
    lambda = gui.slider('Wavelength in mm', [300*10^(-6) 900*10^(-6)]);
    binaryType = gui.textmenu('complex transmittance type', {'gray', 'binary'});
    xRes = gui.slider('horizontal resolution SLM', [1 5000]);
    yRes = gui.slider('vertical resolution SLM', [1 5000]);
    yShift = gui.slider('SLM vertical alignment', [-500 500]);

    xShift = gui.slider('SLM horizontal alignment', [-500 500]);
    D_p = gui.slider('pixel pitch in mm', [0 1]);
    emnptyField = gui.textmenu(' ', {'gray', 'binary'});

    % sampling parameters and "global" parameters

    TF_gray = zeros(1920,1080);
    TF_bin = zeros(1920,1080);


    preview = subplot(10,10, 1:100);

    % callbacks, invoked whenever the Value property changes
    showSLM.ValueChangedFcn = @recalcTF;
    ff.ValueChangedFcn = @recalcTF;
    zz.ValueChangedFcn = @recalcTF;
    lambda.ValueChangedFcn = @recalcTF;
    binaryType.ValueChangedFcn = @recalcTF;
    xRes.ValueChangedFcn = @recalcTF;
    yRes.ValueChangedFcn = @recalcTF;
    xShift.ValueChangedFcn = @recalcTF;
    yShift.ValueChangedFcn = @recalcTF;
    D_p.ValueChangedFcn = @recalcTF;




    % set default values. This invokes the callbacks
    % and forces calculation of sig1 and sig2.
    ff.Value = 100;
    zz.Value = 5;
    lambda.Value = 530*10^(-6);
    xRes.Value = 1920;
    yRes.Value = 1080;
    D_p.Value = 8*10^(-3);
    xShift.Value = 127;
    yShift.Value = 206;




    function recalcTF(hWidget) %#ok<INUSD>
        % hWidget is the widget with the just-received input
        % we don't need this information in this demo

        [XX,YY] = meshgrid(-xRes.Value/2:xRes.Value/2-1, -yRes.Value/2:yRes.Value/2-1);
        TF_gray = zeros(size(XX));
        TF_bin = zeros(size(XX));

        kk = 2*pi/lambda.Value; %wave number in 1/mm

        TF_gray = exp(1i * kk * zz.Value * sqrt( 1 - (D_p.Value^2*((XX+xShift.Value).^2+(YY+yShift.Value).^2)) / ff.Value^2));


        TF_bin = 1/2*(1+cos(2*pi*(0*XX-0*YY)-angle(TF_gray)));      %alpha-/beta-shift
        TF_bin = double(TF_bin>0.5);  %binary chirp
        TF_gray = normalize(angle(TF_gray));        %taking the angle

        redrawPlots(hWidget);
    end


    function redrawPlots(hWidget) %#ok<INUSD>
        axes(preview);
        closescreen();

        switch showSLM.Value
            case 'Start'
                switch binaryType.Value
                    case 'binary'
                        imshow(TF_bin,[]);
                        TF_bin_rgb = mat2rgb(TF_bin);
                        closescreen();
                        fullscreen(TF_bin_rgb,2);        %Display on slm
                    case 'gray'
                        imshow(TF_gray,[]);
                        TF_gray_rgb = mat2rgb(TF_gray);
                        closescreen();
                        fullscreen(TF_gray_rgb,2);        %Display on slm
                end
            case 'Stop'
                closescreen();
        end
    end

end


