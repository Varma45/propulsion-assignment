%Programming Assignment
%Case :A -> Turbojet without a after burner 
%case A: Problem 1

% NAME : BARU RAVI VARMA
% ROLL NO: 14AE10007

%%ASSUMPTIONS : GAMMA VALUE IS CONSTANT AND EQUAL TO 1.4
%%CODE
clc;
clear all;
%GIVEN
Ma = 0.75;  %Mach Number
r = 1.4;    %gamma value
P = 6;      %Tt4/Tta
N = 150 ;   %del H/Cp*Ta

%%
Q = 1+ ((r-1)/2 ) * Ma*Ma  %Tta/Ta
i = 1;
for CPR = 5 : 2.5 : 25; %Compressor pressure ratios
    CTR = CPR.^((r-1)/r); %Compressor Temperature ratios
    j = (Q/(Q-1));
    k = (P/(Q*CTR)) - 1;
    l = (CTR-1) ;
    m= (P/(Q*CTR));
    us = j*k*l+m;
    NDT(i) =[ Ma * ( sqrt(us) - 1)]; %Non Dimensionalised thrust
    Nr =  ( P - Q*CTR)/(N*Ma) ;
    TSFCa(i) = Nr/( sqrt(us) - 1);  %Thrust specific fuel consumption * aa
    i = i+1;
end
CPR = 5 : 2.5 : 25;
NDT;
TSFCa;
[AX, AX1, AX2]=plotyy(CPR, NDT, CPR, TSFCa)  %PLOTTING AND OBTAINING AXES HANDLE
ylabel(AX(1),'Non Dimensionalized Thrust') %LABEL LEFT X- AXIS
ylabel(AX(2),'TSFC*aa') %LABEL RIGHT Y-AXIS
xlabel(AX(2),'COMPRESSOR PRESSURE RATIO') %LABEL X-AXIS








