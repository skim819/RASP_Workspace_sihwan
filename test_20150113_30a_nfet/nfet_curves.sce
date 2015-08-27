scf(1)
clf(1)
// Voltage(V) Id(A) (@Vd=2.5V @Vs=0V)
Vg_sweep = [
0.2 0.200e-9;
0.3 2.800e-9;
0.4 45.80e-9;
0.5 325.0e-9; 
0.6 1.013e-6;
0.7 2.039e-6;
0.8 3.376e-6;
0.9 4.978e-6;
1.0 6.800e-6;
1.1 8.995e-6;
1.2 11.38e-6;
1.3 14.04e-6;
1.4 16.85e-6;
1.5 17.83e-6;
1.6 17.98e-6;
1.7 18.06e-6;
1.8 18.10e-6
1.9 18.13e-6;
2.0 18.20e-6;
2.1 18.17e-6;
2.2 18.18e-6;
2.3 18.19e-6;
2.4 18.20e-6;
2.5 18.21e-6;
];
plot2d("nl", Vg_sweep(:,1), Vg_sweep(:,2),style=1)
p = get("hdl"); p.children.mark_mode = "off"; p.children.mark_style = 9; 
p.children.thickness = 2; p.children.mark_foreground = 1;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=3;a.data_bounds(2,2)=1D-03;
xtitle("","Vg [V]", "Id [A]");

scf(2)
clf(2)
// Voltage(V) Id(A) (@Vg=0.4V @Vs=0V)
Vd_sweep = [
0.2 0.100e-9;
0.3 3.120e-9;
0.4 38.20e-9;
0.5 43.40e-9;
0.6 41.85e-9;
0.7 43.89e-9;
0.8 44.20e-9;
0.9 44.50e-9;
1.0 44.30e-9;
1.1 42.06e-9;
1.2 42.10e-9;
1.3 42.20e-9;
1.4 42.18e-9;
1.5 42.30e-9;
1.6 42.18e-9;
1.7 42.00e-9;
1.8 42.15e-9;
1.9 42.25e-9;
2.0 44.50e-9;
2.1 43.05e-9;
2.2 44.15e-9;
2.3 43.95e-9;
2.4 43.85e-9;
2.5 43.40e-9;
];
plot2d("nl", Vd_sweep(:,1), Vd_sweep(:,2),style=1)
p = get("hdl"); p.children.mark_mode = "off"; p.children.mark_style = 9; 
p.children.thickness = 2; p.children.mark_foreground = 1;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=3;a.data_bounds(2,2)=1D-03;
xtitle("","Vd [V]", "Id [A]");

scf(3)
clf(3)
// Voltage(V) Id(A) (@Vg=1V @Vd=2.5V)
Vs_sweep = [
0.0 98.12e-9;
0.1 96.14e-9;
0.2 93.74e-9;
0.3 89.39e-9;
0.4 67.53e-9;
0.5 13.75e-9;
0.6 0.427e-9;
0.7 0.010e-9;
0.8 0.003e-9;
];
plot2d("nl", Vs_sweep(:,1), Vs_sweep(:,2),style=1)
p = get("hdl"); p.children.mark_mode = "off"; p.children.mark_style = 9; 
p.children.thickness = 2; p.children.mark_foreground = 1;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=3;a.data_bounds(2,2)=1D-03;
xtitle("","Vs [V]", "Is [A]");
