clear data_00;clear data_01;clear data_02;

data_00 = [
// case 00
// Vin(V) Iout(A) R(ohm)
0.2 0.419E-06;
0.4 1.098E-06;
0.6 2.036E-06;
0.8 3.199E-06;
1.0 4.556E-06;
1.2 6.091E-06;
1.4 7.759E-06;
1.6 9.434E-06;
1.8 11.099E-06;
2.0 13.214E-06;
2.2 15.387E-06;
2.4 17.502E-06;
];

data_01 = [
// case 01 (indirect)
// Vin(V) Iout(A) R(ohm)
0.2 0.358E-06;
0.4 0.961E-06;
0.6 1.783E-06;
0.8 2.804E-06;
1.0 3.997E-06;
1.2 5.350E-06;
1.4 6.824E-06;
1.6 8.317E-06;
1.8 9.831E-06;
2.0 11.714E-06;
2.2 13.647E-06;
2.4 15.548E-06;
];

data_02 = [
// case 02 (direct)
// Vin(V) Iout(A) R(ohm)
0.2 0.305E-06;
0.4 0.845E-06;
0.6 1.588E-06;
0.8 2.502E-06;
1.0 3.551E-06;
1.2 4.714E-06;
1.4 5.943E-06;
1.6 7.149E-06;
1.8 8.364E-06;
2.0 9.846E-06;
2.2 11.359E-06;
2.4 12.848E-06;
];

for i=1:12
    data_00(i,3)=data_00(i,1)/data_00(i,2);
    data_01(i,3)=data_01(i,1)/data_01(i,2);
    data_02(i,3)=data_02(i,1)/data_02(i,2);
end

data_01(:,3)=(data_01(:,3)-data_00(:,3))/2;
data_02(:,3)=(data_02(:,3)-data_00(:,3))/2;

data_01(:,3)=data_01(:,3)/1E03; 
data_02(:,3)=data_02(:,3)/1E03; 

scf(1);clf(1);
plot2d("nn", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn", data_01(:,1), data_01(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn", data_02(:,1), data_02(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",range_gm , fit_gm);p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.3;a.data_bounds(1,2)=-15;a.data_bounds(2,1)=0.3;a.data_bounds(2,2)=15;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1E-06;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=20E-06;
legend("Case00","Case01","Case02","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin (V)","Iout [A]");

scf(2);clf(2);
plot2d("nl", data_01(:,1), data_01(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl", data_02(:,1), data_02(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",range_gm , fit_gm);p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.3;a.data_bounds(1,2)=-15;a.data_bounds(2,1)=0.3;a.data_bounds(2,2)=15;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1E03;
legend("Indirect","Direct","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","Vin (V)","R [k ohm]");
