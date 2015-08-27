// Shift 2, 20th Jan
//vchar id i2vout adc
diode_ivdd25V=[
// 2.10 0.005e-9 0.688 hex2dec('0969');
 2.15 0.041e-9 0.802 hex2dec('0a5d');
 2.18 0.080e-9 0.896 hex2dec('0c98');
 2.20 0.157e-9 0.946 hex2dec('0db1');
 2.25 1.133e-9 1.092 hex2dec('10e7');
 2.30 5.785e-9 1.208 hex2dec('137d');
 2.35 32.18e-9 1.333 hex2dec('1651');
 2.40 0.176e-6 1.463 hex2dec('1927');
 2.45 0.554e-6 1.558 hex2dec('1b51');
 2.50 1.758e-6 1.667 hex2dec('1dbd');
 2.55 3.912e-6 1.758 hex2dec('1ec5');
 2.60 7.314e-6 1.842 hex2dec('2181');
 2.65 11.94e-6 1.920 hex2dec('2339');
 2.70 17.71e-6 1.992 hex2dec('24ca');
 2.75 24.51e-6 2.061 hex2dec('2641');
 2.80 32.17e-6 2.127 hex2dec('27a4');
 2.85 40.84e-6 2.192 hex2dec('2910');
 2.90 49.81e-6 2.251 hex2dec('2a4e');
 2.95 59.40e-6 2.308 hex2dec('2b88');
 3.00 69.43e-6 2.362 hex2dec('2ca6');
 3.05 79.80e-6 2.413 hex2dec('2de6');
 3.10 91.31e-6 2.464 hex2dec('2f82');
 3.15 100.5e-6 2.502 hex2dec('31aa');
];

//polyfit
[p1,S1]=polyfit(diode_ivdd25V(:,4), log(diode_ivdd25V(:,2)),10);
//[p_i2vout,S_i2vout]=polyfit(diode_ivdd25V(1:21,4), diode_ivdd25V(1:21,3),1);

// Eval
ADC_range_ivdd25V = hex2dec('0a5d'):1:hex2dec('31aa');
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
