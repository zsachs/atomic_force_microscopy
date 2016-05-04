% Zachariah Sachs
% CHEM 26701
% 28 April 2013

% Atomic Force Microscopy

% Included in this script:
% -Inverted plot with circled peaks. Forces zeroed to post-dissociation
%  average force
% -Get vectors of individual molecular events
% -Fit individual events to WLC model.
% -Plot event fits over the zeroed and inverted data; printed 'wlc1_2-8.png'
% -Return WLC model parameters with stats as 'Lc1fit.dat' and 'P1fit.dat'

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
d1=importdata('ms-0422.004.dat');

% Invert plots so stretch peaks go up
z1=d1.data(:,1); %extension in nm
f1=-d1.data(:,2); %force in nN

%*********************************************************************
% Query 1 peaks see http://www.mathworks.com/help/signal/ref/findpeaks.html
% Make vector of 1 peak displacements 
[pks1,locs1]=findpeaks(f1,'MINPEAKDISTANCE',60);

pks1=pks1(7:14);
locs1=locs1(7:14);

% Shift 1
pks1=pks1-mean(f1(locs1(end):end));
f1=f1-mean(f1(locs1(end):end));

% Plot 1
p1=figure;
plot(z1,f1);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 1');

plot(z1(locs1),pks1,'or');
hold off
%*******************************************************************
% Query 1 peak indices.
x2=z1(locs1(1)+15:locs1(2));
y2=f1(locs1(1)+15:locs1(2));

x3=z1(locs1(2)+5:locs1(3));
y3=f1(locs1(2)+5:locs1(3));

x4=z1(locs1(3)+5:locs1(4));
y4=f1(locs1(3)+5:locs1(4));

x5=z1(locs1(4)+5:locs1(5));
y5=f1(locs1(4)+5:locs1(5));

x6=z1(locs1(5)+5:locs1(6));
y6=f1(locs1(5)+5:locs1(6));

x7=z1(locs1(6)+5:locs1(7));
y7=f1(locs1(6)+5:locs1(7));

x8=z1(locs1(7)+5:locs1(8));
y8=f1(locs1(7)+5:locs1(8));

%*************************************************************************
% Fit 2 using lsqcurvefit
x02=[10^-1;10^3];
ff = @(a,x)(kBn*T/a(1))*(0.25*(1.-x./a(2)).^-2-0.25+x./a(2));
z2 = lsqcurvefit(ff,x02,x2,y2);
% This fits to the wormlike chain model ff. z is supposed to spit out the
%vector (p,Lc). x0 is an initial guess, ideally within an
%order of magnitude. I think we are expecting p=0.5 and Lc=50

% Make a for-loop to make a vector to plot 2
xx2=z1(locs1(1)-10:locs1(2)+10);
nx2=length(xx2);
for i=1:nx2
fitted2(i) =(kBn*T/(z2(1)))*(0.25*(1.0 - xx2(i)/(z2(2)))^-2 - 0.25+xx2(i)/z2(2));
end

% Return the 2 fit parameters p and L_c
fit2_Lc = z2(2)
fit2_p = z2(1)

% Fit 3 using lsqcurvefit
x03=[10^-1;10^3];
z3 = lsqcurvefit(ff,x03,x3,y3);

% Make a for-loop to make a vector to plot 3
xx3=z1(locs1(2)-10:locs1(3)+10);
nx3=length(xx3);
for i=1:nx3
fitted3(i) =(kBn*T/(z3(1)))*(0.25*(1.0 - xx3(i)/(z3(2)))^-2 - 0.25+xx3(i)/z3(2));
end

% Return the 3 fit parameters p and L_c
fit3_Lc = z3(2)
fit3_p = z3(1)

% Fit 4 using lsqcurvefit
x04=[10^-1;10^3];
z4 = lsqcurvefit(ff,x04,x4,y4);

