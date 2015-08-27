clear data_00;clear data_01;
// data_00 : case 1, data_01 : case 2

data_00 = [
// @ 1uA 3uA 1uA 200nA 200nA  (big cap)
// Vref = 1V
// Vin(V) Current(A) Vout(V) Vfb(V)
2.2   10.0E-09 1.298 1.024;
2.25  36.0E-09 0.926 1.025;
2.26  49.0E-09 0.905 1.025;
2.27  62.0E-09 0.890 1.025;
2.28  82.0E-09 0.877 1.025;
2.29 104.2E-09 0.863 1.025;
2.3  126.0E-09 0.849 1.025;
2.31 159.0E-09 0.836 1.025;
2.32 192.0E-09 0.821 1.025;
2.33 232.5E-09 0.807 1.025;
2.34 276.4E-09 0.793 1.025;
2.35 321.0E-09 0.777 1.025;
2.38 495.0E-09 0.729 1.026;
2.4  626.0E-09 0.692 1.026;
//2.5  1.435E-06 0.394 1.368;
]

data_00(:,2) = data_00(:,2)*1E09;

scf(1);clf(1);
plot2d("nn", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1000;
//legend("Vin [V]","","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin [V]","Iin [nA]");

scf(2);clf(2);
plot2d("nl", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
//a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=800;
//legend("Vin [V]","","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin [V]","Iin [nA]");

scf(3);clf(3);
plot2d("nn", data_00(:,2), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn", data_00(:,2), data_00(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=1000;a.data_bounds(2,2)=2.5;
legend("Vout","Vfb","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","Iin [nA]","V [V]");



data_01 = [
// @ 1uA 3uA 1uA 100nA 200nA  (small cap)
// Vref = 1V
// Vin(V) Current(A) Vout(V) Vfb(V)
2.2   23.0E-09 2.422 0.785;
2.25  87.5E-09 2.420 0.829;
2.26 127.8E-09 2.411 0.879;
2.28 173.8E-09 2.291 1.005;
2.3  224.0E-09 2.092 1.013;
2.31 292.0E-09 1.861 1.014;
2.32 341.0E-09 1.704 1.014;
2.33 397.0E-09 1.536 1.015;
2.34 452.0E-09 1.368 1.016;
2.35 498.3E-09 1.240 1.016;
2.36 587.0E-09 0.990 1.017;
2.37 662.5E-09 0.785 1.017;
2.38 735.0E-09 0.578 1.018;
2.39 817.0E-09 0.464 1.020;
2.4  863.0E-09 0.398 1.026;
//2.5  1.435E-06 0.394 1.368;
]

data_01(:,2) = data_01(:,2)*1E09;

scf(4);clf(4);
plot2d("nn", data_01(:,1), data_01(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_01(:,1), data_01(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=1000;
//legend("Vin [V]","","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin [V]","Iin [nA]");

scf(5);clf(5);
plot2d("nl", data_01(:,1), data_01(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_01(:,1), data_01(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
//a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=800;
//legend("Vin [V]","","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin [V]","Iin [nA]");

scf(6);clf(6);
plot2d("nn", data_01(:,2), data_01(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn", data_01(:,2), data_01(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_01(:,1), data_01(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=1000;a.data_bounds(2,2)=2.5;
legend("Vout","Vfb","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","Iin [nA]","V [V]");



data_02 = [
// @ 1uA 3uA 200nA 100nA 200nA  (small cap)
// Vref = 1V
// Vin(V) Current(A) Vout(V) Vfb(V)
2.2  006.1E-09 2.463 0.822;
2.25 035.3E-09 2.462 0.853;
2.27 058.0E-09 2.462 0.895;
2.29 086.6E-09 2.342 1.010;
2.3  107.7E-09 2.048 1.018;
2.31 134.0E-09 1.631 1.020;
2.32 163.7E-09 0.821 1.024;
2.33 175.6E-09 0.383 1.229;
2.35 177.8E-09 0.382 1.815;
2.4  180.8E-09 0.383 2.355;
]

data_02(:,2) = data_02(:,2)*1E09;

scf(7);clf(7);
plot2d("nn", data_02(:,1), data_02(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_02(:,1), data_02(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=200;
//legend("Vin [V]","","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin [V]","Iin [nA]");

scf(8);clf(8);
plot2d("nl", data_02(:,1), data_02(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_02(:,1), data_02(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
//a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=800;
//legend("Vin [V]","","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin [V]","Iin [nA]");

scf(9);clf(9);
plot2d("nn", data_02(:,2), data_02(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn", data_02(:,2), data_02(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_02(:,1), data_02(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=200;a.data_bounds(2,2)=2.5;
legend("Vout","Vfb","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","Iin [nA]","V [V]");


data_03 = [
// @ 1uA 3uA 200nA 20nA 200nA  (small cap)
// Vref = 1V
// Vin(V) Current(A) Vout(V) Vfb(V)
2.2  003.9E-09 2.465 0.909;
2.25 025.2E-09 2.411 0.996;
2.26 034.2E-09 2.274 1.015;
2.27 045.6E-09 2.092 1.017;
2.28 060.0E-09 1.886 1.019;
2.29 076.6E-09 1.650 1.020;
2.3  093.2E-09 1.392 1.021;
2.31 120.0E-09 0.982 1.022;
2.32 148.6E-09 0.480 1.026;
2.35 159.3E-09 0.407 1.824;
2.4  161.5E-09 0.408 2.358;
]

data_03(:,2) = data_03(:,2)*1E09;

scf(10);clf(10);
plot2d("nn", data_03(:,1), data_03(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_03(:,1), data_03(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=200;
//legend("Vin [V]","","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin [V]","Iin [nA]");

scf(11);clf(11);
plot2d("nl", data_03(:,1), data_03(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_03(:,1), data_03(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
//a=gca();a.data_bounds(1,1)=2.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=2.5;a.data_bounds(2,2)=800;
//legend("Vin [V]","","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","Vin [V]","Iin [nA]");

scf(12);clf(12);
plot2d("nn", data_03(:,2), data_03(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn", data_03(:,2), data_03(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_03(:,1), data_03(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=200;a.data_bounds(2,2)=2.5;
legend("Vout","Vfb","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","Iin [nA]","V [V]");
