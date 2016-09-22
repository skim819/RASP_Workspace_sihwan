clear mite_473_977_10uA;
mite_473_977_10uA=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_miteADC/data_miteADC473_977_chip"+chip_num+brdtype);
//polyfit
[p_mite_977_10uA,S_mite_977_10uA]=polyfit(mite_473_977_10uA(:,1), mite_473_977_10uA(:,2),7);
size_a=size(mite_473_977_10uA);
//MITE_range_977 = mite_473_977_10uA(size_a(1,1),1):1:mite_473_977_10uA(1,1);
MITE_range_977 = mite_473_977_10uA(size_a(1,1),1):1:9600;
MITE_fit_977 = polyval(p_mite_977_10uA,MITE_range_977,S_mite_977_10uA);


scf(7);clf(7);
plot2d("nn", mite_473_977_10uA(:,1), mite_473_977_10uA(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nn", MITE_range_977, MITE_fit_977, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
a=gca();//a.data_bounds=[0 0; 150 2.6];
legend("mite_473_977","mite_473_978","mite_473_979","in_upper_right");
xtitle("","ADC code","Vg (V)");

// Vg=0.005 !!!!! to make 0x0078

clear onchip_dac02_char_data;
onchip_dac02_char_data=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_onchipDAC/data_onchipDAC02_chip"+chip_num+brdtype);
[p_onchip_dac02,S_onchip_dac02]=polyfit(onchip_dac02_char_data(:,1), onchip_dac02_char_data(:,2),3);
DAC02_HEX_range = hex2dec('0000'):1:hex2dec('007F');
DAC02_fit = polyval(p_onchip_dac02,DAC02_HEX_range,S_onchip_dac02);
DAC02_char_table = [DAC02_HEX_range(:) DAC02_fit(:)];

// Plot the data
scf(6); clf(6);
plot2d("nn", onchip_dac02_char_data(:,1), onchip_dac02_char_data(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=3;
plot2d("nn", DAC02_HEX_range, DAC02_fit, style=3);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
a=gca();a.data_bounds=[0 0; 150 2.6];
legend("DAC00","DAC01","DAC02","DAC03","DAC04","DAC05","DAC06","DAC07","DAC08","DAC09","in_upper_right");
xtitle("","ADC code","Vg (V)");



