% Zachariah Sachs
% CHEM 26701
% 28 April 2013

% Atomic Force Microscopy

% Included in this script:
% -Representative force data; printed 'dd#.png'
% -Histograms of forces in total data set; printed 'hh#.png'

%********************************************************************
% Should have taken temperature!
T=295; % in K

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
% Second column is "Deflection {nN)"
z1=d1.data(:,1); %extension in nm
f1=d1.data(:,2); %force in nN

z2=d2.data(:,1); %extension in nm
f2=d2.data(:,2); %force in nN

z3=d3.data(:,1); %extension in nm
f3=d3.data(:,2); %force in nN

z4=d4.data(:,1); %extension in nm
f4=d4.data(:,2); %force in nN

z5=d5.data(:,1); %extension in nm
f5=d5.data(:,2); %force in nN

z6=d6.data(:,1); %extension in nm
f6=d6.data(:,2); %force in nN

z7=d7.data(:,1); %extension in nm
f7=d7.data(:,2); %force in nN

z8=d8.data(:,1); %extension in nm
f8=d8.data(:,2); %force in nN

z9=d9.data(:,1); %extension in nm
f9=d9.data(:,2); %force in nN

z10=d10.data(:,1); %extension in nm
f10=d10.data(:,2); %force in nN

z11=d11.data(:,1); %extension in nm
f11=d11.data(:,2); %force in nN

z12=d12.data(:,1); %extension in nm
f12=d12.data(:,2); %force in nN

z13=d13.data(:,1); %extension in nm
f13=d13.data(:,2); %force in nN

z14=d14.data(:,1); %extension in nm
f14=d14.data(:,2); %force in nN

z15=d15.data(:,1); %extension in nm
f15=d15.data(:,2); %force in nN

z16=d16.data(:,1); %extension in nm
f16=d16.data(:,2); %force in nN

%************************************************************************
% 2. Plot. Print the good ones
p1=figure;
plot(z1,f1);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 1');
print(p1,'-dpng','dd1');

p2=figure;
plot(z2,f2);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 2');
print(p2,'-dpng','dd2');

p3=figure;
plot(z3,f3);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 3');
print(p3,'-dpng','dd3');

p4=figure;
plot(z4,f4);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 4');
print(p4,'-dpng','dd4');

p5=figure;
plot(z5,f5);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 5');
print(p5,'-dpng','dd5');

p6=figure;
plot(z6,f6);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 6');
print(p6,'-dpng','dd6');

p7=figure;
plot(z7,f7);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 7');
print(p7,'-dpng','dd7');

p8=figure;
plot(z8,f8);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 8');
print(p8,'-dpng','dd8');

p9=figure;
plot(z9,f9);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 9');
print(p9,'-dpng','dd9');

p10=figure;
plot(z10,f10);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 10');
print(p10,'-dpng','dd10');

p11=figure;
plot(z11,f11);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 11');
print(p11,'-dpng','dd11');

p12=figure;
plot(z12,f12);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 12');
print(p12,'-dpng','dd12');

p13=figure;
plot(z13,f13);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 13');
print(p13,'-dpng','dd13');

p14=figure;
plot(z14,f14);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 14');
print(p14,'-dpng','dd14');

p15=figure;
plot(z15,f15);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 15');
print(p15,'-dpng','dd15');

p16=figure;
plot(z16,f16);
xlabel('Z-deflection (nm)');
ylabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 16');
print(p16,'-dpng','dd16');

%********************************************************************
% 3. Histogram the "numbers found in your total data set"
%Does this mean the force, or the extension, or both, and individually or
%all at once? I'm going with force.

h1=figure;
hist(f1,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 1');
print(h1,'-dpng','hh1');

h2=figure;
hist(f2,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 2');
print(h2,'-dpng','hh2');

h3=figure;
hist(f3,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 3');
print(h3,'-dpng','hh3');

h4=figure;
hist(f4,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 4');
print(h4,'-dpng','hh4');

h5=figure;
hist(f5,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 5');
print(h5,'-dpng','hh5');

h6=figure;
hist(f6,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 6');
print(h6,'-dpng','hh6');

h7=figure;
hist(f7,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 7');
print(h7,'-dpng','hh7');

h8=figure;
hist(f8,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 8');
print(h8,'-dpng','hh8');

h9=figure;
hist(f9,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 9');
print(h9,'-dpng','hh9');

h10=figure;
hist(f10,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 10');
print(h10,'-dpng','hh10');

h11=figure;
hist(f11,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 11');
print(h11,'-dpng','hh11');

h12=figure;
hist(f12,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 12');
print(h12,'-dpng','hh12');

h13=figure;
hist(f13,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 13');
print(h13,'-dpng','hh13');

h14=figure;
hist(f14,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 14');
print(h14,'-dpng','hh14');

h15=figure;
hist(f15,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 15');
print(h15,'-dpng','hh15');

h16=figure;
hist(f16,100);
ylabel('Occurrences')
xlabel('Extension force (nN)'); %relative. positive force pushes on lever.
title('Titin extension 16');
print(h16,'-dpng','hh16');


