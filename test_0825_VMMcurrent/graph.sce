clear data_00;clear data_01;clear data_02;

data_00 = [
// Target current: 10uA (indirect FG)
// Vs(V) Id(A)@Vg=0.6V Id(A)@Vg=0V
1.60   1.50E-09    1.65E-09;
1.70   1.60E-09    3.65E-09;
1.80   2.70E-09   46.60E-09;
1.90  27.75E-09  357.68E-09;
2.00 257.60E-09    1.21E-06;
2.10 993.20E-09    2.55E-06;
2.20   2.26E-06    4.27E-06;
2.30   3.90E-06    6.23E-06;
2.40   5.88E-06    8.46E-06;
2.50   8.18E-06   10.99E-06;
]

scf(1);clf(1);
plot2d("nl", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl", data_00(:,1), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds(1,1)=1.6;a.data_bounds(1,2)=1E-09;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1E-04;
//a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1000;
legend("10uA, @Vg=0.6V","10uA, @Vg=0V","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vs [V]","Id [A]");


data_01 = [
// Target current: 1uA (indirect FG)
// Vs(V) Id(A)@Vg=0.6V Id(A)@Vg=0V
1.60   1.35E-09    1.35E-09;
1.70   1.35E-09    1.35E-09;
1.80   1.44E-09    1.28E-09;
1.90   1.30E-09    1.35E-09;
2.00   1.30E-09    1.95E-09;
2.10   1.87E-09   19.20E-09;
2.20  11.30E-09  203.30E-09;
2.30 137.00E-09  879.19E-09;
2.40 799.65E-09    2.13E-06;
2.50   1.86E-06    3.86E-06;
]

scf(2);clf(2);
plot2d("nl", data_01(:,1), data_01(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl", data_01(:,1), data_01(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds(1,1)=1.6;a.data_bounds(1,2)=1E-09;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1E-04;
//a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1000;
legend("1uA, @Vg=0.6V","1uA, @Vg=0V","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vs [V]","Id [A]");


data_02 = [
// Target current: 100nA (indirect FG)
// Vs(V) Id(A)@Vg=0.6V Id(A)@Vg=0V
1.60   1.41E-09    1.20E-09;
1.70   1.41E-09    1.25E-09;
1.80   1.44E-09    1.28E-09;
1.90   1.450E-09   1.35E-09;
2.00   1.48E-09    1.45E-09;
2.10   1.50E-09    1.86E-09;
2.20   1.55E-09    6.85E-09;
2.30   3.90E-09   89.64E-09;
2.40  51.33E-09  546.50E-09;
2.50 389.51E-09    1.61E-06;
]

scf(3);clf(3);
plot2d("nl", data_02(:,1), data_02(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl", data_02(:,1), data_02(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds(1,1)=1.6;a.data_bounds(1,2)=1E-09;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1E-04;
//a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1000;
legend("100nA, @Vg=0.6V","100nA, @Vg=0V","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vs [V]","Id [A]");