% Make a for-loop to make a vector to plot 4
xx4=z1(locs1(3)-10:locs1(4)+10);
nx4=length(xx4);
for i=1:nx4
fitted4(i) =(kBn*T/(z4(1)))*(0.25*(1.0 - xx4(i)/(z4(2)))^-2 - 0.25+xx4(i)/z4(2));
end

% Return the 4 fit parameters p and L_c
fit4_Lc = z4(2)
fit4_p = z4(1)

% Fit 5 using lsqcurvefit
x05=[10^-1;10^3];
z5 = lsqcurvefit(ff,x05,x5,y5);

% Make a for-loop to make a vector to plot 5
xx5=z1(locs1(4)-10:locs1(5)+10);
nx5=length(xx5);
for i=1:nx5
fitted5(i) =(kBn*T/(z5(1)))*(0.25*(1.0 - xx5(i)/(z5(2)))^-2 - 0.25+xx5(i)/z5(2));
end

% Return the 5 fit parameters p and L_c
fit5_Lc = z5(2)
fit5_p = z5(1)

% Fit 6 using lsqcurvefit
x06=[10^-1;10^3];
z6 = lsqcurvefit(ff,x06,x6,y6);

% Make a for-loop to make a vector to plot 6
xx6=z1(locs1(5)-10:locs1(6)+10);
nx6=length(xx6);
for i=1:nx6
fitted6(i) =(kBn*T/(z6(1)))*(0.25*(1.0 - xx6(i)/(z6(2)))^-2 - 0.25+xx6(i)/z6(2));
end

% Return the 6 fit parameters p and L_c
fit6_Lc = z6(2)
fit6_p = z6(1)

% Fit 7 using lsqcurvefit
x07=[10^-1;10^3];
z7 = lsqcurvefit(ff,x07,x7,y7);

% Make a for-loop to make a vector to plot 7
xx7=z1(locs1(6)-10:locs1(7)+10);
nx7=length(xx7);
for i=1:nx7
fitted7(i) =(kBn*T/(z7(1)))*(0.25*(1.0 - xx7(i)/(z7(2)))^-2 - 0.25+xx7(i)/z7(2));
end

% Return the  7fit parameters p and L_c
fit7_Lc = z7(2)
fit7_p = z7(1)

% Fit 8 using lsqcurvefit
x08=[10^-1;10^3];
z8 = lsqcurvefit(ff,x08,x8,y8);

% Make a for-loop to make a vector to plot 8
xx8=z1(locs1(7)-10:locs1(8)+10);
nx8=length(xx8);
for i=1:nx8
fitted8(i) =(kBn*T/(z8(1)))*(0.25*(1.0 - xx8(i)/(z8(2)))^-2 - 0.25+xx8(i)/z8(2));
end

% Return the 8 fit parameters p and L_c
fit8_Lc = z8(2)
fit8_p = z8(1)

%************************************************************************
% Plot the shifted data and the fit and print for report. Comment out to
%work.
fits1=figure;
plot(z1,f1);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin: Peak WLC extension model 1');
plot(xx2,fitted2,'r','LineWidth',1);
plot(xx3,fitted3,'r','LineWidth',1);
plot(xx4,fitted4,'r','LineWidth',1);
plot(xx5,fitted5,'r','LineWidth',1);
plot(xx6,fitted6,'r','LineWidth',1);
plot(xx7,fitted7,'r','LineWidth',1);
plot(xx8,fitted8,'r','LineWidth',1);
hold off
print(fits1,'-dpng','wlc1_2-8');

%*******************************************************************
%Write domain Lc and p vectors with averages and standards of dev at the
%end.
f1tlC=[z2(2),z3(2),z4(2),z5(2),z6(2),z7(2),z8(2)].';
f1tp=[z2(1),z3(1),z4(1),z5(1),z6(1),z7(1),z8(1)].';

av1Lc=mean(f1tlC);
av1p=mean(f1tp);

std1Lc=std(f1tlC);
std1p=std(f1tp);

csvwrite('Lc1fit.dat',vertcat(f1tlC,av1Lc,std1Lc));
csvwrite('P1fit.dat',vertcat(f1tp,av1p,std1p));