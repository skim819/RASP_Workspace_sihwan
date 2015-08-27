clear data_00;clear data_01;clear data_02;clear data_03;clear data_04;clear data_05;clear data_06;clear data_07;clear data_08;
data_00 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case00.txt'); // time Vout Vin
data_01 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case01.txt');
data_02 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case02.txt');
data_03 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case03.txt');
data_04 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case04.txt');
data_05 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case05.txt');
data_06 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case06.txt');
data_07 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case07.txt');
data_08 = fscanfMat('./DATA_storage_experiment2/Figure4_experiment2_case08.txt');

//temp_1=[mean(data_00(7000:8000,2)); mean(data_01(7000:8000,2)); mean(data_02(7000:8000,2)); mean(data_03(7000:8000,2)); mean(data_04(7000:8000,2)); mean(data_05(7000:8000,2)); mean(data_06(7000:8000,2)); mean(data_07(7000:8000,2)); mean(data_08(7000:8000,2))];
//mean(temp_1);  // constant = 1.324 

data_00(:,4) = 1.324 - data_00(:,2);
data_01(:,4) = 1.324 - data_01(:,2);
data_02(:,4) = 1.324 - data_02(:,2);
data_03(:,4) = 1.324 - data_03(:,2);
data_04(:,4) = 1.324 - data_04(:,2);
data_05(:,4) = 1.324 - data_05(:,2);
data_06(:,4) = 1.324 - data_06(:,2);
data_07(:,4) = 1.324 - data_07(:,2);
data_08(:,4) = 1.324 - data_08(:,2);

