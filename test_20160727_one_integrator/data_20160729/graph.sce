RAMP_ADC_Output_1=csvRead('./data_20160729/RAMP_ADC_Output_voltage.csv');
RAMP_ADC_Output_1(:,2)=RAMP_ADC_Output_1(:,2)*1e6;

scf(102); clf(102);
plot2d("nn", RAMP_ADC_Output_1(1:6,2), RAMP_ADC_Output_1(1:6,1)); //p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; p.children.mark_foreground = 1;p.children.line_mode = 'off'
xtitle("","time [us]", "Vout [V]"); //b=gca();b.data_bounds(1,1)=0.1; b=gca();b.data_bounds(1,2)=0.8; b.data_bounds(2,1)=1.2; b.data_bounds(2,2)=2;
