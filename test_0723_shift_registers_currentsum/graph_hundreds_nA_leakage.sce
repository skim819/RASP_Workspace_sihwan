data_00 = [
0 185E-09 184E-09 182E-09;
1 254E-09 216E-09 188E-09;
2 430E-09 313E-09 211E-09;
3 620E-09 417E-09 235E-09;
4 775E-09 505E-09 257E-09;
5 953E-09 609E-09 284E-09;
6 994E-09 631E-09 289E-09;
7 1.132E-06 706E-09 306E-09;
8 1.217E-06 753E-09 317E-09;
];
data_00(:,2) = data_00(:,2) * 1E+09;
data_00(:,3) = data_00(:,3) * 1E+09;
data_00(:,4) = data_00(:,4) * 1E+09;

scf(1);clf(1);
plot2d("nn", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_00(:,1), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nn", data_00(:,1), data_00(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.line_mode = 'off';
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=8;a.data_bounds(2,2)=1500;
//a.auto_ticks = ["off","on","on"];
//drawaxis(x=0:6,dir='d',tics='v');
legend("Target program 100nA","Target program 50nA","Target program 10nA","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","# of current source","Current [nA]");

data_00(:,5) = [0;diff(data_00(:,2))];
data_00(:,6) = [0;diff(data_00(:,3))];
data_00(:,7) = [0;diff(data_00(:,4))];

data_01 = [
1 253E-09 217E-09 187E-09;
2 363E-09 281E-09 205E-09;
3 390E-09 294E-09 206E-09;
4 359E-09 276E-09 203E-09;
5 391E-09 297E-09 208E-09;
6 235E-09 206E-09 186E-09;
7 362E-09 274E-09 199E-09;
8 299E-09 238E-09 192E-09;
];
data_01(:,2) = data_01(:,2) * 1E+09;
data_01(:,3) = data_01(:,3) * 1E+09;
data_01(:,4) = data_01(:,4) * 1E+09;
data_01(:,2) = data_01(:,2) - data_00(1,2);
data_01(:,3) = data_01(:,3) - data_00(1,3);
data_01(:,4) = data_01(:,4) - data_00(1,4);

scf(2);clf(2);
plot2d("nn", data_00(:,1), data_00(:,5));p = get("hdl"); p.children.mark_style = 2; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_01(:,1), data_01(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_00(:,1), data_00(:,6));p = get("hdl"); p.children.mark_style = 2; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nn", data_01(:,1), data_01(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nn", data_00(:,1), data_00(:,7));p = get("hdl"); p.children.mark_style = 2; p.children.mark_foreground = 3;p.children.line_mode = 'off';
plot2d("nn", data_01(:,1), data_01(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.line_mode = 'off';
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=8;a.data_bounds(2,2)=250;
legend("Target program 100nA","Target program 100nA","Target program 50nA","Target program 50nA","Target program 10nA","Target program 10nA","in_upper_right"); xtitle("","Current source number","Current (- offset) [nA]");


data_02 = [
0 190E-09 182E-09 191E-09;
1 342E-09 267E-09 208E-09;
2 473E-09 342E-09 224E-09;
3 589E-09 410E-09 239E-09; 
4 692E-09 474E-09 254E-09;
5 785E-09 535E-09 269E-09;
6 870E-09 591E-09 284E-09;
7 946E-09 642E-09 298E-09;
8 1.015E-06 688E-09 312E-09;
];
data_02(:,2) = data_02(:,2) * 1E+09;
data_02(:,3) = data_02(:,3) * 1E+09;
data_02(:,4) = data_02(:,4) * 1E+09;

scf(3);clf(3);
plot2d("nn", data_02(:,1), data_02(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_02(:,1), data_02(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nn", data_02(:,1), data_02(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.line_mode = 'off';
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=8;a.data_bounds(2,2)=1500;
//a.auto_ticks = ["off","on","on"];
//drawaxis(x=0:6,dir='d',tics='v');
legend("Target program 100nA","Target program 50nA","Target program 10nA","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","# of current source","Current [nA]");

data_02(:,5) = [0;diff(data_02(:,2))];
data_02(:,6) = [0;diff(data_02(:,3))];
data_02(:,7) = [0;diff(data_02(:,4))];

data_03 = [
1 341E-09 264E-09 208E-09;
2 343E-09 266E-09 208E-09;
3 335E-09 261E-09 207E-09;
4 337E-09 262E-09 206E-09; 
5 342E-09 268E-09 208E-09;
6 344E-09 267E-09 208E-09;
7 339E-09 264E-09 207E-09;
8 340E-09 264E-09 208E-09;
];
data_03(:,2) = data_03(:,2) * 1E+09;
data_03(:,3) = data_03(:,3) * 1E+09;
data_03(:,4) = data_03(:,4) * 1E+09;
data_03(:,2) = data_03(:,2) - data_02(1,2);
data_03(:,3) = data_03(:,3) - data_02(1,3);
data_03(:,4) = data_03(:,4) - data_02(1,4);

scf(4);clf(4);
plot2d("nn", data_02(:,1), data_02(:,5));p = get("hdl"); p.children.mark_style = 2; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_03(:,1), data_03(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_02(:,1), data_02(:,6));p = get("hdl"); p.children.mark_style = 2; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nn", data_03(:,1), data_03(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nn", data_02(:,1), data_02(:,7));p = get("hdl"); p.children.mark_style = 2; p.children.mark_foreground = 3;p.children.line_mode = 'off';
plot2d("nn", data_03(:,1), data_03(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.line_mode = 'off';
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=8;a.data_bounds(2,2)=250;
legend("Target program 100nA","Target program 100nA","Target program 50nA","Target program 50nA","Target program 10nA","Target program 10nA","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","Current source number","Current (- offset) [nA]");

