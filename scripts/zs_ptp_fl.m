% Zachariah Sachs
% CHEM 26701
% 28 April 2013

% Atomic Force Microscopy

% Included in this script:
% -Inverted plots with circled peaks; printed 'pp#.png'
% -Histogram of peak-to-peak distances with Gaussian fit; printed 'hisptp.png'
% -Gaussian fit data returned at the end of 'Lcptp.dat'
%
% -Number of visible domains; visualized. First-to-last peak distance
%  divided by number of peaks
% -Histogram first-to-last peak distance divided by number peaks with
%  Gaussian fit; printed 'hisfl.png'
% -Gaussian fit data returned at the end of 'Lcfl.dat'

%***************************************************
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
% 4. Determine if the peaks are equally spaced.

% Plot 1
p1=figure;
plot(z1,f1);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 1');

% Query 1 peaks see http://www.mathworks.com/help/signal/ref/findpeaks.html
% Make vector of 1 peak displacements 
[pks1,locs1]=findpeaks(f1,'MINPEAKDISTANCE',60);

pks1=pks1(7:14);
locs1=locs1(7:14);

plot(z1(locs1),pks1,'or');
print(p1,'-dpng','pp1');
hold off

% For-loop a vector of 1 peak-peak distances
for i1=1:length(pks1)-1
ptp1(i1,1)=z1(locs1(i1+1))-z1(locs1(i1));
end

%Plot 2
p2=figure;
plot(z2,f2);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 2');

% Query 2 peaks
% Make vector of 2 peak displacements 
[pks2,locs2]=findpeaks(f2,'MINPEAKDISTANCE',50);

pks2=pks2([6,8,11,12,13,14,15,18]);
locs2=locs2([6,8,11,12,13,14,15,18]);

plot(z2(locs2),pks2,'or');
print(p2,'-dpng','pp2');
hold off

% For-loop a vector of 2 peak-peak distances
for i2=1:length(pks2)-1
ptp2(i2,1)=z2(locs2(i2+1))-z2(locs2(i2));
end

% Plot 3
p3=figure;
plot(z3,f3);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 3');

% Query 3 peaks
% Make vector of 3 peak displacements 
[pks3,locs3]=findpeaks(f3,'MINPEAKDISTANCE',40);

pks3=pks3([8,9,10,11,12,13,15,16,18]);
locs3=locs3([8,9,10,11,12,13,15,16,18]);

plot(z3(locs3),pks3,'or');
print(p3,'-dpng','pp3');
hold off

% For-loop a vector of 3 peak-peak distances
for i3=1:length(pks3)-1
ptp3(i3,1)=z3(locs3(i3+1))-z3(locs3(i3));
end

% Plot 4
p4=figure;
plot(z4,f4);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 4');

% Query 4 peaks
% Make vector of 4 peak displacements 
[pks4,locs4]=findpeaks(f4,'MINPEAKDISTANCE',50);

pks4=pks4([8,9,10,12,13,14,16,18,20]);
locs4=locs4([8,9,10,12,13,14,16,18,20]);

plot(z4(locs4),pks4,'or');
print(p4,'-dpng','pp4');
hold off

% For-loop a vector of 4 peak-peak distances
for i4=1:length(pks4)-1
ptp4(i4,1)=z4(locs4(i4+1))-z4(locs4(i4));
end

% Plot 5
p5=figure;
plot(z5,f5);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 5');

% Query 5 peaks
% Make vector of 5 peak displacements 
[pks5,locs5]=findpeaks(f5,'MINPEAKDISTANCE',50);

pks5=pks5([7,8,12,13,14,15,16,17,20]);
locs5=locs5([7,8,12,13,14,15,16,17,20]);

plot(z5(locs5),pks5,'or');
print(p5,'-dpng','pp5');
hold off

% For-loop a vector of 5 peak-peak distances
for i5=1:length(pks5)-1
ptp5(i5,1)=z5(locs5(i5+1))-z5(locs5(i5));
end

% Plot 6
p6=figure;
plot(z6,f6);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 6');

% Query 6 peaks
% Make vector of 6 peak displacements 
[pks6,locs6]=findpeaks(f6,'MINPEAKDISTANCE',40);

