// Sampling rate: 1000
bcg_input(:,2) = fscanfMat('bcg_input.txt');
a_temp=size(bcg_input);
bcg_input(:,1)=linspace(0,a_temp(1,1)-1,a_temp(1,1))';
offset_for_BPF_input=1.25-mean(bcg_input(10000:13000,2));
bcg_input(:,3)=bcg_input(:,2)+offset_for_BPF_input;
myVariable = [linspace(1.25,1.25,500) bcg_input(10000:13000,3)'];
myVariable_bcg = [linspace(1.25,1.25,500) bcg_input(10000:11500,3)'];

DAC_input = fscanfMat('data_06_Ch2.txt');
DAC_input(:,1)=DAC_input(:,1)*1000;
lpf_bcg_input_100nA = fscanfMat('data_06_Ch3.txt'); // lpf: x18 C4: 300pA, 35pA, x18, x6
lpf_bcg_input_100nA(:,1)=lpf_bcg_input_100nA(:,1)*1000;
lpf_c4_bcg_input_100nA = fscanfMat('data_06_Ch1.txt'); // lpf: x18 C4: 300pA, 35pA, x18, x6
lpf_c4_bcg_input_100nA(:,1)=lpf_c4_bcg_input_100nA(:,1)*1000;

scf(1);
clf(1);
//    plot2d("nn", bcg_input(:,1), bcg_input(:,2), style=1);
//    plot2d("nn", bcg_input(:,1), bcg_input(:,3), style=2);
//    plot2d("nn", bcg_input(10000:13000,1)-10000, bcg_input(10000:13000,3), style=1);
    plot2d("nn", DAC_input(:,1), DAC_input(:,2), style=2);
    plot2d("nn", lpf_bcg_input_100nA(:,1), lpf_bcg_input_100nA(:,2), style=3);
    plot2d("nn", lpf_c4_bcg_input_100nA(:,1), lpf_c4_bcg_input_100nA(:,2), style=5);
legend("DAC Input","DAC input after LPF","Output_lpf100nA","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","time [ms]", "Voltage [V]");
a=gca();a.data_bounds(1,2)=0;a.data_bounds(2,2)=2.5;//a.data_bounds(1,1)=10000;a.data_bounds(2,1)=13000;

data=DAC_input;
data(:,3)=lpf_bcg_input_100nA(:,2);
data(:,4)=lpf_c4_bcg_input_100nA(:,2);
fprintfMat("bcg_results.data", data, "%5.15f");
bcg_input_copy=bcg_input(10000:13000,1);
bcg_input_copy(:,2)=bcg_input(10000:13000,3);
bcg_input_copy(:,1)=bcg_input_copy(:,1)-10000;
fprintfMat("bcg_input.data", bcg_input_copy, "%5.15f");
scf(2);
clf(2);
//    plot2d("nn", bcg_input(:,1), bcg_input(:,2), style=1);
//    plot2d("nn", bcg_input(:,1), bcg_input(:,3), style=2);
//    plot2d("nn", bcg_input(10000:13000,1)-10000, bcg_input(10000:13000,3), style=1);
    plot2d("nn", data(:,1), data(:,2), style=2);
    plot2d("nn", data(:,1), data(:,3), style=3);
    plot2d("nn", data(:,1), data(:,4), style=5);
//    plot2d("nn", data(:,1), data(:,5), style=6);
legend("DAC Input","DAC input after LPF","Output_lpf100nA","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","time [ms]", "Voltage [V]");
a=gca();a.data_bounds(1,2)=0;a.data_bounds(2,2)=2.5;//a.data_bounds(1,1)=10000;a.data_bounds(2,1)=13000;



