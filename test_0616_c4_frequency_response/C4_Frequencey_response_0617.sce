// Frequency Response
// Experiment Condition: Input (+- 100mV)
Input_Amplitude= 207; // (mV)

// Input cap: x18, Input cap: x6,  Gain_OTA 500pA Feedback_OTA 35pA
Freq_resp_x18_x6_500pA_35pA = [
// Freq(Hz) Amplitude (mV)
0.5 33.83;
1 63.83;
2 138.4;
5 349.1;
10 298.3;
20 167.4;
50 71.25;
100 46.33;
200 33.2;
500 27.81;
];

// Input cap: x18, Input cap: x6,  Gain_OTA 500pA Feedback_OTA 35pA
Freq_resp_x18_x1_500pA_35pA = [
// Freq(Hz) Amplitude (mV)
0.5 37.27;
1 65.23;
2 137.4;
5 829.8;
10 635;
20 309.8;
50 116.4;
100 62.19;
200 38.75;
500 27.11;
];

scf(1);
clf(1);
plot2d("ll", Freq_resp_x18_x6_500pA_35pA(:,1), Freq_resp_x18_x6_500pA_35pA(:,2)/Input_Amplitude, style=1);p=get("hdl");p.children.mark_mode="on";p.children.mark_style=9;p.children.thickness=3;p.children.mark_foreground=1;
plot2d("ll", Freq_resp_x18_x1_500pA_35pA(:,1), Freq_resp_x18_x1_500pA_35pA(:,2)/Input_Amplitude, style=2);p=get("hdl");p.children.mark_mode="on";p.children.mark_style=9;p.children.thickness=3;p.children.mark_foreground=2;
legend("x18_x6_500pA_35pA","x18_x1_500pA_35pA","in_upper_right"); // "in_upper_left" "in_lower_right"
//legend("x18_x1_500pA_35pA","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","Frequency [Hz]", "Gain (log)");
a=gca(); a.data_bounds=[1E-01 1E-01;1E+04 1E+01];