pks6=pks6([8,10,12,14,15,17,19,20,21,24,25,26]);
locs6=locs6([8,10,12,14,15,17,19,20,21,24,25,26]);

plot(z6(locs6),pks6,'or');
print(p6,'-dpng','pp6');
hold off

% For-loop a vector of 6 peak-peak distances
for i6=1:length(pks6)-1
ptp6(i6,1)=z6(locs6(i6+1))-z6(locs6(i6));
end

% Plot 7
p7=figure;
plot(z7,f7);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 7');

% Query 7 peaks
% Make vector of 7 peak displacements 
[pks7,locs7]=findpeaks(f7,'MINPEAKDISTANCE',60);

pks7=pks7([5,6,7,9,10,11]);
locs7=locs7([5,6,7,9,10,11]);

plot(z7(locs7),pks7,'or');
print(p7,'-dpng','pp7');
hold off

% For-loop a vector of 7 peak-peak distances
for i7=1:length(pks7)-1
ptp7(i7,1)=z7(locs7(i7+1))-z7(locs7(i7));
end

% Plot 8
p8=figure;
plot(z8,f8);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 8');

% Query 8 peaks
% Make vector of 8 peak displacements 
[pks8,locs8]=findpeaks(f8,'MINPEAKDISTANCE',25);

pks8=pks8([13,14,15,16,17,20,21,22,24,26,33]);
locs8=locs8([13,14,15,16,17,20,21,22,24,26,33]);

plot(z8(locs8),pks8,'or');
print(p8,'-dpng','pp8');
hold off

% For-loop a vector of 8 peak-peak distances
for i8=1:length(pks8)-1
ptp8(i8,1)=z8(locs8(i8+1))-z8(locs8(i8));
end

% Plot 9
p9=figure;
plot(z9,f9);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 9');

% Query 9 peaks
% Make vector of 9 peak displacements 
[pks9,locs9]=findpeaks(f9,'MINPEAKDISTANCE',35);

pks9=pks9([12,13,14,15,16,18,19,20,21]);
locs9=locs9([12,13,14,15,16,18,19,20,21]);

plot(z9(locs9),pks9,'or');
print(p9,'-dpng','pp9');
hold off

% For-loop a vector of 9 peak-peak distances
for i9=1:length(pks9)-1
ptp9(i9,1)=z9(locs9(i9+1))-z9(locs9(i9));
end

% Plot 10
p10=figure;
plot(z10,f10);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 10');

% Query 10 peaks
% Make vector of 10 peak displacements 
[pks10,locs10]=findpeaks(f10,'MINPEAKDISTANCE',40);

pks10=pks10(11:19);
locs10=locs10(11:19);

plot(z10(locs10),pks10,'or');
print(p10,'-dpng','pp10');
hold off

% For-loop a vector of 10 peak-peak distances
for i10=1:length(pks10)-1
ptp10(i10,1)=z10(locs10(i10+1))-z10(locs10(i10));
end

% Plot 11
p11=figure;
plot(z11,f11);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 11');

% Query 11 peaks
% Make vector of 11 peak displacements 
[pks11,locs11]=findpeaks(f11,'MINPEAKDISTANCE',25);

pks11=pks11([14,15,18,19,21,24]);
locs11=locs11([14,15,18,19,21,24]);

plot(z11(locs11),pks11,'or');
print(p11,'-dpng','pp11');
hold off

% For-loop a vector of 11 peak-peak distances
for i11=1:length(pks11)-1
ptp11(i11,1)=z11(locs11(i11+1))-z11(locs11(i11));
end

% Plot 12
p12=figure;
plot(z12,f12);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 12');

% Query 12 peaks
% Make vector of 12 peak displacements 
[pks12,locs12]=findpeaks(f12,'MINPEAKDISTANCE',20);

pks12=pks12([15,16,18,19,20,22,25,27,30,33,36]);
locs12=locs12([15,16,18,19,20,22,25,27,30,33,36]);

plot(z12(locs12),pks12,'or');
print(p12,'-dpng','pp12');
hold off

% For-loop a vector of 12 peak-peak distances
for i12=1:length(pks12)-1
ptp12(i12,1)=z12(locs12(i12+1))-z12(locs12(i12));
end

% Plot 13
p13=figure;
plot(z13,f13);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 13');

