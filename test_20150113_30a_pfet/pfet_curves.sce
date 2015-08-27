scf(4)
clf(4)
// Voltage(V) Id(A) (@Vd=0V @Vs=2.5V)
Vg_sweep = [
0.0 15.84e-6;
0.1 15.75e-6;
0.2 15.65e-6;
0.3 15.54e-6;
0.4 15.40e-6;
0.5 15.24e-6;
0.6 15.04e-6;
0.7 14.79e-6;
0.8 14.46e-6;
0.9 14.01e-6
1.0 13.32e-6;
1.1 12.11e-6;
1.2 9.720e-6;
1.3 6.853e-6;
1.4 4.396e-6;
1.5 2.457e-6;
1.6 1.122e-6;
1.7 0.361e-6;
1.8 63.70e-9;
1.9 5.696e-9;
2.0 0.343e-9;
2.1 0.023e-9;
2.2 0.004e-9;
2.3 0.003e-9;
2.4 0.003e-9;
2.5 0.002e-9;
];
plot2d("nl", Vg_sweep(:,1), Vg_sweep(:,2),style=1)
p = get("hdl"); p.children.mark_mode = "off"; p.children.mark_style = 9; 
p.children.thickness = 2; p.children.mark_foreground = 1;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=3;a.data_bounds(2,2)=1D-03;
xtitle("","Vg [V]", "Id [A]");

scf(5)
clf(5)
// Voltage(V) Id(A) (@Vg=1.8V @Vs=2.5V)
Vd_sweep = [
0.0 64.05e-9;
0.1 64.04e-9;
0.2 63.93e-9;
0.3 63.95e-9;
0.4 63.98e-9;
1.0 63.77e-9;
1.1 63.06e-9;
1.2 63.20e-9;
1.3 63.19e-9;
1.4 62.05e-9;
1.5 62.10e-9;
1.6 62.01e-9;
1.7 61.90e-9;
1.8 61.75e-9;
1.9 61.30e-9;
2.0 60.83e-9;
2.1 60.50e-9;
2.2 60.09e-9;
2.3 59.39e-9;
2.4 55.50e-9;
2.43 49.76e-9;
2.45 42.11e-9;
2.48 20.40e-9;
2.5 0.002e-9;
];
plot2d("nl", Vd_sweep(:,1), Vd_sweep(:,2),style=1)
p = get("hdl"); p.children.mark_mode = "off"; p.children.mark_style = 9; 
p.children.thickness = 2; p.children.mark_foreground = 1;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=3;a.data_bounds(2,2)=1D-03;
xtitle("","Vd [V]", "Id [A]");

scf(6)
clf(6)
// Voltage(V) Id(A) (@Vg=1.7V @Vd=0V)
Vs_sweep = [
2.5 276.2e-9;
2.45 123.0e-9;
2.4 39.89e-9;
2.35 9.000e-9
2.3 1.560e-9;
2.2 0.010e-9;
];
plot2d("nl", Vs_sweep(:,1), Vs_sweep(:,2),style=1)
p = get("hdl"); p.children.mark_mode = "off"; p.children.mark_style = 9; 
p.children.thickness = 2; p.children.mark_foreground = 1;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=3;a.data_bounds(2,2)=1D-03;
xtitle("","Vs [V]", "Is [A]");
