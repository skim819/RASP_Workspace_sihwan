nFET_IdVg=csvRead('data_nFET_IdVg_chip15_30a.csv');
pFET_IdVg=csvRead('data_pFET_IdVg_chip15_30a.csv');
scf(1);clf(1);
plot2d("nl", nFET_IdVg(:,1), nFET_IdVg(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", pFET_IdVg(:,1), pFET_IdVg(:,2));p = get("hdl"); p.children.mark_style = 3; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vg(V)","Id(A)");

nFET_IdVs=csvRead('data_nFET_IdVs_chip15_30a.csv');
pFET_IdVs=csvRead('data_pFET_IdVs_chip15_30a.csv');
scf(2);clf(2);
plot2d("nl", nFET_IdVs(:,1), nFET_IdVs(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", pFET_IdVs(:,1), pFET_IdVs(:,2));p = get("hdl"); p.children.mark_style = 3; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vs(V)","Id(A)");

nFET_IdVd=csvRead('data_nFET_IdVd_chip15_30a.csv');
pFET_IdVd=csvRead('data_pFET_IdVd_chip15_30a.csv');
scf(3);clf(3);
plot2d("nl", nFET_IdVd(:,1), nFET_IdVd(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", pFET_IdVd(:,1), pFET_IdVd(:,2));p = get("hdl"); p.children.mark_style = 3; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vd(V)","Id(A)");


nFET_IdVg=csvRead('data_nFET_IdVg_chip13_30a.csv');
pFET_IdVg=csvRead('data_pFET_IdVg_chip13_30a.csv');
scf(4);clf(4);
plot2d("nl", nFET_IdVg(:,1), nFET_IdVg(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", pFET_IdVg(:,1), pFET_IdVg(:,2));p = get("hdl"); p.children.mark_style = 3; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vg(V)","Id(A)");

nFET_IdVs=csvRead('data_nFET_IdVs_chip13_30a.csv');
pFET_IdVs=csvRead('data_pFET_IdVs_chip13_30a.csv');
scf(5);clf(5);
plot2d("nl", nFET_IdVs(:,1), nFET_IdVs(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", pFET_IdVs(:,1), pFET_IdVs(:,2));p = get("hdl"); p.children.mark_style = 3; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vs(V)","Id(A)");

nFET_IdVd=csvRead('data_nFET_IdVd_chip13_30a.csv');
pFET_IdVd=csvRead('data_pFET_IdVd_chip13_30a.csv');
scf(6);clf(6);
plot2d("nl", nFET_IdVd(:,1), nFET_IdVd(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", pFET_IdVd(:,1), pFET_IdVd(:,2));p = get("hdl"); p.children.mark_style = 3; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vd(V)","Id(A)");


nFET_IdVd_1=csvRead('data_nFET_IdVd_chip13_30a.csv');
nFET_IdVd_2=csvRead('data_nFET_IdVd_chip15_30a.csv');
scf(7);clf(7);
plot2d("nl", nFET_IdVd_1(:,1), nFET_IdVd_1(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", nFET_IdVd_2(:,1), nFET_IdVd_2(:,2));p = get("hdl"); p.children.mark_style = 3; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vd(V)","Id(A)");


