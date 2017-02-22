format("v",16);
clc;
W(1:3,1:12)=1e-11
f0=logspace(2,3.61,12)
Gain_bias=linspace(4.000e-08,10e-6,12)
Feedback_bias=linspace(4.000e-10,6e-9,12)
State(1:24)=0
