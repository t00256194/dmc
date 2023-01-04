clearvars; clc;

%% Beam Properties (m and kg)
b = 0.025;              %width       
h = 0.006;              %height
l = 0.317;              %length
m = 0.1371;             %mass
E = 70e9;               %Modulus

%% Tip Mass (kg)
a = 0.0181;             %accelerometer
br = 0.2399;            %brass
M = a+br;               %total tip mass

%% Accounting for overhang
fl = 0.271;             %free length (m)
mpl = m/l;              %beam mass per length
fm = mpl*fl;            %free length mass (kg)

%% SDOF equivalent system
I = (b*h^3)/12;
keq = (3*E*I)/(4*fl^3);
meq = 0.23*m + M;

%% Result
w_n = sqrt(keq/meq)
