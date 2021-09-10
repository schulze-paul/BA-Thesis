%% calculating corr in x and y from the results obtained in Spice_Simulation_8_0

corr_x = zeros(1,res);
for ii = 1:res
    corr_x(ii) = corr(abs(u_z(:,res/2)),abs(u_z(:,ii)));
end

corr_y = zeros(1,res);
for ii = 1:res
    corr_y(ii) = corr(abs(u_z(res/2,:)).',abs(u_z(ii,:)).');
end



xx = dx*(-res/2+1:res/2);
yy = dx*(-res/2+1:res/2);

thresh = 0.5;
xx(corr_x<thresh) = [];
yy(corr_y<thresh) = [];

corr_x(corr_x<thresh) = [];
corr_y(corr_y<thresh) = [];


lorentzFit_x = fittype('a*xx^2/((xx-c)^2+xCorr^2)', 'dependent',{'correlation_coefficient'},'independent',{'xx'},'coefficients',{'a','xCorr','c'});
myFit_x = fit(xx', corr_x.', 'gauss1');
figure, plot(myFit_x,xx,corr_x)

lorentzFit_y = fittype('a*yy^2/((yy-c)^2+yCorr^2)', 'dependent',{'correlation_coefficient'},'independent',{'yy'},'coefficients',{'a','yCorr','c'});
myFit_y = fit(yy.', corr_y.', 'gauss1');
figure, plot(myFit_y,yy,corr_y)

MyCoeffs_x = coeffvalues(myFit_x);
MyCoeffs_y = coeffvalues(myFit_y);
confint_x = confint(myFit_x);
confint_y = confint(myFit_y);
xData = [MyCoeffs_x(3), confint_x(:,3).']
yData = [MyCoeffs_y(3), confint_y(:,3).']