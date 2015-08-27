clear data_00;clear data_01;clear data_02;clear data_03;clear data_04;
data_00 = fscanfMat('./DATA_storage_experiment1/Figure4_experiment1_case00.txt'); // time Vout Vin
data_01 = fscanfMat('./DATA_storage_experiment1/Figure4_experiment1_case01.txt'); 
data_02 = fscanfMat('./DATA_storage_experiment1/Figure4_experiment1_case02.txt'); 
data_03 = fscanfMat('./DATA_storage_experiment1/Figure4_experiment1_case03.txt'); 
data_04 = fscanfMat('./DATA_storage_experiment1/Figure4_experiment1_case04.txt'); 

//temp_1=[mean(data_00(7000:8000,2)); mean(data_01(7000:8000,2)); mean(data_02(7000:8000,2)); mean(data_03(7000:8000,2)); mean(data_04(7000:8000,2))];
//mean(temp_1);  // constant = 1.324 

data_00(:,4) = 1.324 - data_00(:,2);
data_01(:,4) = 1.324 - data_01(:,2);
data_02(:,4) = 1.324 - data_02(:,2);
data_03(:,4) = 1.324 - data_03(:,2);
data_04(:,4) = 1.324 - data_04(:,2);


scf(1);clf(1);
//plot2d("nn", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn", data_00(:,1), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_00(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_01(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 3;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_02(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 4;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_03(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 5;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_04(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 6;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//plot2d("nn",range_gm , fit_gm);p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
//a=gca();a.data_bounds(1,1)=-0.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=0.2;a.data_bounds(2,2)=20;
//legend("Target program 100nA","Target program 50nA","Target program 10nA","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","time [s]","V [V]");

scf(2);clf(2);
//plot2d("nn", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn", data_00(:,1), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_00(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_01(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 3;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_02(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 4;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_03(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 5;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_04(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 6;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//plot2d("nn",range_gm , fit_gm);p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1.15;a.data_bounds(2,1)=4.5E-04;a.data_bounds(2,2)=1.35;
//a=gca();a.data_bounds(1,1)=-0.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=0.2;a.data_bounds(2,2)=20;
//legend("Target program 100nA","Target program 50nA","Target program 10nA","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","time [s]","Vconstant - Vout [V]");


scf(3);clf(3);
//plot2d("nn", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn", data_00(:,1), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",data_00(:,1), data_00(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",data_00(:,1), data_01(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 3;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",data_00(:,1), data_02(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 4;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",data_00(:,1), data_03(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 5;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",data_00(:,1), data_04(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 6;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//plot2d("nn",range_gm , fit_gm);p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1E-03;a.data_bounds(2,1)=1.0E-04;a.data_bounds(2,2)=1E-01;
//a=gca();a.data_bounds(1,1)=-0.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=0.2;a.data_bounds(2,2)=20;
//legend("Target program 100nA","Target program 50nA","Target program 10nA","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","time [s]","Vconstant - Vout [V]");


//polyfit
[p_00,S_00]=polyfit(data_00(1200:1300,1), log(data_00(1200:1300,4)),1);
[p_01,S_01]=polyfit(data_01(1200:1500,1), log(data_01(1200:1500,4)),1);
[p_02,S_02]=polyfit(data_02(1200:1800,1), log(data_02(1200:1800,4)),1);
[p_03,S_03]=polyfit(data_03(1200:2200,1), log(data_03(1200:2200,4)),1);
[p_04,S_04]=polyfit(data_04(1200:2500,1), log(data_04(1200:2500,4)),1);

// Eval
range_00 = data_00(1200,1):70E-09:data_00(1300,1);
range_01 = data_01(1200,1):70E-09:data_01(1500,1);
range_02 = data_02(1200,1):70E-09:data_02(1800,1);
range_03 = data_03(1200,1):70E-09:data_03(2200,1);
range_04 = data_04(1200,1):70E-09:data_04(2500,1);
fit_00 = polyval(p_00,range_00,S_00);
fit_01 = polyval(p_01,range_01,S_01);
fit_02 = polyval(p_02,range_02,S_02);
fit_03 = polyval(p_03,range_03,S_03);
fit_04 = polyval(p_04,range_04,S_04);

scf(4);clf(4);
plot2d("nl",data_00(1200:1300,1), data_00(1200:1300,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_01(1200:1500,1), data_01(1200:1500,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_02(1200:1800,1), data_02(1200:1800,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_03(1200:2200,1), data_03(1200:2200,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 4;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_04(1200:2500,1), data_04(1200:2500,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 5;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",range_00, exp(fit_00));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_01, exp(fit_01));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_02, exp(fit_02));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 3;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_03, exp(fit_03));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 4;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_04, exp(fit_04));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 5;p.children.line_mode = 'on';p.children.mark_mode = 'off';

a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1E-03;a.data_bounds(2,1)=10.0E-05;a.data_bounds(2,2)=1E-01;
xtitle("","time [s]","Vconstant - Vout [V]");

//disp(-1/p_00(1,1)*1E06); disp(-1/p_01(1,1)*1E06); disp(-1/p_02(1,1)*1E06); disp(-1/p_03(1,1)*1E06); disp(-1/p_04(1,1)*1E06);
//disp(-1/p_00(1,1)*169*1E-09*1E12); disp(-1/p_01(1,1)*169*1E-09*1E12); disp(-1/p_02(1,1)*169*1E-09*1E12); disp(-1/p_03(1,1)*169*1E-09*1E12); disp(-1/p_04(1,1)*169*1E-09*1E12); 

disp(-1/p_00(1,1)*1E06); disp(-1/p_01(1,1)*1E06); disp(-1/p_02(1,1)*1E06); disp(-1/p_03(1,1)*1E06); disp(-1/p_04(1,1)*1E06);
disp(-1/p_00(1,1)*145*1E-09*1E12); disp(-1/p_01(1,1)*145*1E-09*1E12); disp(-1/p_02(1,1)*145*1E-09*1E12); disp(-1/p_03(1,1)*145*1E-09*1E12); disp(-1/p_04(1,1)*145*1E-09*1E12); 
