data_00 = [
// Vin Vref) Iout
0.0   1.2  0.755E-09;
0.5   1.2  0.7010E-09;
1.0   1.2  0.770E-09;
1.1   1.2  0.740E-09;
1.12  1.2  0.740E-09;
1.13  1.2  0.750E-09;
1.14  1.2  0.745E-09;
1.15  1.2  0.760E-09;
1.16  1.2  0.745E-09;
1.17  1.2  0.760E-09;
1.18  1.2  0.760E-09;
1.19  1.2  0.740E-09;
1.195 1.2  1.235E-09;
1.2   1.2  2.120E-09;
1.205 1.2  3.370E-09;
1.21  1.2  4.245E-09;
1.215 1.2  5.450E-09;
1.22  1.2  6.280E-09;
1.225 1.2  7.390E-09;
1.23  1.2  8.130E-09;
1.235 1.2  9.225E-09;
1.24  1.2  9.840E-09;
1.245 1.2 10.875E-09;
1.25  1.2 11.300E-09;
1.255 1.2 12.090E-09;
1.26  1.2 12.585E-09;
1.265 1.2 13.180E-09;
1.27  1.2 13.645E-09;
1.275 1.2 14.220E-09;
1.28  1.2 14.500E-09;
1.285 1.2 14.910E-09;
1.29  1.2 15.185E-09;
1.295 1.2 15.430E-09;
1.3   1.2 15.580E-09;
1.305 1.2 15.980E-09;
1.31  1.2 16.180E-09;
1.315 1.2 16.340E-09;
1.32  1.2 16.500E-09;
1.325 1.2 16.670E-09;
1.33  1.2 16.780E-09;
1.335 1.2 16.890E-09;
1.34  1.2 16.970E-09;
1.345 1.2 17.050E-09;
1.35  1.2 17.110E-09;
1.4   1.2 17.400E-09;
1.5   1.2 17.480E-09;
2.0   1.2 17.500E-09;
2.5   1.2 17.500E-09;
];
data_00(:,4) = data_00(:,1)-data_00(:,2);
data_00(:,3) = data_00(:,3) * 1E+09;


//polyfit
[p_gm,S_gm]=polyfit(data_00(13:28,4), data_00(13:28,3),1);

// Eval
range_gm = -0.005:0.005:0.07;
fit_gm = polyval(p_gm,range_gm,S_gm);

scf(1);clf(1);
plot2d("nn", data_00(:,4), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn",range_gm , fit_gm);p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-1.5;a.data_bounds(1,2)=0;a.data_bounds(2,1)=1.5;a.data_bounds(2,2)=20;
a=gca();a.data_bounds(1,1)=-0.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=0.2;a.data_bounds(2,2)=20;
//legend("Target program 100nA","Target program 50nA","Target program 10nA","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin-Vref","Iout [nA]");
