nFET_IdVd=[ //Vd Id cascode-Vg
1.40 67.00e-9 2.4;
1.19 66.90e-9 2.0;
0.95 62.8e-9 1.7;
0.78 62.2e-9 1.5;
0.69 62.1e-9 1.4;
0.59 61.5e-9 1.3;
0.50 61.3e-9 1.2;
0.41 61.2e-9 1.1;
0.31 63.1e-9 1.0;
0.26 37.5e-9 0.9;
0.23 12.5e-9 0.8;
0.19 03.65e-9 0.7;
0.155 0.993e-9 0.6;
0.125 0.264e-9 0.5;
0.08 0.069e-9 0.4;
0.046 0.018e-9 0.3;
0.02 4.5e-12 0.2;
0.01 1.2e-12 0.1;
0.0011 0.76e-12 0.0;
];

//nFET_IdVd=csvRead('data_nFET_IdVd.csv');
scf(3);clf(3);
plot2d("nl", nFET_IdVd(:,1), nFET_IdVd(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
//a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vd(V)","Id(A)");
