// Shift 2, 20th Jan
//vchar id i2vout adc
diode_ivdd25V=[
// 2.10 0.005e-9 0.688 hex2dec('0969');
 2.15 0.050e-9 0.820 hex2dec('0baf');
 2.18 0.120e-9 0.897 hex2dec('0d7b');
 2.20 0.200e-9 0.951 hex2dec('0e9f');
 2.25 1.220e-9 1.078 hex2dec('11df');
 2.30 7.300e-9 1.206 hex2dec('1508');
 2.35 38.77e-9 1.329 hex2dec('17f4');
 2.40 0.197e-6 1.456 hex2dec('1b02');
 2.45 0.694e-6 1.562 hex2dec('1da7');
 2.50 1.735e-6 1.652 hex2dec('1fc0');
 2.55 4.242e-6 1.755 hex2dec('223f');
 2.60 8.000e-6 1.842 hex2dec('2446');
 2.65 13.26e-6 1.924 hex2dec('2649');
 2.70 19.87e-6 2.000 hex2dec('2821');
 2.75 27.86e-6 2.074 hex2dec('29cf');
 2.80 36.87e-6 2.143 hex2dec('2b80');
 2.85 48.16e-6 2.219 hex2dec('2d45');
 2.90 59.30e-6 2.284 hex2dec('2ece');
 2.95 69.94e-6 2.338 hex2dec('3019');
 3.00 82.36e-6 2.394 hex2dec('3181');
 3.05 94.75e-6 2.445 hex2dec('3319');
 3.10 108.3e-6 2.502 hex2dec('3644');
 3.15 120.3e-6 2.544 hex2dec('3d60');
];

//polyfit
[p1,S1]=polyfit(diode_ivdd25V(:,4), log(diode_ivdd25V(:,2)),10);
//[p_i2vout,S_i2vout]=polyfit(diode_ivdd25V(1:21,4), diode_ivdd25V(1:21,3),1);

// Eval
ADC_range_ivdd25V = hex2dec('0baf'):1:hex2dec('3644');
diode_fit_ivdd25V = polyval(p1,ADC_range_ivdd25V,S1);
//i2vout_fit_ivdd25V = polyval(p_i2vout,ADC_range_ivdd25V,S_i2vout);
ADC_Current=[ADC_range_ivdd25V(:) exp(diode_fit_ivdd25V(:))];

ADC_Current_copy = ADC_Current;
ADC_Current_copy_size = size(ADC_Current_copy);
Current_to_ADC = [10E-06; 100E-09; 30E-09; 20E-09; 5E-09; 1E-09; 100E-12];
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
