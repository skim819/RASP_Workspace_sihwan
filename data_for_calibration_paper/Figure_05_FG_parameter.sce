global file_name path fname extension chip_num board_num hex_1na;
cd("/home/ubuntu/RASP_Workspace/data_for_calibration_paper");
path =  pwd();
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_v2i.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_i2v.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_v2h.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_h2v.sce',-1);
hex_1na=int(diodeADC_v2h(diodeADC_i2v(1e-09,chip_num,brdtype),chip_num,brdtype));

exec('~/rasp30/prog_assembly/libs/scilab_code/read_tar_pgm_result.sce',-1);
time_scale=1e-5; // Time unit : 10us
Vg06VtoVg00V=hex_1na; // hex value for 1nA
vdd=2.5;

clear data_swc; m_graph=4; data_swc=read_tar_pgm_result('char_gate_coupling_swc.hex',m_graph,time_scale);
for i=3:m_graph
    data_swc(:,i+2)=diodeADC_v2i(diodeADC_h2v(data_swc(:,i),chip_num,brdtype),chip_num,brdtype);
    data_swc(:,i+4)=2*(vdd-(diodeADC_h2v(data_swc(:,i),chip_num,brdtype)));
end
// data_swc(:,3) Hex@Vgm=0.6V, data_swc(:,4) Hex@Vgm=0V, data_swc(:,5) Current@Vgm=0.6V, data_swc(:,6) Current@Vgm=0V

//polyfit
data_swc_sz=size(data_swc);
start_hex=0;
for k=1:data_swc_sz(1,1)
    if data_swc(k,5) < 1E-09 then start_hex = k; end
end
[p1_vg06_vg00_swc,S1_vg06_vg00_swc]=polyfit(data_swc(start_hex:start_hex+5,3), data_swc(start_hex:start_hex+5,4),1);
ADC_vg06_vg00_swc = data_swc(1,3):1:data_swc(data_swc_sz(1,1),3);
fit_vg06_vg00_swc = polyval(p1_vg06_vg00_swc,ADC_vg06_vg00_swc,S1_vg06_vg00_swc);
Vg06VtoVg00V_swc=[Vg06VtoVg00V]; // 1nA
Vg06VtoVg00V_swc_sz = size(Vg06VtoVg00V_swc);
ADC_vg06_vg00_swc_sz = size(ADC_vg06_vg00_swc);

for k=1:Vg06VtoVg00V_swc_sz(1,1)
    for h=1:ADC_vg06_vg00_swc_sz(1,2)
        if ADC_vg06_vg00_swc(h) < Vg06VtoVg00V_swc(k,1) then Vg06VtoVg00V_swc(k,2)=fit_vg06_vg00_swc(h); end
    end
end

scf(1);clf(1);
plot2d("nl", data_swc(:,2)*1e3, data_swc(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nl", data_swc(:,2)*1e3, data_swc(:,6));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
a=gca();a.data_bounds=[0 5e-10; 1 1e-05];
xtitle("","time [us]", "Id [A]");

scf(2);clf(2);
plot2d("nn", data_swc(:,3), data_swc(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", ADC_vg06_vg00_swc, fit_vg06_vg00_swc);p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","ADC values @ Vg=0.6V", "ADC values @ Vg=0V");
//a=gca();a.data_bounds(1,1)=3000;a.data_bounds(1,2)=3000;a.data_bounds(2,1)=9000;a.data_bounds(2,2)=9000;

scf(3);clf(3);
plot2d("ln", data_swc(:,5), data_swc(:,6)./data_swc(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
a=gca();a.data_bounds=[1e-10 0; 1e-06 30];
xtitle("","I [A] @Vg=0.6V", " I(@Vg=0V)/I(@Vg=0.6V)");
//a=gca();a.data_bounds(1,1)=3000;a.data_bounds(1,2)=3000;a.data_bounds(2,1)=9000;a.data_bounds(2,2)=9000;

scf(4);clf(4);
plot2d("nn", data_swc(:,2)*1e3, data_swc(:,7));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_swc(:,2)*1e3, data_swc(:,8));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
a=gca();a.data_bounds=[0 0.9; 1 1.8];
xtitle("","time [us]", "Vout [V]");

[p1_re_in,S1_re_in]=polyfit(data_swc(20:27,7), data_swc(20:27,8),1);
x_range=[1:0.1:1.7];
[p2_re_in,S2_re_in]=polyfit(data_swc(50:100,7), data_swc(50:100,8),1);
//scf(5);clf(5);
//plot2d("nn", data_swc(20:100,7), data_swc(20:100,8));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//plot2d("nn", x_range,p1_re_in(1)*x_range+p1_re_in(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
//plot2d("nn", x_range,p2_re_in(1)*x_range+p2_re_in(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds=[1 1.3; 1.7 1.8];
//xtitle("","Vout[V]@Vg=0.6V", " Vout[V]@Vg=0V");

data_swc(22:100,9)=data_swc(22:100,8)-data_swc(22:100,7);
[p1_re_offset,S1_re_offset]=polyfit(data_swc(22:49,7), data_swc(22:49,9),1);
x_range1=[1.1:0.05:1.65];
[p2_re_offset,S2_re_offset]=polyfit(data_swc(50:100,7), data_swc(50:100,9),1);
x_range2=[1.2:0.05:1.7];
disp(data_swc(22,:));
disp(data_swc(50,:));
disp(data_swc(100,:));
scf(6);clf(6);
plot2d("nn", data_swc(22:100,7),data_swc(22:100,9));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", x_range1,p1_re_offset(1)*x_range1+p1_re_offset(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn", x_range2,p2_re_offset(1)*x_range2+p2_re_offset(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds=[1.1 0.08 ; 1.7 0.26];
xtitle("","Vout[V]@Vg=0.6V", "Vout(@Vg=0V) - Vout(@Vg=0.6)");




//2*(vdd-diodeADC_h2v(5621,chip_num,brdtype))-2*(vdd-diodeADC_h2v(4342,chip_num,brdtype))
//2*(vdd-diodeADC_h2v(5872,chip_num,brdtype))-2*(vdd-diodeADC_h2v(4342,chip_num,brdtype))
//2*(vdd-diodeADC_h2v(5886,chip_num,brdtype))-2*(vdd-diodeADC_h2v(4342,chip_num,brdtype))
//2*(vdd-diodeADC_h2v(6528,chip_num,brdtype))-2*(vdd-diodeADC_h2v(4342,chip_num,brdtype))
//2*(vdd-diodeADC_h2v(6790,chip_num,brdtype))-2*(vdd-diodeADC_h2v(4342,chip_num,brdtype))
