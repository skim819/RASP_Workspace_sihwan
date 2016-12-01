wta_result_chip21=csvRead('/home/ubuntu/RASP_Workspace/test_20161031_draper_lab_demo/data_calibration_iscas2016/MITE_ADC_Output_voltage_chip21.csv');
wta_result_chip11_30a=csvRead('/home/ubuntu/RASP_Workspace/test_20161031_draper_lab_demo/data_calibration_iscas2016/MITE_ADC_Output_voltage_chip11_30a.csv');
wta_result_chip14_30a=csvRead('/home/ubuntu/RASP_Workspace/test_20161031_draper_lab_demo/data_calibration_iscas2016/MITE_ADC_Output_voltage_chip14_30a.csv');

scf(1);clf(1);
plot2d("nn",wta_result_chip21(:,1), wta_result_chip21(:,2), style=1);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",wta_result_chip21(:,1), wta_result_chip21(:,3), style=2);p = get("hdl"); p = get("hdl"); p.children.line_style = 3; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vin [V]"); a=gca();a.data_bounds=[0 1.2; 0.07 2.2];

scf(2);clf(2);
plot2d("nn",wta_result_chip21(1:16,1), wta_result_chip21(1:16,4), style=1);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",wta_result_chip21(1:16,1), wta_result_chip21(17:32,4), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 3; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[0 0; 0.07 2.5];

scf(3);clf(3);
plot2d("nn",wta_result_chip11_30a(1:16,1), wta_result_chip11_30a(1:16,4), style=1);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",wta_result_chip11_30a(1:16,1), wta_result_chip11_30a(17:32,4), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 3; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[0 0; 0.07 2.5];

scf(4);clf(4);
plot2d("nn",wta_result_chip14_30a(1:16,1), wta_result_chip14_30a(1:16,4), style=1);p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",wta_result_chip14_30a(1:16,1), wta_result_chip14_30a(17:32,4), style=3);p = get("hdl"); p = get("hdl"); p.children.line_style = 3; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Time [s]","Vout [V]"); a=gca();a.data_bounds=[0 0; 0.07 2.5];
