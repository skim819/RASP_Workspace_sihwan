//Vref: 0.5V 1.5V 0.2V
LowsubVt_targetprogram = [
// target current (A) Frequency (Hz)
35E-12 40.43;
50E-12 80.89;
100E-12 239.1;
200E-12 576.1;
500E-12 1459;
//800E-12 1669;
1000E-12 2446;
2000E-12 4761;
5000E-12 6101;
10000E-12 16390;
];
LowsubVt_targetprogram(:,1)=LowsubVt_targetprogram(:,1)*30;

SubVt_targetprogram = [
// target current (A) Frequency (Hz)
2E-09 3185;
5E-09 7873;
10E-09 12700;
20E-09 16510;
];

scf(1);
clf(1);
//mtlb_semilogy(LowsubVt_targetprogram(:,1)), LowsubVt_targetprogram(:,2))
plot2d("ll", LowsubVt_targetprogram(:,1), LowsubVt_targetprogram(:,2), style=1);p=get("hdl");p.children.mark_mode="on";p.children.mark_style=9;p.children.thickness=3;p.children.mark_foreground=1;
plot2d("ll", SubVt_targetprogram(:,1), SubVt_targetprogram(:,2), style=2);p=get("hdl");p.children.mark_mode="on";p.children.mark_style=9;p.children.thickness=3;p.children.mark_foreground=2;
legend("Vgm=0V","Vgm=0.6V","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("", "Target Current (log) [A]","Frequency (log) [Hz]");
a=gca(); a.data_bounds=[1D-09 1D01;1D-06 1D+05];
