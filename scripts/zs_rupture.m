% Zachariah Sachs
% CHEM 26701
% 28 April 2013

% Atomic Force Microscopy

% Included in this script:
% -Inverted plots with circled peaks. Forces zeroed to post-dissociation
%  average force; printed 'psh#.png'
% -Histogram of rupture data with Gaussian fit, printed 'hisrupt.png'
% -Fit parameters returned end of 'Frupt.dat'


%**********************************************************************
% Import retract data only

d1=importdata('ms-0422.004.dat');
d2=importdata('ms-0422.012.dat');
d3=importdata('ms-0422.017.dat');
d4=importdata('ms-0422.019.dat');
d5=importdata('ms-0422.023.dat');
d6=importdata('ms-0422.024.dat');
d7=importdata('ms-0422.026.dat');
d8=importdata('ms-0422.030.dat');
d9=importdata('ms-0422.031.dat');
d10=importdata('ms-0422.043.dat');
d11=importdata('ms-0422.044.dat');
d12=importdata('ms-0422.048.dat');
d13=importdata('ms-0422.054.dat');
d14=importdata('ms-0422.060.dat');
d15=importdata('ms-0422.061.dat');
d16=importdata('ms-0422.066.dat');

% First column is "Calculated Z (nm)"
% Second column is "Deflection {nN)" invert it!
z1=d1.data(:,1); %extension in nm
f1=-d1.data(:,2); %force in nN

z2=d2.data(:,1); %extension in nm
f2=-d2.data(:,2); %force in nN

z3=d3.data(:,1); %extension in nm
f3=-d3.data(:,2); %force in nN

z4=d4.data(:,1); %extension in nm
f4=-d4.data(:,2); %force in nN

z5=d5.data(:,1); %extension in nm
f5=-d5.data(:,2); %force in nN

z6=d6.data(:,1); %extension in nm
f6=-d6.data(:,2); %force in nN

z7=d7.data(:,1); %extension in nm
f7=-d7.data(:,2); %force in nN

z8=d8.data(:,1); %extension in nm
f8=-d8.data(:,2); %force in nN

z9=d9.data(:,1); %extension in nm
f9=-d9.data(:,2); %force in nN

z10=d10.data(:,1); %extension in nm
f10=-d10.data(:,2); %force in nN

z11=d11.data(:,1); %extension in nm
f11=-d11.data(:,2); %force in nN

z12=d12.data(:,1); %extension in nm
f12=-d12.data(:,2); %force in nN

z13=d13.data(:,1); %extension in nm
f13=-d13.data(:,2); %force in nN

z14=d14.data(:,1); %extension in nm
f14=-d14.data(:,2); %force in nN

z15=d15.data(:,1); %extension in nm
f15=-d15.data(:,2); %force in nN

z16=d16.data(:,1); %extension in nm
f16=-d16.data(:,2); %force in nN

%******************************************************
% 5. Evaluate the mean force of unfolding.
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
print(p1,'-dpng','psh1');
hold off

% Query 2 peaks
% Make vector of 2 peak displacements 
[pks2,locs2]=findpeaks(f2,'MINPEAKDISTANCE',50);

pks2=pks2([6,8,11,12,13,14,15,18]);
locs2=locs2([6,8,11,12,13,14,15,18]);

% Shift 2
pks2=pks2-mean(f2(locs2(end):end));
f2=f2-mean(f2(locs2(end):end));

%Plot 2
p2=figure;
plot(z2,f2);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 2');

plot(z2(locs2),pks2,'or');
print(p2,'-dpng','psh2');
hold off

% Query 3 peaks
% Make vector of 3 peak displacements 
[pks3,locs3]=findpeaks(f3,'MINPEAKDISTANCE',40);

pks3=pks3([8,9,10,11,12,13,15,16,18]);
locs3=locs3([8,9,10,11,12,13,15,16,18]);

% Shift 3
pks3=pks3-mean(f3(locs3(end):end));
f3=f3-mean(f3(locs3(end):end));

% Plot 3
p3=figure;
plot(z3,f3);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 3');

plot(z3(locs3),pks3,'or');
print(p3,'-dpng','psh3');
hold off

% Query 4 peaks
% Make vector of 4 peak displacements 
[pks4,locs4]=findpeaks(f4,'MINPEAKDISTANCE',50);

