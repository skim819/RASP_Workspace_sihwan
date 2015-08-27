// Shift 2, 20th Jan
//vchar id i2vout adc
diode_ivdd25V=[
// 2.10 0.005e-9 0.688 hex2dec('0969');
 2.15 0.088e-9 0.815 hex2dec('0d7d');
 2.18 0.150e-9 0.892 hex2dec('1008');
 2.20 0.198e-9 0.946 hex2dec('1194');
 2.25 0.998e-9 1.076 hex2dec('1579');
 2.30 6.915e-9 1.220 hex2dec('19bc');
 2.35 32.48e-9 1.333 hex2dec('1d47');
 2.40 0.153e-6 1.452 hex2dec('2084');
 2.45 0.586e-6 1.563 hex2dec('23bc');
 2.50 1.687e-6 1.666 hex2dec('26bc');
 2.55 4.150e-6 1.770 hex2dec('2836');
 2.60 7.235e-6 1.844 hex2dec('2bdc');
 2.65 11.90e-6 1.923 hex2dec('2e1e');
 2.70 17.74e-6 1.997 hex2dec('3037');
 2.75 25.29e-6 2.073 hex2dec('323b');
 2.80 32.36e-6 2.134 hex2dec('3403');
 2.85 40.99e-6 2.199 hex2dec('35f0');
 2.90 51.01e-6 2.265 hex2dec('37b2');
 2.95 60.06e-6 2.318 hex2dec('393c');
 3.00 70.88e-6 2.375 hex2dec('3aef');
 3.05 81.01e-6 2.423 hex2dec('3caa');
 3.10 91.50e-6 2.468 hex2dec('3f10');
// 3.15 101.8e-6 2.509 hex2dec('03c8');
];

//polyfit
[p1,S1]=polyfit(diode_ivdd25V(:,4), log(diode_ivdd25V(:,2)),10);
//[p_i2vout,S_i2vout]=polyfit(diode_ivdd25V(1:21,4), diode_ivdd25V(1:21,3),1);

// Eval
ADC_range_ivdd25V = hex2dec('0d7d'):1:hex2dec('3f10');
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
