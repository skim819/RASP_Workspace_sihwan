// Shift 2, 20th Jan
//vchar id i2vout adc
diode_ivdd25V=[
// 2.10 0.005e-9 0.688 hex2dec('0969');
 2.15 0.060e-9 0.868 hex2dec('0bb7');
 2.18 0.150e-9 0.945 hex2dec('0d2f');
 2.20 0.211e-9 0.999 hex2dec('0ed9');
 2.25 1.150e-9 1.128 hex2dec('11f5');
 2.30 5.600e-9 1.244 hex2dec('1399');
 2.35 31.00e-9 1.367 hex2dec('16cd');
 2.40 138.0e-9 1.476 hex2dec('192e');
 2.45 0.569e-6 1.591 hex2dec('1b86');
 2.50 1.460e-6 1.682 hex2dec('1d95');
 2.55 3.515e-6 1.785 hex2dec('1fe0');
 2.60 6.340e-6 1.864 hex2dec('21b5');
 2.65 10.71e-6 1.942 hex2dec('235e');
 2.70 16.26e-6 2.016 hex2dec('24f4');
 2.75 22.89e-6 2.085 hex2dec('26a0');
 2.80 31.29e-6 2.158 hex2dec('2815');
 2.85 39.78e-6 2.221 hex2dec('2973');
 2.90 48.94e-6 2.281 hex2dec('2abe');
 2.95 57.68e-6 2.331 hex2dec('2bda');
 3.00 67.75e-6 2.382 hex2dec('2d1c');
 3.05 79.10e-6 2.435 hex2dec('2edb');
 3.10 88.41e-6 2.475 hex2dec('3103');
 3.13 94.59e-6 2.500 hex2dec('347b');
 3.14 97.65e-6 2.512 hex2dec('36b8');
 3.15 98.66e-6 2.516 hex2dec('37c1');
];

//polyfit
[p1,S1]=polyfit(diode_ivdd25V(:,4), log(diode_ivdd25V(:,2)),10);
//[p_i2vout,S_i2vout]=polyfit(diode_ivdd25V(1:21,4), diode_ivdd25V(1:21,3),1);

// Eval
ADC_range_ivdd25V = hex2dec('0bb7'):1:hex2dec('37c1');
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

// Plot the data
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
