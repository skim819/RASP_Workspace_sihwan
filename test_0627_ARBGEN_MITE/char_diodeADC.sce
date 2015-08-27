// Shift 2, 25th Jun
//vchar id i2vout adc
diode_ivdd25V=[
 2.15 0.036e-9 0.814 hex2dec('0cbe');
 2.18 0.070e-9 0.893 hex2dec('0ed7');
 2.20 0.150e-9 0.973 hex2dec('104c');
 2.25 0.900e-9 1.081 hex2dec('13d5');
 2.30 4.590e-9 1.200 hex2dec('1710');
 2.35 29.22e-9 1.334 hex2dec('1ad0');
 2.40 0.152e-6 1.461 hex2dec('1e49');
 2.45 0.535e-6 1.566 hex2dec('2113');
 2.50 1.381e-6 1.654 hex2dec('2380');
 2.55 3.165e-6 1.743 hex2dec('25e5');
 2.60 6.225e-6 1.829 hex2dec('285a');
 2.65 11.22e-6 1.919 hex2dec('2aaf');
 2.70 17.28e-6 2.000 hex2dec('2cca');
 2.75 24.70e-6 2.074 hex2dec('2ec0');
 2.80 33.31e-6 2.145 hex2dec('30b9');
 2.85 43.03e-6 2.217 hex2dec('3296');
 2.90 53.69e-6 2.287 hex2dec('3454');
 2.95 65.09e-6 2.351 hex2dec('3619');
 3.00 77.02e-6 2.410 hex2dec('37d5');
 3.05 90.38e-6 2.468 hex2dec('39fb');
 3.10 102.2e-6 2.520 hex2dec('3d64');
];

//polyfit
[p1,S1]=polyfit(diode_ivdd25V(:,4), log(diode_ivdd25V(:,2)),10);
//[p_i2vout,S_i2vout]=polyfit(diode_ivdd25V(1:21,4), diode_ivdd25V(1:21,3),1);

// Eval
ADC_range_ivdd25V = hex2dec('0cbe'):1:hex2dec('3d64');
diode_fit_ivdd25V = polyval(p1,ADC_range_ivdd25V,S1);
//i2vout_fit_ivdd25V = polyval(p_i2vout,ADC_range_ivdd25V,S_i2vout);
ADC_Current=[ADC_range_ivdd25V(:) exp(diode_fit_ivdd25V(:))];

ADC_Current_copy = ADC_Current;
ADC_Current_copy_size = size(ADC_Current_copy);
Current_to_ADC = [129E-09; 88E-09; 23E-09; 5E-09; 30E-09;20E-09;5E-09;1E-09;215E-09;149E-09;41E-09;8E-09;1E-09];
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

//scf(3);
//clf(3);
//plot(diode_ivdd25V(:,4), diode_ivdd25V(:,3),"+");
//plot(ADC_range_ivdd25V,i2vout_fit_ivdd25V,"g-");
//xtitle("","ADC data","I2Vout(V)");


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
//
//scf(2);
//clf(2);
//plot(diode_ivdd25V(:,2), diode_ivdd25V(:,4),"+");
//plot(exp(Current_range_ivdd25V),diode_fit_ivdd25V_r,"g-")
//legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
//xtitle("","Ichar(A)","ADC data");
