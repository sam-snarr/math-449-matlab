close all
hold on 
C=2; qpicard_1
C=1; qpicard_1
C=0.5; qpicard_1
C=5; qpicard_1
C=0.1; qpicard_1
C=-0.1; qpicard_1
C=-0.5; qpicard_1

figure
hold on
C=2;
f = @(t) 1/(t+1/C);
fplot(f)
xlim([0,5])

C=1;
f = @(t) 1/(t+1/C);
fplot(f)
xlim([0,5])

C=0.5;
f = @(t) 1/(t+1/C);
fplot(f)
xlim([0,5])

C=5;
f = @(t) 1/(t+1/C);
fplot(f)
xlim([0,5])

C=0.1;
f = @(t) 1/(t+1/C);
fplot(f)
xlim([0,5])

C=-0.1;
f = @(t) 1/(t+1/C);
fplot(f)
xlim([0,5])

C=-0.5;
f = @(t) 1/(t+1/C);
fplot(f)
xlim([0,5])