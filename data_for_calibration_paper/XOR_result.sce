cd('/home/ubuntu/RASP_Workspace/data_for_calibration_paper');

XOR_before_30_chip16=fscanfMat('XOR_before_compensation_30_chip16');
XOR_before_30_chip21=fscanfMat('XOR_before_compensation_30_chip21');
XOR_before_30_chip17=fscanfMat('XOR_before_compensation_30_chip17');
XOR_after_30_chip16=fscanfMat('XOR_after_compensation_30_chip16');
XOR_after_30_chip21=fscanfMat('XOR_after_compensation_30_chip21');
XOR_after_30_chip17=fscanfMat('XOR_after_compensation_30_chip17');

scf(1);clf(1);
plot2d("nn",XOR_before_30_chip16(:,1), XOR_before_30_chip16(:,4), style=1);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",XOR_before_30_chip16(:,1), XOR_before_30_chip16(:,2), style=2);p = get("hdl"); p = get("hdl"); p.children.line_style = 3; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1 0.5; 7 2.5];
scf(2);clf(2);
plot2d("nn",XOR_before_30_chip16(:,1), XOR_before_30_chip16(:,8), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1 0.5; 7 2.5];
scf(3);clf(3);
plot2d("nn",XOR_before_30_chip21(:,1), XOR_before_30_chip21(:,8), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1 0.5; 7 2.5];
scf(4);clf(4);
plot2d("nn",XOR_before_30_chip17(:,1), XOR_before_30_chip17(:,8), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1 0.5; 7 2.5];

scf(5);clf(5);
plot2d("nn",XOR_after_30_chip16(:,1), XOR_after_30_chip16(:,4), style=1);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",XOR_after_30_chip16(:,1), XOR_after_30_chip16(:,2), style=2);p = get("hdl"); p = get("hdl"); p.children.line_style = 3; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1 0.5; 7 2.5];
scf(6);clf(6);
plot2d("nn",XOR_after_30_chip16(:,1), XOR_after_30_chip16(:,8), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1 0.5; 7 2.5];
scf(7);clf(7);
plot2d("nn",XOR_after_30_chip21(:,1), XOR_after_30_chip21(:,8), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1 0.5; 7 2.5];
scf(8);clf(8);
plot2d("nn",XOR_after_30_chip17(:,1), XOR_after_30_chip17(:,8), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1 0.5; 7 2.5];
