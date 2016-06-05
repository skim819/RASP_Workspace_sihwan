XOR_before_30_chip16=fscanfMat('XOR_before_compensation_30_chip16');
XOR_after_30_chip16=fscanfMat('XOR_after_compensation_30_chip16');

scf(1);clf(1);
plot2d("nn",XOR_before_30_chip16(:,1), XOR_before_30_chip16(:,4), style=1);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",XOR_before_30_chip16(:,1), XOR_before_30_chip16(:,2), style=2);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",XOR_before_30_chip16(:,1), XOR_before_30_chip16(:,8), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 3;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1.5 0.7; 7.5 2.5];

scf(2);clf(2);
plot2d("nn",XOR_after_30_chip16(:,1), XOR_after_30_chip16(:,4), style=1);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",XOR_after_30_chip16(:,1), XOR_after_30_chip16(:,2), style=2);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",XOR_after_30_chip16(:,1), XOR_after_30_chip16(:,8), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 3;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//plot2d("nn",XOR_after_30_chip16(:,1), XOR_after_30_chip16(:,8), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="on"; p.children.mark_foreground = 1;
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[1.5 0.7; 7.5 2.5];
