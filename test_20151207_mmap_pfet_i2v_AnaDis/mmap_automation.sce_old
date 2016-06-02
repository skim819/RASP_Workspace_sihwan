global file_name path fname extension chip_num board_num hex_1na;

// Initialize the shift register (put 1 on the 1st register) and measure
AnDi_clk = [0 1 0]; AnDi_data = [1 1 0]; AnDi_pause = [1 1 1]; // ms 
AnDi_string="sudo dwfcmd connect target=digitalio oe=0x00003";
for i=1:3
    AnDi_string = AnDi_string + ' out=0x' + string(sprintf('%4.4x', AnDi_clk(i) + 2*AnDi_data(i))) +  " pause=" + string(AnDi_pause(i)) + "ms"; // 0:clk 1:data
end
AnDi_string=AnDi_string+" out=0x0000 in";
unix_w(AnDi_string);
unix_w('sudo dwfcmd connect watch=2s analogin record channel=1 enable=1 range=2V offset=0 frequency=1k run=0.01s start save=data_1.csv');

// Measure next values from 2nd to 16th
for j=2:16
    AnDi_clk = [1 0]; AnDi_data = [0 0]; AnDi_pause = [1 1]; // ms 
    AnDi_string="sudo dwfcmd connect target=digitalio oe=0x00003";
    for i=1:2
        AnDi_string = AnDi_string + ' out=0x' + string(sprintf('%4.4x', AnDi_clk(i) + 2*AnDi_data(i))) +  " pause=" + string(AnDi_pause(i)) + "ms"; // 0:clk 1:data
    end
    AnDi_string=AnDi_string+" out=0x0000 in";
    unix_w(AnDi_string);
    unix_w('sudo dwfcmd connect watch=2s analogin record channel=1 enable=1 range=2V offset=0 frequency=1k run=0.01s start save=data_'+string(j)+'.csv');
    disp(j);
end

clear mmap_data;
for i=1:16
    M = csvRead('data_'+string(i)+'.csv'); M = mean(M(3:10)); mmap_data(i)=M; // take the mean of the voltage values
end




pfet_i2v_v2i = [ // Vin[V] I[A] Vout[V]
0.7  0.29e-9 0.065; 0.75 0.53e-9 0.160; 0.8  1.38e-9 0.296; 0.85 10.1e-9 0.510; 0.9  38.9e-9 0.642; 0.95 111e-9  0.738; 1.0  238e-9  0.797; 1.05 422e-9  0.842;
1.1  645e-9  0.879; 1.15 901e-9  0.911; 1.2  1.18e-6 0.939; 1.25 1.49e-6 0.966; 1.3  1.83e-6 0.990; 1.35 2.17e-6 1.013; 1.4  2.53e-6 1.035; 1.5  3.27e-6 1.075;
1.6  4.02e-6 1.110; 1.7  4.78e-6 1.146; 1.8  5.63e-6 1.176; 1.9  6.50e-6 1.208; 2.0  7.39e-6 1.237; 2.4  9.12e-6 1.301; 2.5  12.2e-6 1.371;];
//polyfit
[p1_pfet_i2v_v2i,S1_pfet_i2v_v2i]=polyfit(pfet_i2v_v2i(:,3), log(pfet_i2v_v2i(:,2)),10); //coefficients of polynomial that correspond to current
size_pfet_i2v_v2i=size(pfet_i2v_v2i);
// Eval
range_pfet_i2v_v2i = pfet_i2v_v2i(1,3):0.01:pfet_i2v_v2i(size_pfet_i2v_v2i(1,1),3);
fit_pfet_i2v_v2i = polyval(p1_pfet_i2v_v2i,range_pfet_i2v_v2i,S1_pfet_i2v_v2i);
Current_pfet_i2v_v2i=[range_pfet_i2v_v2i(:) exp(fit_pfet_i2v_v2i(:))];
// Plot the data
scf(1);clf(1);
plot2d("nl", pfet_i2v_v2i(:,3), pfet_i2v_v2i(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
plot2d("nl", Current_pfet_i2v_v2i(:,1), Current_pfet_i2v_v2i(:,2), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
xtitle("","ADC data","Ichar(A)");

mmap_data(:,2)=exp(polyval(p1_pfet_i2v_v2i,mmap_data(:,1),S1_pfet_i2v_v2i));
disp(mmap_data);

scf(2);clf(2);
for i=1:16
    plot2d("nn", i, mmap_data(i,1), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
end
a=gca();a.data_bounds=[0 1.5; 16 2.5];
//legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
xtitle("","switch No.","Ichar(A)");




//pfet_i2v_v2i = [ // Vin[V] I[A] Vout[V]
////0.5 0.5e-09 0.1465;
////0.6 0.5e-09 0.4372;
////0.7 0.6e-09 0.5948;
//0.8 0.9e-09 0.7086;
//0.9 10.1e-09 0.8128;
//1.0 121.2e-09 0.9042;
//1.1 464.7e-09 0.9774;
//1.2 998.6e-09 1.0372;
//1.3 1.662e-06 1.0888;
//1.4 2.409e-06 1.1342;
//1.5 3.213e-06 1.1756;
//1.6 4.028e-06 1.2126;
//1.7 4.844e-06 1.2460;
//1.8 5.706e-06 1.2786;
//1.9 6.631e-06 1.3100;
//];
//size_pfet_i2v_v2i=size(pfet_i2v_v2i);
//range_pfet_i2v_v2i = pfet_i2v_v2i(1,3):0.01:pfet_i2v_v2i(size_pfet_i2v_v2i(1,1),3);
//Current_pfet_i2v_v2i=[range_pfet_i2v_v2i(:) range_pfet_i2v_v2i(:)];
//Is=300e-09;
//kappa=0.85; //kappa=0.716;
//Vdd=2.5;
//VT=0.37;
//Current_pfet_i2v_v2i(:,2)=Is*(log(1+exp(((kappa*(Vdd-VT))-Vdd+(0.75*Current_pfet_i2v_v2i(:,1)))/(2*0.0258)))).^2;
////Current_pfet_i2v_v2i(:,2)=Is*(log(1+exp(1*(Current_pfet_i2v_v2i(:,1)-0.78)/(2*0.0258)))).^2;
//
//scf(1);clf(1);
//plot2d("nl", pfet_i2v_v2i(:,3), pfet_i2v_v2i(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
//plot2d("nl", Current_pfet_i2v_v2i(:,1), Current_pfet_i2v_v2i(:,2), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//a=gca();a.data_bounds=[0.7 1e-10; 1.5 100e-6];
//legend(" Data","EKV fit","in_lower_right");
//xtitle("","Vout(V)","Ichar(A)");
//
//scf(2);clf(2);
//plot2d("nn", pfet_i2v_v2i(:,3), pfet_i2v_v2i(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
//plot2d("nn", Current_pfet_i2v_v2i(:,1), Current_pfet_i2v_v2i(:,2), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//a=gca();a.data_bounds=[0.7 1e-10; 1.5 15e-6];
//legend(" Data","EKV fit","in_lower_right");
//xtitle("","Vout(V)","Ichar(A)");
