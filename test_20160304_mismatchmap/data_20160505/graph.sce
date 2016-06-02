Vto_mismatch_data1=csvRead('Vto_mismatch_data_before1');
Vto_mismatch_data2=csvRead('Vto_mismatch_data_after1');
Vto_mismatch_data3=csvRead('Vto_mismatch_data_after2');
Vto_mismatch_data4=csvRead('Vto_mismatch_data_before2');
Vto_mismatch_data5=csvRead('Vto_mismatch_data_after3');
Vto_mismatch_data6=csvRead('Vto_mismatch_data_after4');
Vto_mismatch_data7=csvRead('Vto_mismatch_data_after5');
scf(1);clf(1);
for i=1:12
    plot2d("nn", i, Vto_mismatch_data1(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 1;
    //plot2d("nn", i, Vto_mismatch_data1(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 2;
    plot2d("nn", i, Vto_mismatch_data2(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 3;
    //plot2d("nn", i, Vto_mismatch_data2(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 4;
    //plot2d("nn", i, Vto_mismatch_data3(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 5;
    //plot2d("nn", i, Vto_mismatch_data3(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 6;
    //plot2d("nn", i, Vto_mismatch_data4(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 7;
    //plot2d("nn", i, Vto_mismatch_data4(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 9;
    //plot2d("nn", i, Vto_mismatch_data5(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 10;
    //plot2d("nn", i, Vto_mismatch_data5(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 11;
    //plot2d("nn", i, Vto_mismatch_data6(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 12;
    //plot2d("nn", i, Vto_mismatch_data6(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 13;
    plot2d("nn", i, Vto_mismatch_data7(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 2;
    //plot2d("nn", i, Vto_mismatch_data7(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 15;
end
a=gca();a.data_bounds=[0 -0.1; 12 +0.1];
//legend(,"row 0 before","row 1 before","row 0 after1","row 1 after1","row 0 after2","row 1 after2","in_upper_left");
xtitle("","switch No.","Vth mismatch [V]");



// -------- Calculate Vout @ 50nA ----------//
vdd=2.5;
Vfg_50nA=diodeADC_i2v(50e-09,chip_num,brdtype); // Vfg
Vout_diode_50nA=2*(vdd-diodeADC_i2v(50e-09, chip_num, brdtype)); // Vout = 2*(Vdd-Vfg)

// -------- pfet Is, VT, kappa from golden pfet characterization ----------//
exec('~/rasp30/prog_assembly/libs/scilab_code/linefit.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/ekvfit_nfet.sce',-1);
pfet_iv=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_nFETpFET/data_pFET_IVg_curve_chip"+chip_num+brdtype);
pfet_iv_flip=flipdim(pfet_iv,1);
pfet_iv_flip(:,1)=2.5-pfet_iv_flip(:,1);
plotting="off";  // "on_final" or "off"
epsilon=0.002; // epsilon=0.005;
[pfet_Is, pfet_VT, pfet_kappa]=ekvfit_nfet(pfet_iv_flip(:,1), pfet_iv_flip(:,2), epsilon, plotting);

// -------- Calculate pfet gate voltage ----------//
pfet_Vg=-((log(exp(sqrt(50e-09/pfet_Is))-1)*(2*0.0258)+vdd-Vout_diode_50nA)/pfet_kappa-vdd+pfet_VT); // pfet_Vg @ I= 50nA (I = Is*(log(1+exp((kappa*(vdd-pfet_Vg-VT)-vdd+Vs)/(2*0.0258))))^2)

// -------- Calculate nbios for DC in block for pfet gate voltage ----------//
DC_in_char = [3.0e-06 2.4462;2.5e-06 2.4163;2.0e-06 2.2968;1.5e-06 2.0720;1.0e-06 1.7760;0.9e-06 1.7016;0.8e-06 1.6102;0.7e-06 1.5330;0.6e-06 1.4284;0.5e-06 1.3176;0.4e-06 1.1920;0.3e-06 1.0064;0.2e-06 0.7770;0.15e-06 0.6270;0.10e-06 0.4000;0.08e-06 0.3044;0.05e-06 0.1250];
[p_DC_in,S_DC_in]=polyfit(DC_in_char(:,2),log(DC_in_char(:,1)),1);
pfetg_fgotanbias=exp(polyval(p_DC_in,pfet_Vg,S_DC_in));



m_meas_bias_adc=csvRead('mismatch_meas_cal_fgota_gain_data');

m_meas_bias_adc(:,7)=(2*0.0258)*log(exp(sqrt(m_meas_bias_adc(:,6)/pfet_Is))-1)+vdd-pfet_kappa*(vdd-pfet_Vg-pfet_VT);
[p_m_meas_gain,S_m_meas_gain]=polyfit(m_meas_bias_adc(1:11,7),m_meas_bias_adc(1:11,5),1);
out_fgota_gain= p_m_meas_gain(1);

scf(2);clf(2);
plot2d("ln", m_meas_bias_adc(:,6), m_meas_bias_adc(:,5), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
//a=gca();a.data_bounds=[0 0; 20 2.5];
//legend(" Data","EKV fit","in_lower_right");
xtitle("","Ref_Vfg[V]","Vmite(V)");

scf(3);clf(3);
plot2d("nn", m_meas_bias_adc(1:11,7), m_meas_bias_adc(1:11,5), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
plot2d("nn", m_meas_bias_adc(1:11,7),p_m_meas_gain(1)*m_meas_bias_adc(1:11,7)+p_m_meas_gain(2), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//a=gca();a.data_bounds=[0 0; 20 2.5];
//legend(" Data","EKV fit","in_lower_right");
xtitle("","Vmeas(V)","Vmite(V)");
