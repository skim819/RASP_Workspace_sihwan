RAMP_ADC_Output_1=csvRead('./data_20160728/RAMP_ADC_Output_voltage_wo_compensation.csv');
RAMP_ADC_Output_2=csvRead('./data_20160728/RAMP_ADC_Output_voltage_wo_compensation_bias50pA.csv');
RAMP_ADC_Output_3=csvRead('./data_20160728/RAMP_ADC_Output_voltage_wo_compensation_bias200pA.csv');
RAMP_ADC_Output_4=csvRead('./data_20160728/RAMP_ADC_Output_voltage_wo_compensation_bias500pA.csv');
RAMP_ADC_Output_5=csvRead('./data_20160728/RAMP_ADC_Output_voltage_wo_compensation_bias800pA.csv');
RAMP_ADC_Output_6=csvRead('./data_20160728/RAMP_ADC_Output_voltage_wo_compensation_bias10nA.csv');
RAMP_ADC_Output_7=csvRead('./data_20160728/RAMP_ADC_Output_voltage_wo_compensation_bias50nA.csv');
RAMP_ADC_Output_8=csvRead('./data_20160728/RAMP_ADC_Output_voltage_wo_compensation_bias100nA.csv');

    
scf(102); clf(102);
plot2d("nn", RAMP_ADC_Output_1(:,2), RAMP_ADC_Output_1(:,1)); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; p.children.mark_foreground = 1;
plot2d("nn", RAMP_ADC_Output_2(:,2), RAMP_ADC_Output_2(:,1)); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn", RAMP_ADC_Output_3(:,2), RAMP_ADC_Output_3(:,1)); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn", RAMP_ADC_Output_4(:,2), RAMP_ADC_Output_4(:,1)); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn", RAMP_ADC_Output_5(:,2), RAMP_ADC_Output_5(:,1)); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn", RAMP_ADC_Output_6(:,2), RAMP_ADC_Output_6(:,1)); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn", RAMP_ADC_Output_7(:,2), RAMP_ADC_Output_7(:,1)); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn", RAMP_ADC_Output_8(:,2), RAMP_ADC_Output_8(:,1)); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","time [s]", "Vout [V]"); b=gca();b.data_bounds(1,1)=0.1; b=gca();b.data_bounds(1,2)=0.8; b.data_bounds(2,1)=1.2; b.data_bounds(2,2)=2;
