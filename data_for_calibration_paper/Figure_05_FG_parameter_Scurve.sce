exec('~/rasp30/prog_assembly/libs/scilab_code/read_tar_pgm_result.sce',-1);
time_scale=1e-2; //1e-5; // Time unit : 10us
m_graph=3;
kapa_constant_or_not=1;
vdd=2.5;

//cd("/home/ubuntu/RASP_Workspace/data_for_calibration_paper/data_char_Scurve_chip16");
cd("/home/ubuntu/RASP_Workspace/data_for_calibration_paper/data_char_Scurve_chip21");
//cd("/home/ubuntu/RASP_Workspace/data_for_calibration_paper/data_char_Scurve_chip17");
//cd("/home/ubuntu/RASP_Workspace/data_for_calibration_paper/data_char_Scurve_chip13");

path =  pwd();
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_v2i.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_i2v.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_v2h.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/diodeADC_h2v.sce',-1);

clear data_swc; data_swc=read_tar_pgm_result('char_Scurve_swc.hex',m_graph,time_scale);
for i=3:m_graph
    data_swc(:,i+2)=diodeADC_v2i(diodeADC_h2v(data_swc(:,i),chip_num,brdtype),chip_num,brdtype)/kapa_constant_or_not;
end

//scf(11);clf(11);
//plot2d("nl", data_swc(:,2), data_swc(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","time [s]", "Id [A]");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;
//fprintfMat("Scurve_at_Vg3.6V_swc.data", data_swc, "%5.15f");

data_size_temp=size(data_swc);

//scf(12);clf(12);
//plot2d("nn", data_swc(1:data_size_temp(1,1)-1,3), data_swc(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","hex_start", "hex_end");

