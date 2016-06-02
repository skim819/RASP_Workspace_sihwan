cd("~/RASP_Workspace/test_20160103_tr_gm_saturation"); 

Vd='100mV';
Process='350nm';

// nFET //
clear current nFET_gCTRL;
nFET_gCTRL = [(0:0.1:5)' (0:0.1:5)';]; // 350nm

unix_g('sudo chmod 777 /dev/prologix');
h=openserial("/dev/prologix", "9600,n,8,1"); //please make sure all the tty values are correct before starting the program.
writeserial(h,"++addr 15"+ascii(10));
unix_w("sleep 1");
writeserial(h,"++auto 1"+ascii(10));
unix_w("sleep 1");
writeserial(h,"SYST:ZCH 0"+ascii(10));

size_nFET_gCTRL=size(nFET_gCTRL);
xpause_time=3000000; //initial value
for i_nFET_g=1:size_nFET_gCTRL(1,1)
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(nFET_gCTRL(i_nFET_g,1))+"V run=0 start finish');
    writeserial(h,"READ?"+ascii(10)); xpause(xpause_time); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(nFET_gCTRL(i_nFET_g,1))+"V run=0 start watch=2s analogin record channel=1 enable=1 range=2V offset=0 frequency=1k run=0.01s start save=null_data.csv');
    nFET_gCTRL(i_nFET_g,2)=abs(current);
    //if nFET_gCTRL(i_nFET_g,2) > 1e-09; xpause_time=1000000; end
    disp('Vg:'+string(nFET_gCTRL(i_nFET_g,1))+'V Current:'+string(current));
end

csvWrite(nFET_gCTRL,'nFET_IdVg_Vd_'+Vd+'_'+Process);

scf(1);clf(1);
plot2d("nl", nFET_gCTRL(:,1), nFET_gCTRL(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//legend("Data","Data for linefit","linefit","in_lower_right"); //a=gca();a.data_bounds=[0 1e-10; 2.5 1e-3];
xtitle("","Vg [V]","Id [A]");
title('Id vs. Vg ');
scf(2);clf(2);
plot2d("nn", nFET_gCTRL(:,1), nFET_gCTRL(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//legend("Data","Data for linefit","linefit","in_lower_right"); //a=gca();a.data_bounds=[0 1e-10; 2.5 1e-3];
xtitle("","Vg [V]","Id [A]");
title('Id vs. Vg ');
disp("nFET calibration done");
