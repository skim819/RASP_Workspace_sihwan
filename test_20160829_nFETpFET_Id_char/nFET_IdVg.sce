unix_g('sudo chmod 777 /dev/prologix');
h=openserial("/dev/prologix", "9600,n,8,1"); //please make sure all the tty values are correct before starting the program.
writeserial(h,"++addr 15"+ascii(10));
unix_w("sleep 1");
writeserial(h,"++auto 1"+ascii(10));
unix_w("sleep 1");
writeserial(h,"SYST:ZCH 0"+ascii(10));

nFET_gCTRL=[0.0 0; 0.05 0; 0.1 0; 0.12 0; 0.14 0; 0.16 0; 0.18 0; 0.2 0; 0.22 0; 0.24 0; 0.26 0; 0.28 0; 0.3 0; 0.32 0; 0.34 0; 0.36 0; 0.38 0; 0.4 0; 0.42 0; 0.44 0; 0.46 0; 0.48 0; 0.5 0; 0.52 0; 0.54 0; 0.56 0; 0.58 0; 0.6 0; 0.65 0; 0.7 0; 0.75 0; 0.8 0; 0.85 0;0.9 0; 0.95 0; 1.0 0; 1.05 0; 1.1 0; 1.15 0; 1.2 0; 1.25 0; 1.3 0; 1.35 0; 1.4 0; 1.45 0; 1.5 0; 1.6 0; 1.7 0; 1.8 0; 1.9 0; 2.0 0; 2.1 0; 2.2 0; 2.3 0; 2.4 0; 2.5 0;];
size_nFET_gCTRL=size(nFET_gCTRL);
for i_nFET_g=1:size_nFET_gCTRL(1,1)
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(nFET_gCTRL(i_nFET_g,1))+"V run=0 start finish');
    writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    while current ==[]
        unix_g('sudo chmod 777 /dev/prologix'); h=openserial("/dev/prologix", "9600,n,8,1"); writeserial(h,"++addr 15"+ascii(10)); unix_w("sleep 1"); writeserial(h,"++auto 1"+ascii(10)); unix_w("sleep 1"); writeserial(h,"SYST:ZCH 0"+ascii(10));
        writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    end
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(nFET_gCTRL(i_nFET_g,1))+"V run=0 start watch=2s analogin record channel=1 enable=1 range=2V offset=0 frequency=1k run=0.01s start save=null_data.csv');
    nFET_gCTRL(i_nFET_g,2)=abs(current);
    disp('D: 2.5V V G:'+string(nFET_gCTRL(i_nFET_g,1))+'V Current:'+string(current));
    //if abs(current) <= 50e-9 then nFET_g_fix = nFET_gCTRL(i_nFET_g,1); end
end
csvWrite(nFET_gCTRL,'data_nFET_IdVg.csv');
disp("done");

nFET_IdVg=csvRead('data_nFET_IdVg.csv');
scf(1);clf(1);
plot2d("nl", nFET_IdVg(:,1), nFET_IdVg(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vg(V)","Id(A)");

