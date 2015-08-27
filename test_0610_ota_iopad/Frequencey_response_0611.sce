// Frequency Response
// Experiment Condition: Input (+- 100mV)
Input_Amplitude= 200; // (mV)

// Gain_OTA 1uA Feedback_OTA 10nA
Freq_resp_1uA_10nA = [
// Freq(Hz) Amplitude (mV)
10E06 44;
5E06 44;
1E06 120;
500E03 196;
100E03 408;
50E03 464;
10E03 204;
5E03 168;
1E03 144;
500 144;
100 140;
];

Freq_resp_10uA_100nA = [
// Freq(Hz) Amplitude (mV)
10E06 28;
5E06 24;
1E06 204;
500E03 376;
100E03 84;
50E03 52;
10E03 32;
5E03 32;
1E03 32;
500 32;
100 32;
];

Freq_resp_1uA_100nA = [
// Freq(Hz) Amplitude (mV)
10E06 16;
5E06 36;
1E06 72;
500E03 120;
100E03 92;
50E03 60;
10E03 40;
5E03 40;
1E03 32;
500 32;
100 32;
];

scf(1);
clf(1);
plot2d("nn", log10(Freq_resp_1uA_10nA(:,1)), log10(Freq_resp_1uA_10nA(:,2)/Input_Amplitude), style=1);p=get("hdl");p.children.mark_mode="on";p.children.mark_style=9;p.children.thickness=3;p.children.mark_foreground=1;
plot2d("nn", log10(Freq_resp_10uA_100nA(:,1)), log10(Freq_resp_10uA_100nA(:,2)/Input_Amplitude), style=2);p=get("hdl");p.children.mark_mode="on";p.children.mark_style=9;p.children.thickness=3;p.children.mark_foreground=2;
plot2d("nn", log10(Freq_resp_1uA_100nA(:,1)), log10(Freq_resp_1uA_100nA(:,2)/Input_Amplitude), style=3);p=get("hdl");p.children.mark_mode="on";p.children.mark_style=9;p.children.thickness=3;p.children.mark_foreground=3;
legend("1uA_10nA","10uA_100nA","1uA_100nA","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","Frequency (log) [Hz]", "Gain (log)");
a=gca(); //a.data_bounds=[1D-02 -2;1D+05  2];
