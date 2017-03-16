%Programming Assignment
%Case :B -> Turbofan without a after burner 
%case B: Problem 1

% NAME : BARU RAVI VARMA
% ROLL NO: 14AE10007

%%ASSUMPTIONS : GAMMA VALUE IS CONSTANT AND EQUAL TO 1.4
%%CODE
clc;
clear all;
%Given'
Ma = 0.75;
r = 1.4;
f = 4.0;
P = 5.78; %Tt4/Ta
Q = 1+ ((r-1)/2) * Ma * Ma;
i = 1;
for FPR = 1.5 :0.25: 3%Fan Presuure Ratio 
    for CPR = 5 :5: 25 % Compressure Pressure Ratio
        FTR = FPR.^((r-1)/r);
        CTR = CPR.^((r-1)/r);
        l = ((CTR-1)+f*(FTR-1));
        m = (Q*CTR*(1-(Q/P)*l)-1);
        nr = P*m/(Q*CTR);
        n = nr/(Q-1);
        S1 = sqrt(n) -1;
        s2 = f * (sqrt((Q*FTR-1)/(Q-1)) - 1);
        NDT(i) = Ma * (S1+s2)/(1+f);
        i = i+1;
        
    end
end
%NDT(21) = 
NDT
h = 1;
for j = 1.5 : 0.25 : 3
    for k = 5 : 5 : 25
        FPR(h) = j;
        CPR(h) = k;
        h= h+1;
    end
end
FPR;
CPR;
figure
[x,y] = meshgrid(CPR,FPR);
z = griddata(CPR,FPR,NDT,x,y,'linear');
mesh(x,y,z);
axis tight; hold on;
plot3(x,y,z,'o')
xlabel('Compressor Pressure Ratio');
ylabel ('Fan Pressure Ratio');
zlabel ('Dimensionless Thrust');