% Query 13 peaks
% Make vector of 13 peak displacements 
[pks13,locs13]=findpeaks(f13,'MINPEAKDISTANCE',40);

pks13=pks13([9,10,11,12,14,15,16,17,18,19,20,24,26]);
locs13=locs13([9,10,11,12,14,15,16,17,18,19,20,24,26]);

plot(z13(locs13),pks13,'or');
print(p13,'-dpng','pp13');
hold off

% For-loop a vector of 13 peak-peak distances
for i13=1:length(pks13)-1
ptp13(i13,1)=z13(locs13(i13+1))-z13(locs13(i13));
end

% Plot 14
p14=figure;
plot(z14,f14);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 14');

% Query 14 peaks
% Make vector of 14 peak displacements 
[pks14,locs14]=findpeaks(f14,'MINPEAKDISTANCE',40);

pks14=pks14([8,10,11,14,15,16,18,19,21,22,23,25]);
locs14=locs14([8,10,11,14,15,16,18,19,21,22,23,25]);

plot(z14(locs14),pks14,'or');
print(p14,'-dpng','pp14');
hold off

% For-loop a vector of 14 peak-peak distances
for i14=1:length(pks14)-1
ptp14(i14,1)=z14(locs14(i14+1))-z14(locs14(i14));
end

% Plot 15
p15=figure;
plot(z15,f15);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 15');

% Query 15 peaks
% Make vector of 15 peak displacements 
[pks15,locs15]=findpeaks(f15,'MINPEAKDISTANCE',40);

pks15=pks15([8,9,10,12,13,14,15,16,17,19,22,24,27]);
locs15=locs15([8,9,10,12,13,14,15,16,17,19,22,24,27]);

plot(z15(locs15),pks15,'or');
print(p15,'-dpng','pp15');
hold off

% For-loop a vector of 15 peak-peak distances
for i15=1:length(pks15)-1
ptp15(i15,1)=z15(locs15(i15+1))-z15(locs15(i15));
end

% Plot 16
p16=figure;
plot(z16,f16);
hold on
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 16');

% Query 16 peaks
% Make vector of 16 peak displacements 
[pks16,locs16]=findpeaks(f16,'MINPEAKDISTANCE',40);

pks16=pks16([8,11,12,13,15,16,17,18,20,22,24,26]);
locs16=locs16([8,11,12,13,15,16,17,18,20,22,24,26]);

plot(z16(locs16),pks16,'or');
print(p16,'-dpng','pp16');
hold off

% For-loop a vector of 16 peak-peak distances
for i16=1:length(pks16)-1
ptp16(i16,1)=z16(locs16(i16+1))-z16(locs16(i16));
end

%************************************************************************
% Smash all of the peak-peak vectors together
ptp=vertcat(ptp1,ptp2,ptp3,ptp4,ptp5,ptp6,ptp7,ptp8,ptp9,ptp10,ptp11,ptp12,ptp13,ptp14,ptp15,ptp16);
avgptp=mean(ptp);
stdptp=std(ptp);

% Histogram the peak-peak distances with Gaussian fit on top
hpp=figure;
histfit(ptp);
xlabel('Peak-to-peak displacements (nm)');
ylabel('Occurrences');
title('Titin Ig contour length: Peak separation');
print(hpp,'-dpng','hisptp');

%************************************************************************
% Fit to a Gaussian
[muptp,sigmaptp]=normfit(ptp);

csvwrite('Lcptp.dat',vertcat(ptp,avgptp,stdptp,muptp,sigmaptp));

%************************************************************************

% 3. Record the number of visible domains=the number of peaks. Visualize.
nd1=length(pks1);
quer1=figure;
lo1=locs1(1);
hi1=locs1(nd1);
plot(z1(lo1:hi1),f1(lo1:hi1));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 1');

nd2=length(pks2);
quer2=figure;
lo2=locs2(1);
hi2=locs2(nd2);
plot(z2(lo2:hi2),f2(lo2:hi2));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 2');

nd3=length(pks3);
quer3=figure;
lo3=locs3(1);
hi3=locs3(nd3);
plot(z3(lo3:hi3),f3(lo3:hi3));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 3');

