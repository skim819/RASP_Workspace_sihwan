global file_name path fname extension chip_num board_num hex_1na;
cd("/home/ubuntu/RASP_Workspace/data_for_calibration_paper");
path =  pwd();
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_v2i.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_i2v.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_v2h.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_h2v.sce',-1);
hex_1na=int(diodeADC_v2h(diodeADC_i2v(1e-09,chip_num,brdtype),chip_num,brdtype));

// -------- Calculate nbios for DC in block for pfet gate voltage ----------//
DC_in_char = [3.0e-06 2.4462;2.5e-06 2.4163;2.0e-06 2.2968;1.5e-06 2.0720;1.0e-06 1.7760;0.9e-06 1.7016;0.8e-06 1.6102;0.7e-06 1.5330;0.6e-06 1.4284;0.5e-06 1.3176;0.4e-06 1.1920;0.3e-06 1.0064;0.2e-06 0.7770;0.15e-06 0.6270;0.10e-06 0.4000;0.08e-06 0.3044;0.05e-06 0.1250];
[p_DC_in,S_DC_in]=polyfit(DC_in_char(:,2),log(DC_in_char(:,1)),1);
//pfetg_fgotanbias=exp(polyval(p_DC_in,pfet_Vg,S_DC_in));
DC_in_char(:,3)=DC_in_char(:,1)/2e-6;
DC_in_char(:,4)=diodeADC_i2v(2e-6,chip_num,brdtype)-diodeADC_i2v(DC_in_char(:,1),chip_num,brdtype);

scf(1);clf(1);
plot2d("ln", DC_in_char(:,1), DC_in_char(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//plot2d("nn", x_range,p1_re_in(1)*x_range+p1_re_in(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds=[1 1.3; 1.7 1.8];
xtitle("","Vout[V]@Vg=0.6V", " Vout[V]@Vg=0V");

scf(2);clf(2);
plot2d("ln", DC_in_char(:,3), DC_in_char(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//plot2d("nn", x_range,p1_re_in(1)*x_range+p1_re_in(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds=[1 1.3; 1.7 1.8];
xtitle("","Vout[V]@Vg=0.6V", " Vout[V]@Vg=0V");

scf(3);clf(3);
plot2d("nn", DC_in_char(:,4), DC_in_char(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//plot2d("nn", x_range,p1_re_in(1)*x_range+p1_re_in(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds=[-0.16 0; 0.02 2.5];
xtitle("","Vfg(+)-Vfg(-)", " Vout[V]");


