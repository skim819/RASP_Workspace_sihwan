diode_ivdd25V=csvRead("data_diodeADC_ivdd25V");

//polyfit
[p1,S1]=polyfit(diode_ivdd25V(:,4), log(diode_ivdd25V(:,2)),10);
//[p_i2vout,S_i2vout]=polyfit(diode_ivdd25V(1:21,4), diode_ivdd25V(1:21,3),1);

size_diode_ivdd25V=size(diode_ivdd25V);

// Eval
ADC_range_ivdd25V = diode_ivdd25V(1,4):1:diode_ivdd25V(size_diode_ivdd25V(1,1),4);
diode_fit_ivdd25V = polyval(p1,ADC_range_ivdd25V,S1);
//i2vout_fit_ivdd25V = polyval(p_i2vout,ADC_range_ivdd25V,S_i2vout);
ADC_Current=[ADC_range_ivdd25V(:) exp(diode_fit_ivdd25V(:))];

ADC_Current_copy = ADC_Current;
ADC_Current_copy_size = size(ADC_Current_copy);
Current_to_ADC = [10E-06; 1E-06; 100E-09; 10E-09; 1E-09; 100E-12];
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

//disp(Current_to_ADC);

//// Plot the data
//scf(1);
//clf(1);
//plot2d("nl", diode_ivdd25V(:,4), diode_ivdd25V(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
//plot2d("nl", ADC_range_ivdd25V, exp(diode_fit_ivdd25V), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
//xtitle("","ADC data","Ichar(A)");
