data_00 = [
// Accumulation (10nA targeted)
// How many, Id[A](InDirect)S, Id[A](Direct)  Id[A](direct, cascode)
0   9.3E-09   9.8E-09   7.1E-09;
1  13.8E-09  18.5E-09  11.2E-09;
2  29.9E-09  27.0E-09  15.4E-09;
3  46.1E-09  34.8E-09  19.2E-09;
4  61.7E-09  42.8E-09  23.3E-09;
5  79.8E-09  50.9E-09  27.2E-09;
6  83.0E-09  59.1E-09  31.0E-09;
7  94.6E-09  66.8E-09  35.0E-09;
8 101.4E-09  74.3E-09  38.5E-09;
];
data_00(:,2) = data_00(:,2) * 1E+09;
data_00(:,3) = data_00(:,3) * 1E+09;
data_00(:,4) = data_00(:,4) * 1E+09;

scf(1);clf(1);
plot2d("nn", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_00(:,1), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nn", data_00(:,1), data_00(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.line_mode = 'off';
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=9;a.data_bounds(2,2)=120;
//a.auto_ticks = ["off","on","on"];
//drawaxis(x=0:6,dir='d',tics='v');
legend("Indirect FGs","Direct FGs","Direct FGs, Cascode","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","# of current source","Current [nA]");

data_00(:,5) = [0;diff(data_00(:,2))];
data_00(:,6) = [0;diff(data_00(:,3))];
data_00(:,7) = [0;diff(data_00(:,4))];

data_01 = [
// each (10nA targeted)
// No. Id[A](Indirect)S Id[A](Direct)
1 12.6E-09  18.8E-09  10.9E-09;
2 25.0E-09  18.9E-09  10.9E-09;
3 25.7E-09  18.3E-09  11.0E-09;
4 23.6E-09  18.3E-09  11.1E-09;
5 28.2E-09  18.9E-09  11.1E-09;
6 12.5E-09  18.9E-09  11.0E-09;
7 21.7E-09  18.7E-09  11.1E-09;
8 16.4E-09  18.8E-09  11.0E-09;
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
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=0;a.data_bounds(2,1)=9;a.data_bounds(2,2)=20;
legend("Indirect FGs","Indirect FGs","Direct FGs","Direct FGs","Direct FGs, Cascode","Direct FGs, Cascode","in_upper_right"); // "in_upper_left" "in_lower_right"
xtitle("","Current source number","Current (- offset) [nA]");