scf(1);clf(1);
//plot2d("nn", data_00(:,1), data_00(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
//plot2d("nn", data_00(:,1), data_00(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nn",data_00(:,1), data_00(:,3));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_00(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_01(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 3;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_02(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 4;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_03(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 5;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_04(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 6;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_05(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 7;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_06(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 9;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_07(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 10;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_08(:,2));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 11;p.children.line_mode = 'on';p.children.mark_mode = 'off';
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
plot2d("nn",data_00(:,1), data_05(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 7;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_06(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 9;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_07(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 10;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nn",data_00(:,1), data_08(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 11;p.children.line_mode = 'on';p.children.mark_mode = 'off';
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
plot2d("nl",data_00(:,1), data_05(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 7;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",data_00(:,1), data_06(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 8;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",data_00(:,1), data_07(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 10;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",data_00(:,1), data_08(:,4));p = get("hdl"); p.children.line_style = 1; p.children.foreground = 11;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//plot2d("nn",range_gm , fit_gm);p = get("hdl"); p.children.line_style = 1; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds(1,1)=-0.5E-04;a.data_bounds(1,2)=1E-03;a.data_bounds(2,1)=1.0E-04;a.data_bounds(2,2)=1E-01;
//a=gca();a.data_bounds(1,1)=-0.1;a.data_bounds(1,2)=0;a.data_bounds(2,1)=0.2;a.data_bounds(2,2)=20;
//legend("Target program 100nA","Target program 50nA","Target program 10nA","in_upper_left"); // "in_upper_left" "in_lower_right"
xtitle("","time [s]","Vconstant - Vout [V]");


//polyfit
[p_00,S_00]=polyfit(data_00(1300:1400,1), log(data_00(1300:1400,4)),1);
[p_01,S_01]=polyfit(data_01(1300:1450,1), log(data_01(1300:1450,4)),1);
[p_02,S_02]=polyfit(data_02(1300:1600,1), log(data_02(1300:1600,4)),1);
[p_03,S_03]=polyfit(data_03(1300:1600,1), log(data_03(1300:1600,4)),1);
[p_04,S_04]=polyfit(data_04(1300:1600,1), log(data_04(1300:1600,4)),1);
[p_05,S_05]=polyfit(data_05(1300:1700,1), log(data_05(1300:1700,4)),1);
[p_06,S_06]=polyfit(data_06(1300:1800,1), log(data_06(1300:1800,4)),1);
[p_07,S_07]=polyfit(data_07(1300:2300,1), log(data_07(1300:2300,4)),1);
[p_08,S_08]=polyfit(data_08(1300:2500,1), log(data_08(1300:2500,4)),1);

// Eval
range_00 = data_00(1300,1):70E-09:data_00(1350,1);
range_01 = data_01(1300,1):70E-09:data_01(1450,1);
range_02 = data_02(1300,1):70E-09:data_02(1600,1);
range_03 = data_03(1300,1):70E-09:data_03(1600,1);
range_04 = data_04(1300,1):70E-09:data_04(1600,1);
range_05 = data_05(1300,1):70E-09:data_05(1700,1);
range_06 = data_06(1300,1):70E-09:data_06(1800,1);
range_07 = data_07(1300,1):70E-09:data_07(2300,1);
range_08 = data_08(1300,1):70E-09:data_08(2500,1);
fit_00 = polyval(p_00,range_00,S_00);
fit_01 = polyval(p_01,range_01,S_01);
fit_02 = polyval(p_02,range_02,S_02);
fit_03 = polyval(p_03,range_03,S_03);
fit_04 = polyval(p_04,range_04,S_04);
fit_05 = polyval(p_05,range_05,S_05);
fit_06 = polyval(p_06,range_06,S_06);
fit_07 = polyval(p_07,range_07,S_07);
fit_08 = polyval(p_08,range_08,S_08);

scf(4);clf(4);
plot2d("nl",data_00(1300:1400,1), data_00(1300:1400,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 1;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_01(1300:1450,1), data_01(1300:1450,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 2;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_02(1300:1600,1), data_02(1300:1600,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 3;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_03(1300:1600,1), data_03(1300:1600,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 4;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_04(1300:1600,1), data_04(1300:1600,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 5;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_04(1300:1700,1), data_05(1300:1700,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 6;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_04(1300:1800,1), data_06(1300:1800,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 7;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_04(1300:2300,1), data_07(1300:2300,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 9;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",data_04(1300:2500,1), data_08(1300:2500,4));p = get("hdl"); p.children.mark_style = 9; p.children.mark_foreground = 10;p.children.mark_mode = 'on';p.children.line_mode = 'off';
plot2d("nl",range_00, exp(fit_00));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 1;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_01, exp(fit_01));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_02, exp(fit_02));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 3;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_03, exp(fit_03));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 4;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_04, exp(fit_04));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 5;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_05, exp(fit_05));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 6;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_06, exp(fit_06));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 7;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_07, exp(fit_07));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 9;p.children.line_mode = 'on';p.children.mark_mode = 'off';
plot2d("nl",range_08, exp(fit_08));p = get("hdl"); p.children.line_style = 1; p.children.thickness = 2; p.children.foreground = 10;p.children.line_mode = 'on';p.children.mark_mode = 'off';
a=gca();a.data_bounds(1,1)=0;a.data_bounds(1,2)=1E-03;a.data_bounds(2,1)=10.0E-05;a.data_bounds(2,2)=1E-01;
xtitle("","time [s]","Vconstant - Vout [V]");

disp(-1/p_00(1,1)*1E06); disp(-1/p_01(1,1)*1E06); disp(-1/p_02(1,1)*1E06); disp(-1/p_03(1,1)*1E06); disp(-1/p_04(1,1)*1E06); disp(-1/p_05(1,1)*1E06); disp(-1/p_06(1,1)*1E06); disp(-1/p_07(1,1)*1E06); disp(-1/p_08(1,1)*1E06); 
disp(-1/p_00(1,1)*169*1E-09*1E12); disp(-1/p_01(1,1)*169*1E-09*1E12); disp(-1/p_02(1,1)*169*1E-09*1E12); disp(-1/p_03(1,1)*169*1E-09*1E12); disp(-1/p_04(1,1)*169*1E-09*1E12); disp(-1/p_05(1,1)*169*1E-09*1E12); disp(-1/p_06(1,1)*169*1E-09*1E12); disp(-1/p_07(1,1)*169*1E-09*1E12); disp(-1/p_08(1,1)*169*1E-09*1E12); 

disp(-1/p_00(1,1)*1E06); disp(-1/p_01(1,1)*1E06); disp(-1/p_02(1,1)*1E06); disp(-1/p_03(1,1)*1E06); disp(-1/p_04(1,1)*1E06); disp(-1/p_05(1,1)*1E06); disp(-1/p_06(1,1)*1E06); disp(-1/p_07(1,1)*1E06); disp(-1/p_08(1,1)*1E06); 
disp(-1/p_00(1,1)*145*1E-09*1E12); disp(-1/p_01(1,1)*145*1E-09*1E12); disp(-1/p_02(1,1)*145*1E-09*1E12); disp(-1/p_03(1,1)*145*1E-09*1E12); disp(-1/p_04(1,1)*145*1E-09*1E12); disp(-1/p_05(1,1)*145*1E-09*1E12); disp(-1/p_06(1,1)*145*1E-09*1E12); disp(-1/p_07(1,1)*145*1E-09*1E12); disp(-1/p_08(1,1)*145*1E-09*1E12); 