nd4=length(pks4);
quer4=figure;
lo4=locs4(1);
hi4=locs4(nd4);
plot(z4(lo4:hi4),f4(lo4:hi4));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 4');

nd5=length(pks5);
quer5=figure;
lo5=locs5(1);
hi5=locs5(nd5);
plot(z5(lo5:hi5),f5(lo5:hi5));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 5');

nd6=length(pks6);
quer6=figure;
lo6=locs6(1);
hi6=locs6(nd6);
plot(z6(lo6:hi6),f6(lo6:hi6));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 6');

nd7=length(pks7);
quer7=figure;
lo7=locs7(1);
hi7=locs7(nd7);
plot(z7(lo7:hi7),f7(lo7:hi7));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 7');

nd8=length(pks8);
quer8=figure;
lo8=locs8(1);
hi8=locs8(nd8);
plot(z8(lo8:hi8),f8(lo8:hi8));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 8');

nd9=length(pks9);
quer9=figure;
lo9=locs9(1);
hi9=locs9(nd9);
plot(z9(lo9:hi9),f9(lo9:hi9));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 9');

nd10=length(pks10);
quer10=figure;
lo10=locs10(1);
hi10=locs10(nd10);
plot(z10(lo10:hi10),f10(lo10:hi10));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 10');

nd11=length(pks11);
quer11=figure;
lo11=locs11(1);
hi11=locs11(nd11);
plot(z11(lo11:hi11),f11(lo11:hi11));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 11');

nd12=length(pks12);
quer12=figure;
lo12=locs12(1);
hi12=locs12(nd12);
plot(z12(lo12:hi12),f12(lo12:hi12));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 12');

nd13=length(pks13);
quer13=figure;
lo13=locs13(1);
hi13=locs13(nd1);
plot(z13(lo13:hi13),f13(lo13:hi13));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 13');

nd14=length(pks14);
quer14=figure;
lo14=locs14(1);
hi14=locs14(nd14);
plot(z14(lo14:hi14),f14(lo14:hi14));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 14');

nd15=length(pks15);
quer15=figure;
lo15=locs15(1);
hi15=locs15(nd15);
plot(z15(lo15:hi15),f15(lo15:hi15));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 15');

nd16=length(pks16);
quer16=figure;
lo16=locs16(1);
hi16=locs16(nd16);
plot(z16(lo16:hi16),f16(lo16:hi16));
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)');
title('Titin extension 16');

%***************************************************************************
% 3. Histogram the total lengths found starting from the first to last
% breakage peaks divided by the number of domains. This gives one measure
% of the contuor length Lc. We get one length per data import.
L1=(z1(hi1)-z1(lo1))/nd1;
L2=(z2(hi2)-z2(lo2))/nd2;
L3=(z3(hi3)-z3(lo3))/nd3;
L4=(z4(hi4)-z4(lo4))/nd4;
L5=(z5(hi5)-z5(lo5))/nd5;
L6=(z6(hi6)-z6(lo6))/nd6;
L7=(z7(hi7)-z7(lo7))/nd7;
L8=(z8(hi8)-z8(lo8))/nd8;
L9=(z9(hi9)-z9(lo9))/nd9;
L10=(z10(hi10)-z10(lo10))/nd10;
L11=(z11(hi11)-z11(lo11))/nd11;
L12=(z12(hi12)-z12(lo12))/nd12;
L13=(z13(hi13)-z13(lo13))/nd13;
L14=(z14(hi14)-z14(lo14))/nd14;
L15=(z15(hi15)-z15(lo15))/nd15;
L16=(z16(hi16)-z16(lo16))/nd16;

Lcfl=[L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15,L16].';
avLcfl=mean(Lcfl);
stdLcfl=std(Lcfl);

%Histogram the average over peaks contour length with a Gaussian fit on top
hfl=figure;
histfit(Lcfl);
xlabel('Contour length, L_c (nm)');
ylabel('Occurrences');
title('Titin Ig contour length: First to last peak distance over number of peaks');
print(hfl,'-dpng','hisfl');

%**************************************************************************
%Fit to a Gaussian
[mulcfl,sigmalcfl]=normfit(Lcfl);

csvwrite('Lcfl.dat',vertcat(Lcfl,avLcfl,stdLcfl,mulcfl,sigmalcfl));