pwt_swc = [(0:64:64*255)'];
pwt_swc = pwt_swc + hex_1na;
pwt_swc(1,2)=0;
offset=0;
fd_w = mopen('pulse_width_table_swc','wt');
for k=1:255
    j=0;
    for i=2:data_size_temp(1,1)
        if data_swc(i,3) > hex_1na then j=j+1; end
        if pwt_swc(k,1) > data_swc(i,3) then pwt_swc(k,2)=max(0,(j+offset)/2); end
    end
    mputl('0x'+string(sprintf('%4.4x', pwt_swc(k,2))),fd_w);
end
mclose(fd_w);


clear data_ota; data_ota=read_tar_pgm_result('char_Scurve_ota.hex',m_graph,time_scale);
for i=3:m_graph
    data_ota(:,i+2)=diodeADC_v2i(diodeADC_h2v(data_ota(:,i),chip_num,brdtype),chip_num,brdtype)/kapa_constant_or_not;
end

//scf(13);clf(13);
//plot2d("nl", data_ota(:,2), data_ota(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","time [s]", "Id [A]");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;

data_size_temp=size(data_ota) 
fprintfMat("Scurve_at_Vg3.6V_ota.data", data_ota, "%5.15f");

//scf(14);clf(14);
//plot2d("nn", data_ota(1:data_size_temp(1,1)-1,3), data_ota(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","hex_start", "hex_end");

pwt_ota = [(0:64:64*255)'];
pwt_ota = pwt_ota + hex_1na;
pwt_ota(1,2)=0;
offset=0;
fd_w = mopen('pulse_width_table_ota','wt');
for k=1:255
    j=0;
    for i=2:data_size_temp(1,1)
        if data_ota(i,3) > hex_1na then j=j+1; end
        if pwt_ota(k,1) > data_ota(i,3) then pwt_ota(k,2)=max(0,(j+offset)/2); end
    end
    mputl('0x'+string(sprintf('%4.4x', pwt_ota(k,2))),fd_w);
end
mclose(fd_w);


clear data_otaref; data_otaref=read_tar_pgm_result('char_Scurve_otaref.hex',m_graph,time_scale);
for i=3:m_graph
    data_otaref(:,i+2)=diodeADC_v2i(diodeADC_h2v(data_otaref(:,i),chip_num,brdtype),chip_num,brdtype)/kapa_constant_or_not;
end
// data_otaref(:,3) Hex@Vgm=0.6V, data_otaref(:,4) Hex@Vgm=0V, data_otaref(:,5) Current@Vgm=0.6V, data_otaref(:,6) Current@Vgm=0V

//scf(15);clf(15);
//plot2d("nl", data_otaref(:,2), data_otaref(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","time [s]", "Id [A]");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;
//fprintfMat("Scurve_at_Vg3.6V_otaref.data", data_otaref, "%5.15f");

data_size_temp=size(data_otaref) 

//scf(16);clf(16);
//plot2d("nn", data_otaref(1:data_size_temp(1,1)-1,3), data_otaref(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","hex_start", "hex_end");

pwt_otaref = [(0:64:64*255)'];
pwt_otaref = pwt_otaref + hex_1na;
pwt_otaref(1,2)=0;
offset=0;
fd_w = mopen('pulse_width_table_otaref','wt');
for k=1:255
    j=0;
    for i=2:data_size_temp(1,1)
        if data_otaref(i,3) > hex_1na then j=j+1; end
        if pwt_otaref(k,1) > data_otaref(i,3) then pwt_otaref(k,2)=max(0,(j+offset)/2); end
    end
    mputl('0x'+string(sprintf('%4.4x', pwt_otaref(k,2))),fd_w);
end
mclose(fd_w);



clear data_mite; data_mite=read_tar_pgm_result('char_Scurve_mite.hex',m_graph,time_scale);
for i=3:m_graph
    data_mite(:,i+2)=diodeADC_v2i(diodeADC_h2v(data_mite(:,i),chip_num,brdtype),chip_num,brdtype)/kapa_constant_or_not;
end
// data_mite(:,3) Hex@Vgm=0.6V, data_mite(:,4) Hex@Vgm=0V, data_mite(:,5) Current@Vgm=0.6V, data_mite(:,6) Current@Vgm=0V

//scf(17);clf(17);
//plot2d("nl", data_mite(:,2), data_mite(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","time [s]", "Id [A]");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;
//fprintfMat("Scurve_at_Vg3.6V_mite.data", data_mite, "%5.15f");

data_size_temp=size(data_mite) 

//scf(18);clf(18);
//plot2d("nn", data_mite(1:data_size_temp(1,1)-1,3), data_mite(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","hex_start", "hex_end");

pwt_mite = [(0:64:64*255)'];
pwt_mite = pwt_mite + hex_1na;
pwt_mite(1,2)=0;
offset=0;
fd_w = mopen('pulse_width_table_mite','wt');
for k=1:255
    j=0;
    for i=2:data_size_temp(1,1)
        if data_mite(i,3) > hex_1na then j=j+1; end
        if pwt_mite(k,1) > data_mite(i,3) then pwt_mite(k,2)=max(0,(j+offset)/2); end
    end
    mputl('0x'+string(sprintf('%4.4x', pwt_mite(k,2))),fd_w);
end
mclose(fd_w);



clear data_dirswc; data_dirswc=read_tar_pgm_result('char_Scurve_dirswc.hex',m_graph,time_scale);
for i=3:m_graph
    data_dirswc(:,i+2)=diodeADC_v2i(diodeADC_h2v(data_dirswc(:,i),chip_num,brdtype),chip_num,brdtype)/kapa_constant_or_not;
end
// data_dirswc(:,3) Hex@Vgm=0.6V, data_dirswc(:,4) Hex@Vgm=0V, data_dirswc(:,5) Current@Vgm=0.6V, data_dirswc(:,6) Current@Vgm=0V

//scf(19);clf(19);
//plot2d("nl", data_dirswc(:,2), data_dirswc(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","time [s]", "Id [A]");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;
//fprintfMat("Scurve_at_Vg3.6V_dirswc.data", data_dirswc, "%5.15f");

data_size_temp=size(data_dirswc) 

//scf(20);clf(20);
//plot2d("nn", data_dirswc(1:data_size_temp(1,1)-1,3), data_dirswc(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
//xtitle("","hex_start", "hex_end");

pwt_dirswc = [(0:64:64*255)'];
pwt_dirswc = pwt_dirswc + hex_1na;
pwt_dirswc(1,2)=0;
offset=0;
fd_w = mopen('pulse_width_table_dirswc','wt');
for k=1:255
    j=0;
    for i=2:data_size_temp(1,1)
        if data_dirswc(i,3) > hex_1na then j=j+1; end
        if pwt_dirswc(k,1) > data_dirswc(i,3) then pwt_dirswc(k,2)=max(0,(j+offset)/2); end
    end
    mputl('0x'+string(sprintf('%4.4x', pwt_dirswc(k,2))),fd_w);
end
mclose(fd_w);


scf(21);clf(21);
plot2d("nl", data_swc(:,2), data_swc(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nl", data_ota(:,2), data_ota(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nl", data_otaref(:,2), data_otaref(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.line_mode = 'off';
plot2d("nl", data_mite(:,2), data_mite(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 4;p.children.line_mode = 'off';
plot2d("nl", data_dirswc(1:10,2), data_dirswc(1:10,5));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 5;p.children.line_mode = 'off';
xtitle("","time [us]", "Id [A]");
legend("swc","ota","otaref","mite","dirswc","in_lower_right");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)51D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=1;a.data_bounds(2,2)=1D-04;

scf(22);clf(22);
data_size_temp=size(data_swc);plot2d("nn", data_swc(1:data_size_temp(1,1)-1,3), data_swc(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
data_size_temp=size(data_ota);plot2d("nn", data_ota(1:data_size_temp(1,1)-1,3), data_ota(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
data_size_temp=size(data_otaref);plot2d("nn", data_otaref(1:data_size_temp(1,1)-1,3), data_otaref(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.line_mode = 'off';
data_size_temp=size(data_mite);plot2d("nn", data_mite(1:data_size_temp(1,1)-1,3), data_mite(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 4;p.children.line_mode = 'off';
data_size_temp=size(data_dirswc);plot2d("nn", data_dirswc(1:data_size_temp(1,1)-1,3), data_dirswc(2:data_size_temp(1,1),3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 5;p.children.line_mode = 'off';
xtitle("","hex_start", "hex_end");
legend("swc","ota","otaref","mite","dirswc","in_lower_right");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;

scf(23);clf(23);
plot2d("nn", data_swc(:,2), 2*(vdd-diodeADC_h2v(data_swc(:,3),chip_num,brdtype)));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", data_ota(:,2), 2*(vdd-diodeADC_h2v(data_ota(:,3),chip_num,brdtype)));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.line_mode = 'off';
plot2d("nn", data_otaref(:,2), 2*(vdd-diodeADC_h2v(data_otaref(:,3),chip_num,brdtype)));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.line_mode = 'off';
plot2d("nn", data_mite(:,2), 2*(vdd-diodeADC_h2v(data_mite(:,3),chip_num,brdtype)));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 4;p.children.line_mode = 'off';
plot2d("nn", data_dirswc(1:10,2), 2*(vdd-diodeADC_h2v(data_dirswc(1:10,3),chip_num,brdtype)));p = get("hdl"); p.children.mark_style = 8; p.children.mark_foreground = 5;p.children.line_mode = 'off';
xtitle("","time [us]", "Vout [V]");
legend("swc","ota","otaref","mite","dirswc","in_lower_right");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)51D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1;a.data_bounds(2,1)=2;a.data_bounds(2,2)=2.2;





boundary=26;
disp(2*(vdd-diodeADC_h2v(data_ota(boundary,3),chip_num,brdtype)));
disp(diodeADC_v2i(diodeADC_h2v(data_ota(boundary,3),chip_num,brdtype),chip_num,brdtype)*1e6);

[p1_re_Scurve_swc,S1_re_Scurve_swc]=polyfit(2*(vdd-diodeADC_h2v(data_swc(1:boundary-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_swc(2:boundary,3),chip_num,brdtype)),1);
[p1_re_Scurve_ota,S1_re_Scurve_ota]=polyfit(2*(vdd-diodeADC_h2v(data_ota(1:boundary-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_ota(2:boundary,3),chip_num,brdtype)),1);
[p1_re_Scurve_otaref,S1_re_Scurve_otaref]=polyfit(2*(vdd-diodeADC_h2v(data_otaref(1:boundary-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_otaref(2:boundary,3),chip_num,brdtype)),1);
[p1_re_Scurve_mite,S1_re_Scurve_mite]=polyfit(2*(vdd-diodeADC_h2v(data_mite(1:boundary-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_mite(2:boundary,3),chip_num,brdtype)),1);
[p1_re_Scurve_dirswc,S1_re_Scurve_dirswc]=polyfit(2*(vdd-diodeADC_h2v(data_dirswc(1:boundary-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_dirswc(2:boundary,3),chip_num,brdtype)),1);
disp(p1_re_Scurve_swc);
disp(p1_re_Scurve_dirswc);
disp(p1_re_Scurve_otaref);
disp(p1_re_Scurve_ota);
disp(p1_re_Scurve_mite);
[p2_re_Scurve_swc,S2_re_Scurve_swc]=polyfit(2*(vdd-diodeADC_h2v(data_swc(boundary:data_size_temp(1,1)-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_swc(boundary+1:data_size_temp(1,1),3),chip_num,brdtype)),1);
[p2_re_Scurve_ota,S2_re_Scurve_ota]=polyfit(2*(vdd-diodeADC_h2v(data_ota(boundary:data_size_temp(1,1)-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_ota(boundary+1:data_size_temp(1,1),3),chip_num,brdtype)),1);
[p2_re_Scurve_otaref,S2_re_Scurve_otaref]=polyfit(2*(vdd-diodeADC_h2v(data_otaref(boundary:data_size_temp(1,1)-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_otaref(boundary+1:data_size_temp(1,1),3),chip_num,brdtype)),1);
[p2_re_Scurve_mite,S2_re_Scurve_mite]=polyfit(2*(vdd-diodeADC_h2v(data_mite(boundary:data_size_temp(1,1)-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_mite(boundary+1:data_size_temp(1,1),3),chip_num,brdtype)),1);
[p2_re_Scurve_dirswc,S2_re_Scurve_dirswc]=polyfit(2*(vdd-diodeADC_h2v(data_dirswc(boundary:data_size_temp(1,1)-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_dirswc(boundary+1:data_size_temp(1,1),3),chip_num,brdtype)),1);
disp(p2_re_Scurve_swc);
disp(p2_re_Scurve_dirswc);
disp(p2_re_Scurve_otaref);
disp(p2_re_Scurve_ota);
disp(p2_re_Scurve_mite);


x_range1=[1:0.1:2.1];
x_range2=[1.2:0.1:2.2];
scf(24);clf(24);
data_size_temp=size(data_ota);plot2d("nn", 2*(vdd-diodeADC_h2v(data_ota(1:data_size_temp(1,1)-1,3),chip_num,brdtype)), 2*(vdd-diodeADC_h2v(data_ota(2:data_size_temp(1,1),3),chip_num,brdtype)));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.line_mode = 'off';
plot2d("nn", x_range1,p1_re_Scurve_ota(1)*x_range1+p1_re_Scurve_ota(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn", x_range2,p2_re_Scurve_ota(1)*x_range2+p2_re_Scurve_ota(2) );p = get("hdl");p.children.line_mode = 'on';p.children.mark_mode = 'off';
xtitle("","Vout_start [V]", "Vout_final [v]");
legend("ota_meas","polyfit1","polyfit2","in_lower_right");
//a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1D-10;a.data_bounds(2,1)=a.data_bounds(2,1);a.data_bounds(2,2)=1D-04;






