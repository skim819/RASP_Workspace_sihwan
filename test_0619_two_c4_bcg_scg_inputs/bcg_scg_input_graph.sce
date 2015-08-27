// Sampling rate: 1000
bcg_input(:,2) = fscanfMat('bcg_input.txt');
a_temp=size(bcg_input);
bcg_input(:,1)=linspace(0,a_temp(1,1)-1,a_temp(1,1))';
offset_for_BPF_input=1.25-mean(bcg_input(10000:13000,2));
bcg_input(:,3)=bcg_input(:,2)+offset_for_BPF_input;
myVariable = [linspace(1.25,1.25,500) bcg_input(10000:13000,3)'];
myVariable_bcg = [linspace(1.25,1.25,500) bcg_input(10000:11500,3)'];

scg_input(:,2) = fscanfMat('scg.txt');
a_temp=size(scg_input);
scg_input(:,1)=linspace(0,a_temp(1,1)-1,a_temp(1,1))';
offset_for_BPF_input=1.25-mean(scg_input(10000:13000,2));
scg_input(:,3)=scg_input(:,2)+offset_for_BPF_input;
myVariable = [linspace(1.25,1.25,500) scg_input(10000:13000,3)'];
myVariable_scg = [linspace(1.25,1.25,500) scg_input(10000:11500,3)'];

DAC_input_bcg = fscanfMat('data_03_0621_Ch4.txt');
DAC_input_bcg(:,1)=DAC_input_bcg(:,1)*1000;
bcg_output = fscanfMat('data_03_0621_Ch3.txt');
bcg_output(:,1)=bcg_output(:,1)*1000;
DAC_input_scg = fscanfMat('data_03_0621_Ch2.txt');
DAC_input_scg(:,1)=DAC_input_scg(:,1)*1000;
scg_output = fscanfMat('data_03_0621_Ch1.txt');
scg_output(:,1)=scg_output(:,1)*1000;
scf(1);
clf(1);
//    plot2d("nn", bcg_input(:,1), bcg_input(:,2), style=1);
//    plot2d("nn", scg_input(10000:13000,1), scg_input(10000:13000,3), style=2);
//    plot2d("nn", bcg_input(10000:13000,1)-10000, bcg_input(10000:13000,3), style=1);
    plot2d("nn", DAC_input_bcg(:,1), DAC_input_bcg(:,2), style=1);
    plot2d("nn", DAC_input_scg(:,1), DAC_input_scg(:,2), style=2);
    plot2d("nn", bcg_output(:,1), bcg_output(:,2), style=3);
    plot2d("nn", scg_output(:,1), scg_output(:,2), style=5);
legend("bcg input","scg input","bcg output","scg output","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","time [ms]", "Voltage [V]");
a=gca();a.data_bounds(1,2)=0;a.data_bounds(2,2)=2.5;//a.data_bounds(1,1)=10000;a.data_bounds(2,1)=13000;


data=DAC_input_bcg;
data(:,3)=DAC_input_scg(:,2);
data(:,4)=bcg_output(:,2);
data(:,5)=scg_output(:,2);
fprintfMat("bcg_scg_results.data", data, "%5.15f");
scf(2);
clf(2);
    plot2d("nn", data(:,1), data(:,2), style=1);
    plot2d("nn", data(:,1), data(:,3), style=2);
    plot2d("nn", data(:,1), data(:,4), style=3);
    plot2d("nn", data(:,1), data(:,5), style=5);
//legend("DAC Input","DAC input after LPF","Output_lpf100nA","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","time [ms]", "Voltage [V]");
a=gca();a.data_bounds(1,2)=0;a.data_bounds(2,2)=2.5;//a.data_bounds(1,1)=10000;a.data_bounds(2,1)=13000;