pks4=pks4([8,9,10,12,13,14,16,18,20]);
locs4=locs4([8,9,10,12,13,14,16,18,20]);

% Shift 4
pks4=pks4-mean(f4(locs4(end):end));
f4=f4-mean(f4(locs4(end):end));

% Plot 4
p4=figure;
plot(z4,f4);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 4');

plot(z4(locs4),pks4,'or');
print(p4,'-dpng','psh4');
hold off

% Query 5 peaks
% Make vector of 5 peak displacements 
[pks5,locs5]=findpeaks(f5,'MINPEAKDISTANCE',50);

pks5=pks5([7,8,12,13,14,15,16,17,20]);
locs5=locs5([7,8,12,13,14,15,16,17,20]);

% Shift 5
pks5=pks5-mean(f5(locs5(end):end));
f5=f5-mean(f5(locs5(end):end));

% Plot 5
p5=figure;
plot(z5,f5);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 5');

plot(z5(locs5),pks5,'or');
print(p5,'-dpng','psh5');
hold off

% Query 6 peaks
% Make vector of 6 peak displacements 
[pks6,locs6]=findpeaks(f6,'MINPEAKDISTANCE',40);

pks6=pks6([8,10,12,14,15,17,19,20,21,24,25,26]);
locs6=locs6([8,10,12,14,15,17,19,20,21,24,25,26]);

% Shift 6
pks6=pks6-mean(f6(locs6(end):end));
f6=f6-mean(f6(locs6(end):end));

% Plot 6
p6=figure;
plot(z6,f6);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 6');

plot(z6(locs6),pks6,'or');
print(p6,'-dpng','psh6');
hold off

% Query 7 peaks
% Make vector of 7 peak displacements 
[pks7,locs7]=findpeaks(f7,'MINPEAKDISTANCE',60);

pks7=pks7([5,6,7,9,10,11]);
locs7=locs7([5,6,7,9,10,11]);

% Shift 7
pks7=pks7-mean(f7(locs7(end):end));
f7=f7-mean(f7(locs7(end):end));

% Plot 7
p7=figure;
plot(z7,f7);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 7');

plot(z7(locs7),pks7,'or');
print(p7,'-dpng','psh7');
hold off

% Query 8 peaks
% Make vector of 8 peak displacements 
[pks8,locs8]=findpeaks(f8,'MINPEAKDISTANCE',25);

pks8=pks8([13,14,15,16,17,20,21,22,24,26,33]);
locs8=locs8([13,14,15,16,17,20,21,22,24,26,33]);

% Shift 8
pks8=pks8-mean(f8(locs8(end):end));
f8=f8-mean(f8(locs8(end):end));

% Plot 8
p8=figure;
plot(z8,f8);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 8');

plot(z8(locs8),pks8,'or');
print(p8,'-dpng','psh8');
hold off

% Query 9 peaks
% Make vector of 9 peak displacements 
[pks9,locs9]=findpeaks(f9,'MINPEAKDISTANCE',35);

pks9=pks9([12,13,14,15,16,18,19,20,21]);
locs9=locs9([12,13,14,15,16,18,19,20,21]);

% Shift 9
pks9=pks9-mean(f9(locs9(end):end));
f9=f9-mean(f9(locs9(end):end));

% Plot 9
p9=figure;
plot(z9,f9);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 9');

plot(z9(locs9),pks9,'or');
print(p9,'-dpng','psh9');
hold off

% Query 10 peaks
% Make vector of 10 peak displacements 
[pks10,locs10]=findpeaks(f10,'MINPEAKDISTANCE',40);

pks10=pks10(11:19);
locs10=locs10(11:19);

% Shift 10
pks10=pks10-mean(f10(locs10(end):end));
f10=f10-mean(f10(locs10(end):end));

% Plot 10
p10=figure;
plot(z10,f10);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 10');

plot(z10(locs10),pks10,'or');
print(p10,'-dpng','psh10');
hold off


% Query 11 peaks
% Make vector of 11 peak displacements 
[pks11,locs11]=findpeaks(f11,'MINPEAKDISTANCE',25);

pks11=pks11([14,15,18,19,21,24]);
locs11=locs11([14,15,18,19,21,24]);

