% Zachariah Sachs
% CHEM 26701
% 28 April 2013

% Atomic Force Microscopy

% Included in this script:
% -Inverted plot with circled peaks. Forces zeroed to post-dissociation
%  average force
% -Get vectors of individual molecular events
% -Fit individual events to WLC model.
% -Plot event fits over the zeroed and inverted data; printed 'wlcs5_3-9.png'
% -Return WLC model parameters with stats as 'Lc5fits.dat' and 'P5fits.dat'

%********************************************************************
% Select ~5-10 force extension curves for single domain unfolding events
% using the WLC equation. Determine the persistance and contuor lengths per
% domain, and the contuor length of the whole protein. We need to fit back
% to zero, including which number domain broke.

% AFM force-extension experiment with titin molecule
% Fitting of WCL model data for biopolymer stretch

% Recalculate Boltzmann constant in nN nm/K as data is in nm and nN
kB  = 1.38e-23; % in J/K = 10^9 * 10^9 nN*nm/K
kBn = kB*10^18; % in nN*nm/K
T=295;

% Import data
d1=importdata('ms-0422.023.dat');

% Invert plots so stretch peaks go up
z1=d1.data(:,1); %extension in nm
f1=-d1.data(:,2); %force in nN

%*********************************************************************
% Query 5 peaks
% Make vector of 5 peak displacements 
[pks5,locs5]=findpeaks(f1,'MINPEAKDISTANCE',50);

pks5=pks5([7,8,12,13,14,15,16,17,20]);
locs5=locs5([7,8,12,13,14,15,16,17,20]);

% Shift 5
pks5=pks5-mean(f1(locs5(end):end));
f1=f1-mean(f1(locs5(end):end));

% Plot 5
p5=figure;
plot(z1,f1);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 5');

plot(z1(locs5),pks5,'or');
hold off

%*******************************************************************
% Query peak indices.
x3=z1(locs5(2)+200:locs5(3))-z1(locs5(1));
y3=f1(locs5(2)+200:locs5(3));

x4=z1(locs5(3)+5:locs5(4))-z1(locs5(2));
y4=f1(locs5(3)+5:locs5(4));

x5=z1(locs5(4)+5:locs5(5))-z1(locs5(3));
y5=f1(locs5(4)+5:locs5(5));

x6=z1(locs5(5)+5:locs5(6))-z1(locs5(4));
y6=f1(locs5(5)+5:locs5(6));

x7=z1(locs5(6)+5:locs5(7))-z1(locs5(5));
y7=f1(locs5(6)+5:locs5(7));

x8=z1(locs5(7)+5:locs5(8))-z1(locs5(6));
y8=f1(locs5(7)+5:locs5(8));

x9=z1(locs5(8)+5:locs5(9))-z1(locs5(7));
y9=f1(locs5(8)+5:locs5(9));

%*************************************************************************
% Fit 3 using lsqcurvefit
x0=[10^0;10^1];
ff = @(a,x)(kBn*T/a(1))*(0.25*(1.-x./a(2)).^-2-0.25+x./a(2));
z3 = lsqcurvefit(ff,x0,x3,y3);

% Make a for-loop to make a vector to plot 3
xx3=z1(locs5(2)-10:locs5(3)+10)-z1(locs5(1));
nx3=length(xx3);
for i=1:nx3
fitted3(i) =(kBn*T/(z3(1)))*(0.25*(1.0 - xx3(i)/(z3(2)))^-2 - 0.25+xx3(i)/z3(2));
end

% Return the 3 fit parameters p and L_c
fit3_Lc = z3(2)
fit3_p = z3(1)

% Fit 4 using lsqcurvefit
z4 = lsqcurvefit(ff,x0,x4,y4);

% Make a for-loop to make a vector to plot 4
xx4=z1(locs5(3)-10:locs5(4)+10)-z1(locs5(2));
nx4=length(xx4);
for i=1:nx4
fitted4(i) =(kBn*T/(z4(1)))*(0.25*(1.0 - xx4(i)/(z4(2)))^-2 - 0.25+xx4(i)/z4(2));
end

% Return the 4 fit parameters p and L_c
fit4_Lc = z4(2)
fit4_p = z4(1)

% Fit 5 using lsqcurvefit
z5 = lsqcurvefit(ff,x0,x5,y5);

