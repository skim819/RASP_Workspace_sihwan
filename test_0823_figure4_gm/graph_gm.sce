data_00 = [
// Vin Vref) Iout
1.0   1.2  -11.676E-09;
1.05  1.2  -11.085E-09;
1.06  1.2  -10.923E-09;
1.07  1.2  -10.720E-09;
1.08  1.2  -10.459E-09;
1.09  1.2  -10.120E-09;
1.1   1.2   -9.761E-09;
1.11  1.2   -9.125E-09;
1.12  1.2   -8.558E-09;
1.13  1.2   -7.876E-09;
1.14  1.2   -7.067E-09;
1.15  1.2   -6.101E-09;
1.16  1.2   -5.050E-09;
1.17  1.2   -3.770E-09;
1.18  1.2   -2.350E-09;
1.19  1.2   -0.820E-09;
1.2   1.2    0.745E-09;
1.21  1.2    2.390E-09;
1.22  1.2    3.945E-09;
1.23  1.2    5.403E-09;
1.24  1.2    6.713E-09;
1.25  1.2    7.655E-09;
1.26  1.2    8.836E-09;
1.27  1.2    9.625E-09;
1.28  1.2   10.296E-09;
1.29  1.2   10.845E-09;
1.3   1.2   11.275E-09;
1.31  1.2   11.605E-09;
1.32  1.2   11.885E-09;
1.33  1.2   12.102E-09;
1.34  1.2   12.242E-09;
1.35  1.2   12.380E-09;
1.4   1.2   12.668E-09

];
data_00(:,4) = data_00(:,1)-data_00(:,2);
data_00(:,3) = data_00(:,3) * 1E+09;


//polyfit
[p_gm,S_gm]=polyfit(data_00(12:22,4), data_00(12:22,3),1);

// Eval
range_gm = -0.05:0.01:0.05;
fit_gm = polyval(p_gm,range_gm,S_gm);

scf(1);clf(1);
plot2d("nn", data_00(:,4), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn",range_gm , fit_gm);p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds(1,1)=-0.3;a.data_bounds(1,2)=-15;a.data_bounds(2,1)=0.3;a.data_bounds(2,2)=15;
//a=gca();a.data_bounds(1,1)=-0.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=0.2;a.data_bounds(2,2)=20;
//legend("Target program 100nA","Target program 50nA","Target program 10nA","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin-Vref","Iout [nA]");
