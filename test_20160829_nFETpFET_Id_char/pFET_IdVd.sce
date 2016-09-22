unix_g('sudo chmod 777 /dev/prologix');
h=openserial("/dev/prologix", "9600,n,8,1"); //please make sure all the tty values are correct before starting the program.
writeserial(h,"++addr 15"+ascii(10));
unix_w("sleep 1");
writeserial(h,"++auto 1"+ascii(10));
unix_w("sleep 1");
writeserial(h,"SYST:ZCH 0"+ascii(10));

pFET_dCTRL=[(0:0.1:2.3)'; (2.305:0.005:2.45)'; (2.46:0.01:2.5)';];
//pFET_dCTRL=[0.0;1;2.4;2.41;2.42;2.43;2.44;2.45;2.5];
size_pFET_dCTRL=size(pFET_dCTRL);
for i_pFET_d=1:size_pFET_dCTRL(1,1)
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(pFET_dCTRL(i_pFET_d,1))+"V run=0 start finish');
    writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    while current ==[]
        unix_g('sudo chmod 777 /dev/prologix'); h=openserial("/dev/prologix", "9600,n,8,1"); writeserial(h,"++addr 15"+ascii(10)); unix_w("sleep 1"); writeserial(h,"++auto 1"+ascii(10)); unix_w("sleep 1"); writeserial(h,"SYST:ZCH 0"+ascii(10));
        writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    end
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(pFET_dCTRL(i_pFET_d,1))+"V run=0 start watch=2s analogin record channel=1 enable=1 range=2V offset=0 frequency=1k run=0.01s start save=null_data.csv');
    pFET_dCTRL(i_pFET_d,2)=abs(current);
    disp('S: 0V V D:'+string(pFET_dCTRL(i_pFET_d,1))+'V Current:'+string(current));
end
csvWrite(pFET_dCTRL,'data_pFET_IdVd.csv');
disp("done");

pFET_IdVd=csvRead('data_pFET_IdVd.csv');
scf(6);clf(6);
plot2d("nl", pFET_IdVd(:,1), pFET_IdVd(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vd(V)","Id(A)");
