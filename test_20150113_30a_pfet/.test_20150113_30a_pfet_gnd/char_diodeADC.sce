// Shift 2, 20th Jan
//vchar id i2vout adc
diode_ivdd25V=[
 2.15 0.005e-9 0.590 hex2dec('09bf');
 2.18 0.010e-9 0.660 hex2dec('0a3f');
 2.20 0.050e-9 0.708 hex2dec('0b0b');
 2.25 0.200e-9 0.854 hex2dec('0db7');
 2.30 0.400e-9 0.974 hex2dec('1084');
 2.35 2.270e-9 1.100 hex2dec('1375');
 2.40 13.23e-9 1.220 hex2dec('1691');
 2.45 0.064e-6 1.334 hex2dec('1959');
 2.50 0.281e-6 1.442 hex2dec('1bee');
 2.55 0.962e-6 1.554 hex2dec('1e19');
 2.60 2.200e-6 1.638 hex2dec('206f');
 2.65 4.775e-6 1.732 hex2dec('22c2');
 2.70 8.720e-6 1.818 hex2dec('2488');
 2.75 14.12e-6 1.894 hex2dec('2682');
 2.80 22.02e-6 1.972 hex2dec('2843');
 2.85 29.13e-6 2.044 hex2dec('2a00');
 2.90 38.17e-6 2.108 hex2dec('2b80');
 2.95 48.45e-6 2.174 hex2dec('2d2b');
 3.00 59.72e-6 2.242 hex2dec('2eaa');
 3.05 71.60e-6 2.302 hex2dec('3023');
 3.10 84.03e-6 2.364 hex2dec('3186');
 3.13 91.86e-6 2.398 hex2dec('3243');
 3.14 94.48e-6 2.410 hex2dec('3293');
 3.15 97.11e-6 2.420 hex2dec('32fa');
];

//polyfit
[p1,S1]=polyfit(diode_ivdd25V(:,4), log(diode_ivdd25V(:,2)),10);
//[p_i2vout,S_i2vout]=polyfit(diode_ivdd25V(1:21,4), diode_ivdd25V(1:21,3),1);

// Eval
ADC_range_ivdd25V = hex2dec('09fb'):1:hex2dec('32fa');
diode_fit_ivdd25V = polyval(p1,ADC_range_ivdd25V,S1);
//i2vout_fit_ivdd25V = polyval(p_i2vout,ADC_range_ivdd25V,S_i2vout);
ADC_Current=[ADC_range_ivdd25V(:) exp(diode_fit_ivdd25V(:))];

ADC_Current_copy = ADC_Current;
ADC_Current_copy_size = size(ADC_Current_copy);
//Current_to_ADC = [10E-06; 100E-09; 30E-09; 20E-09; 5E-09; 1E-09; 100E-12];
Current_to_ADC=[790E-09;1120E-09;800E-09;800E-09;790E-09;1060E-09;1040E-09;740E-09;800E-09;850E-09;800E-09;800E-09;800E-09;830E-09;1040E-09;740E-09];
//Current_to_ADC = [1E-06; 2E-06; 3E-06; 4E-06; 100E-09; 200E-09; 300E-09; 400E-09; 500E-09];
Current_to_ADC_size=size(Current_to_ADC);

for k=1:Current_to_ADC_size(1,1)
    ADC_Current_copy(:,3)=abs(ADC_Current_copy(:,2)-Current_to_ADC(k,1));
    min_value = min(ADC_Current_copy(:,3));
    for h=1:ADC_Current_copy_size(1,1)
        if ADC_Current_copy(h,3) == min_value then
            Current_to_ADC(k,2) = ADC_Current_copy(h,1);
        end
    end
end

//disp(Current_to_ADC)

//// Plot the data
//scf(1);
//clf(1);
//plot(diode_ivdd25V(:,4), log10(diode_ivdd25V(:,2)),"+");
//plot(ADC_range_ivdd25V, log10(exp(diode_fit_ivdd25V)),"g-")
//legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
//xtitle("","ADC data","Ichar(A)");
//
//scf(2);
//clf(2);
//plot(diode_ivdd25V(:,4), diode_ivdd25V(:,2),"+");
//plot(ADC_range_ivdd25V,exp(diode_fit_ivdd25V),"g-")
//legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
//xtitle("","ADC data","Ichar(A)");

//polyfit
//[p1_r,S1_r]=polyfit(log(diode_ivdd25V(:,2)), diode_ivdd25V(:,4),10);

//// Eval
//Current_range_ivdd25V = log(0.050e-9):0.001:log(108.3e-6);
//diode_fit_ivdd25V_r = polyval(p1_r,Current_range_ivdd25V,S1_r);
//
//// Plot the data
//scf(1);
//clf(1);
//plot(log10(diode_ivdd25V(:,2)), diode_ivdd25V(:,4),"+");
//plot(log10(exp(Current_range_ivdd25V)), diode_fit_ivdd25V_r,"g-")
//legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
//xtitle("","Ichar(A)","ADC data");
