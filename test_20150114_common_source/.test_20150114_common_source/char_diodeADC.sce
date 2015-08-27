// Shift 2, 20th Jan
//vchar id i2vout adc
diode_ivdd25V=[
 2.15 0.020e-9 0.760 hex2dec('0e26');
 2.18 0.050e-9 0.850 hex2dec('10e2');
 2.20 0.100e-9 0.890 hex2dec('11b8');
 2.25 0.400e-9 1.020 hex2dec('1553');
 2.30 2.900e-9 1.170 hex2dec('19b3');
 2.35 13.00e-9 1.260 hex2dec('1bfb');
 2.40 62.00e-9 1.360 hex2dec('1f31');
 2.45 0.200e-6 1.470 hex2dec('22d1');
 2.50 0.780e-6 1.578 hex2dec('2540');
 2.55 1.830e-6 1.660 hex2dec('27e5');
 2.60 3.720e-6 1.742 hex2dec('2988');
 2.65 6.760e-6 1.817 hex2dec('2bc2');
 2.70 11.00e-6 1.894 hex2dec('2e4b');
 2.75 16.60e-6 1.966 hex2dec('3057');
 2.80 23.86e-6 2.039 hex2dec('3240');
 2.85 32.20e-6 2.109 hex2dec('3440');
 2.90 41.25e-6 2.177 hex2dec('3610');
 2.95 51.75e-6 2.243 hex2dec('37be');
 3.00 63.00e-6 2.306 hex2dec('398d');
 3.05 75.00e-6 2.370 hex2dec('3b47');
 3.10 87.20e-6 2.415 hex2dec('3ce9');
 3.13 94.86e-6 2.457 hex2dec('3dd0');
 3.14 97.46e-6 2.467 hex2dec('3e27');
 3.15 100.0e-6 2.475 hex2dec('3ec0');
];

//polyfit
[p1,S1]=polyfit(diode_ivdd25V(:,4), log(diode_ivdd25V(:,2)),10);
//[p_i2vout,S_i2vout]=polyfit(diode_ivdd25V(1:21,4), diode_ivdd25V(1:21,3),1);

// Eval
ADC_range_ivdd25V = hex2dec('0e26'):1:hex2dec('3ec0');
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