% Shift 11
pks11=pks11-mean(f11(locs11(end):end));
f11=f11-mean(f11(locs11(end):end));

% Plot 11
p11=figure;
plot(z11,f11);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 11');

plot(z11(locs11),pks11,'or');
print(p11,'-dpng','psh11');
hold off

% Query 12 peaks
% Make vector of 12 peak displacements 
[pks12,locs12]=findpeaks(f12,'MINPEAKDISTANCE',20);

pks12=pks12([15,16,18,19,20,22,25,27,30,33,36]);
locs12=locs12([15,16,18,19,20,22,25,27,30,33,36]);

% Shift 12
pks12=pks12-mean(f12(locs1(end):end));
f12=f12-mean(f12(locs12(end):end));

% Plot 12
p12=figure;
plot(z12,f12);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 12');

plot(z12(locs12),pks12,'or');
print(p12,'-dpng','psh12');
hold off

% Query 13 peaks
% Make vector of 13 peak displacements 
[pks13,locs13]=findpeaks(f13,'MINPEAKDISTANCE',40);

pks13=pks13([9,10,11,12,14,15,16,17,18,19,20,24,26]);
locs13=locs13([9,10,11,12,14,15,16,17,18,19,20,24,26]);

% Shift 13
pks13=pks13-mean(f13(locs13(end):end));
f13=f13-mean(f13(locs13(end):end));

% Plot 13
p13=figure;
plot(z13,f13);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 13');

plot(z13(locs13),pks13,'or');
print(p13,'-dpng','psh13');
hold off

% Query 14 peaks
% Make vector of 14 peak displacements 
[pks14,locs14]=findpeaks(f14,'MINPEAKDISTANCE',40);

pks14=pks14([8,10,11,14,15,16,18,19,21,22,23,25]);
locs14=locs14([8,10,11,14,15,16,18,19,21,22,23,25]);

% Shift 14
pks14=pks14-mean(f14(locs14(end):end));
f14=f14-mean(f14(locs14(end):end));

% Plot 14
p14=figure;
plot(z14,f14);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 14');

plot(z14(locs14),pks14,'or');
print(p14,'-dpng','psh14');
hold off

% Query 15 peaks
% Make vector of 15 peak displacements 
[pks15,locs15]=findpeaks(f15,'MINPEAKDISTANCE',40);

pks15=pks15([8,9,10,12,13,14,15,16,17,19,22,24,27]);
locs15=locs15([8,9,10,12,13,14,15,16,17,19,22,24,27]);

% Shift 15
pks15=pks15-mean(f15(locs15(end):end));
f15=f15-mean(f15(locs15(end):end));

% Plot 15
p15=figure;
plot(z15,f15);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 15');

plot(z15(locs15),pks15,'or');
print(p15,'-dpng','psh15');
hold off

% Query 16 peaks
% Make vector of 16 peak displacements 
[pks16,locs16]=findpeaks(f16,'MINPEAKDISTANCE',40);

pks16=pks16([8,11,12,13,15,16,17,18,20,22,24,26]);
locs16=locs16([8,11,12,13,15,16,17,18,20,22,24,26]);

% Shift 16
pks16=pks16-mean(f16(locs16(end):end));
f16=f16-mean(f16(locs16(end):end));

% Plot 16
p16=figure;
plot(z16,f16);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 16');

plot(z16(locs16),pks16,'or');
print(p16,'-dpng','psh16');
hold off

%**************************************************************************
% Smash all of the rupture peak values into one vector
rupt=vertcat(pks1,pks2,pks3,pks4,pks5,pks6,pks7,pks8,pks9,pks10,pks11,pks12,pks13,pks14,pks15,pks16);

avrupt=mean(rupt);
stdrupt=std(rupt);

%Histogram the rupture forces with a Gaussian fit on top
hrupt=figure;
histfit(rupt);
xlabel('Rupture force (nN)');
ylabel('Occurrences');
title('Titin extension Ig domain rupture force');
print(hrupt,'-dpng','hisrupt');

%*************************************************************************
% Fit to a Gaussian
[murupt,sigmarupt]=normfit(rupt);

csvwrite('Frupt.dat',vertcat(rupt,avrupt,stdrupt,murupt,sigmarupt));