% Make a for-loop to make a vector to plot 5
xx5=z1(locs5(4)-10:locs5(5)+10)-z1(locs5(3));
nx5=length(xx5);
for i=1:nx5
fitted5(i) =(kBn*T/(z5(1)))*(0.25*(1.0 - xx5(i)/(z5(2)))^-2 - 0.25+xx5(i)/z5(2));
end

% Return the 5 fit parameters p and L_c
fit5_Lc = z5(2)
fit5_p = z5(1)

% Fit 6 using lsqcurvefit
z6 = lsqcurvefit(ff,x0,x6,y6);

% Make a for-loop to make a vector to plot 6
xx6=z1(locs5(5)-10:locs5(6)+10)-z1(locs5(4));
nx6=length(xx6);
for i=1:nx6
fitted6(i) =(kBn*T/(z6(1)))*(0.25*(1.0 - xx6(i)/(z6(2)))^-2 - 0.25+xx6(i)/z6(2));
end

% Return the 6 fit parameters p and L_c
fit6_Lc = z6(2)
fit6_p = z6(1)

% Fit 7 using lsqcurvefit
z7 = lsqcurvefit(ff,x0,x7,y7);

% Make a for-loop to make a vector to plot 7
xx7=z1(locs5(6)-10:locs5(7)+10)-z1(locs5(5));
nx7=length(xx7);
for i=1:nx7
fitted7(i) =(kBn*T/(z7(1)))*(0.25*(1.0 - xx7(i)/(z7(2)))^-2 - 0.25+xx7(i)/z7(2));
end

% Return the  7fit parameters p and L_c
fit7_Lc = z7(2)
fit7_p = z7(1)

% Fit 8 using lsqcurvefit

z8 = lsqcurvefit(ff,x0,x8,y8);

% Make a for-loop to make a vector to plot 8
xx8=z1(locs5(7)-10:locs5(8)+10)-z1(locs5(6));
nx8=length(xx8);
for i=1:nx8
fitted8(i) =(kBn*T/(z8(1)))*(0.25*(1.0 - xx8(i)/(z8(2)))^-2 - 0.25+xx8(i)/z8(2));
end

% Return the 8 fit parameters p and L_c
fit8_Lc = z8(2)
fit8_p = z8(1)

% Fit 9 using lsqcurvefit
z9 = lsqcurvefit(ff,x0,x9,y9);
% This fits to the wormlike chain model ff. z is supposed to spit out the
%vector (p,Lc). x0 is an initial guess, ideally within an
%order of magnitude. I think we are expecting p=0.5 and Lc=50

% Make a for-loop to make a vector to plot 9
xx9=z1(locs5(8)-10:locs5(9)+10)-z1(locs5(7));
nx9=length(xx9);
for i=1:nx9
fitted9(i) =(kBn*T/(z9(1)))*(0.25*(1.0 - xx9(i)/(z9(2)))^-2 - 0.25+xx9(i)/z9(2));
end

% Return the 9 fit parameters p and L_c
fit9_Lc = z9(2)
fit9_p = z9(1)

%************************************************************************
% Plot the shifted data and the fit and print for report. Comment out to
%work.
fits5=figure;
plot(z1,f1);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin: Peak WLC extension model 5');
plot(xx3+z1(locs5(1)),fitted3,'r','LineWidth',1);
plot(xx4+z1(locs5(2)),fitted4,'r','LineWidth',1);
plot(xx5+z1(locs5(3)),fitted5,'r','LineWidth',1);
plot(xx6+z1(locs5(4)),fitted6,'r','LineWidth',1);
plot(xx7+z1(locs5(5)),fitted7,'r','LineWidth',1);
plot(xx8+z1(locs5(6)),fitted8,'r','LineWidth',1);
plot(xx9+z1(locs5(7)),fitted9,'r','LineWidth',1);
hold off
print(fits5,'-dpng','wlcs5_3-9');

%*******************************************************************
%Write domain Lc and p vectors with averages and standards of dev at the
%end.
f5tlC=[z3(2),z4(2),z5(2),z6(2),z7(2),z8(2),z9(2)].';
f5tp=[z3(1),z4(1),z5(1),z6(1),z7(1),z8(1),z9(1)].';

av5Lc=mean(f5tlC);
av5p=mean(f5tp);

std5Lc=std(f5tlC);
std5p=std(f5tp);

csvwrite('Lc5fits.dat',vertcat(f5tlC,av5Lc,std5Lc));
csvwrite('P5fits.dat',vertcat(f5tp,av5p,std5p));