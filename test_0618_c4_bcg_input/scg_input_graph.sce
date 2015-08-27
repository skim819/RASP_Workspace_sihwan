// Sampling rate: 1000
scg_input(:,2) = fscanfMat('scg.txt');
a_temp=size(scg_input);
scg_input(:,1)=linspace(0,a_temp(1,1)-1,a_temp(1,1))';
offset_for_BPF_input=1.25-mean(scg_input(:,2));
scg_input(:,3)=scg_input(:,2)+offset_for_BPF_input;

DAC_input = fscanfMat('c4_bcg_input_10000to13000_Ch1.txt');
DAC_input(:,1)=DAC_input(:,1)*1000;
c4_bcg_input_x18_x6_250pA_35pA = fscanfMat('c4_bcg_input_x18_x6_250pA_35pA_Ch2.txt');
c4_bcg_input_x18_x6_250pA_35pA(:,1)=c4_bcg_input_x18_x6_250pA_35pA(:,1)*1000;
c4_bcg_input_x18_x6_300pA_35pA = fscanfMat('c4_bcg_input_x18_x6_300pA_35pA_Ch2.txt');
c4_bcg_input_x18_x6_300pA_35pA(:,1)=c4_bcg_input_x18_x6_300pA_35pA(:,1)*1000;
c4_bcg_input_x18_x6_500pA_35pA = fscanfMat('c4_bcg_input_x18_x6_500pA_35pA_Ch2.txt');
c4_bcg_input_x18_x6_500pA_35pA(:,1)=c4_bcg_input_x18_x6_500pA_35pA(:,1)*1000;

scf(1);
clf(1);
    plot2d("nn", scg_input(:,1), scg_input(:,2), style=1);
    plot2d("nn", scg_input(:,1), scg_input(:,3), style=2);
    plot2d("nn", scg_input(10000:13000,1)-10000, scg_input(10000:13000,3), style=1);
    plot2d("nn", DAC_input(:,1), DAC_input(:,2), style=2);
    plot2d("nn", c4_bcg_input_x18_x6_250pA_35pA(:,1), c4_bcg_input_x18_x6_250pA_35pA(:,2), style=3);
    plot2d("nn", c4_bcg_input_x18_x6_300pA_35pA(:,1), c4_bcg_input_x18_x6_300pA_35pA(:,2), style=5);
    plot2d("nn", c4_bcg_input_x18_x6_500pA_35pA(:,1), c4_bcg_input_x18_x6_500pA_35pA(:,2), style=6);
legend("Measured Input","DAC input","x18_x6_250pA_35pA","x18_x6_300pA_35pA","x18_x6_500pA_35pA","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","time [ms]", "Voltage [V]");
a=gca();a.data_bounds(1,2)=0;a.data_bounds(2,2)=2.5;//a.data_bounds(1,1)=10000;a.data_bounds(2,1)=13000;

myVariable = scg_input(10000:13000,3)';

data=DAC_input;
data(:,3)=c4_bcg_input_x18_x6_250pA_35pA(:,2);
data(:,4)=c4_bcg_input_x18_x6_300pA_35pA(:,2);
data(:,5)=c4_bcg_input_x18_x6_500pA_35pA(:,2);
fprintfMat("bcg_results.data", data, "%5.15f");
bcg_input_copy=bcg_input(10000:13000,1);
bcg_input_copy(:,2)=bcg_input(10000:13000,3);
bcg_input_copy(:,1)=bcg_input_copy(:,1)-10000;
fprintfMat("bcg_input.data", bcg_input_copy, "%5.15f");
scf(2);
clf(2);
//    plot2d("nn", bcg_input(:,1), bcg_input(:,2), style=1);
//    plot2d("nn", bcg_input(:,1), bcg_input(:,3), style=2);
    plot2d("nn", bcg_input(10000:13000,1)-10000, bcg_input(10000:13000,3), style=1);
    plot2d("nn", data(:,1), data(:,2), style=2);
    plot2d("nn", data(:,1), data(:,3), style=3);
    plot2d("nn", data(:,1), data(:,4), style=5);
    plot2d("nn", data(:,1), data(:,5), style=6);
legend("Measured Input","DAC input","x18_x6_250pA_35pA","x18_x6_300pA_35pA","x18_x6_500pA_35pA","in_lower_right"); // "in_upper_left" "in_lower_right"
xtitle("","time [ms]", "Voltage [V]");
a=gca();a.data_bounds(1,2)=0;a.data_bounds(2,2)=2.5;//a.data_bounds(1,1)=10000;a.data_bounds(2,1)=13000;



