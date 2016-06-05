global file_name path fname extension chip_num board_num hex_1na;
cd("/home/ubuntu/RASP_Workspace/data_for_calibration_paper");
path =  pwd();
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_v2i.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_i2v.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_v2h.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_h2v.sce',-1);
hex_1na=int(diodeADC_v2h(diodeADC_i2v(1e-09,chip_num,brdtype),chip_num,brdtype));

exec('~/rasp30/prog_assembly/libs/scilab_code/linefit.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/ekvfit_diodeADC.sce',-1);

diodeADC_iv=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_diodeADC/data_diodeADC_chip"+chip_num+brdtype+"_ivdd25V");

Isat=diodeADC_iv(:,2);
Vout=diodeADC_iv(:,3);
Hex_code=diodeADC_iv(:,4);

epsilon=0.004;
plotting="off"; //"on_all" or "on_final" or "off"
[Is, VT, kappa]=ekvfit_diodeADC(Vout, Isat, epsilon, plotting);
//disp('EKV Fit: I_s = '+string(Is)+'A, V_T = '+string(VT)+'V, Kappa = '+string(kappa));

epsilon=1;
[WIfirst, WIlast, Slope_v2h, Offset_v2h, WIN]=linefit(Vout, Hex_code, epsilon);

csvWrite([Is, VT, kappa, Slope_v2h, Offset_v2h],'EKV_diodeADC');
unix_w("cp EKV_diodeADC ~/rasp30/prog_assembly/libs/chip_parameters/EKV_diodeADC/EKV_diodeADC_chip"+chip_num+brdtype);

EKV_diodeADC_para=csvRead("~/rasp30/prog_assembly/libs/chip_parameters/EKV_diodeADC/EKV_diodeADC_chip"+chip_num+brdtype);
Is=EKV_diodeADC_para(1); VT=EKV_diodeADC_para(2); kappa=EKV_diodeADC_para(3); Slope_v2h=EKV_diodeADC_para(4); Offset_v2h=EKV_diodeADC_para(5);

//Isat2=diodeADC_v2i(Vout, chip_num, brdtype);
//Vout2=diodeADC_i2v(Isat2, chip_num, brdtype);

vdd=2.5;
Vfg=vdd-(Vout/2);

scf(2);clf(2);
plot2d("nl",Vfg, Isat, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off"; 
plot2d("nl", Vfg, diodeADC_v2i(Vfg, chip_num, brdtype), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend("Data","EKV fit","in_lower_left");
xtitle("","Vfg [V]","Iprog [A]"); a=gca();a.data_bounds=[1.3 1e-13; 2.4 5e-4];
title(['EKV Fit: I_s = '+string(Is)+'A, V_T = '+string(VT)+'V, Kappa = '+string(kappa)]);
scf(3);clf(3);
plot2d("ln",Isat, 2*(vdd-Vfg), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off"; 
//plot2d("ln",Isat, 2*(vdd-diodeADC_v2i(Vfg, chip_num, brdtype), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend("Data","EKV fit","in_upper_left");
xtitle("","Iprog [A])","Vprog [V]"); 
a=gca();a.data_bounds=[1e-12 0.4; 1e-4 2.4];
//title(['EKV Fit: I_s = '+string(Is)+'A, V_T = '+string(VT)+'V, Kappa = '+string(kappa)]);
scf(4);clf(4);
plot2d("nn", 2*(vdd-Vfg), Hex_code, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
plot2d("nn", 2*(vdd-Vfg), diodeADC_v2h(Vfg, chip_num, brdtype), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend("Data","Data for linefit","linefit","in_lower_right");
a=gca();a.data_bounds=[0.4 1000; 2.4 10000];
xtitle("","Vprog [V]","Hex_code");
//title('Vfg vs. Hex code Fit');


//scf(5);clf(5);
//plot2d("nl", diode_ivdd25V(:,4), diode_ivdd25V(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//plot2d("nl", ADC_range_ivdd25V, exp(diode_fit_ivdd25V), style=5);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//plot2d("nl", diodeADC_v2h(Vfg, chip_num, brdtype), diodeADC_v2i(Vfg, chip_num, brdtype), style=2);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//legend("data","Polyfit","EKV_fit","in_lower_right");
//xtitle("","Hex_code","Isat(A)");
//title('Polyfit vs. EKVfit');
//
//Current_to_ADC(:,3)=diodeADC_v2h(diodeADC_i2v(Current_to_ADC(:,1), chip_num, brdtype), chip_num, brdtype);
//
//disp(Current_to_ADC);
