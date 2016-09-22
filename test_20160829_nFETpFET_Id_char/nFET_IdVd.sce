unix_g('sudo chmod 777 /dev/prologix');
h=openserial("/dev/prologix", "9600,n,8,1"); //please make sure all the tty values are correct before starting the program.
writeserial(h,"++addr 15"+ascii(10));
unix_w("sleep 1");
writeserial(h,"++auto 1"+ascii(10));
unix_w("sleep 1");
writeserial(h,"SYST:ZCH 0"+ascii(10));

nFET_dCTRL=[(0.9:0.005:1.1)'; (1.2:0.1:2.5)';]
//nFET_dCTRL=[0.0 0; 0.1 0; 0.2 0; 0.3 0; 0.4 0;0.5 0; 1 0;2.0 0;];
size_nFET_dCTRL=size(nFET_dCTRL);
for i_nFET_d=1:size_nFET_dCTRL(1,1)
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(nFET_dCTRL(i_nFET_d,1))+"V run=0 start finish');
    writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    while current ==[]
        unix_g('sudo chmod 777 /dev/prologix'); h=openserial("/dev/prologix", "9600,n,8,1"); writeserial(h,"++addr 15"+ascii(10)); unix_w("sleep 1"); writeserial(h,"++auto 1"+ascii(10)); unix_w("sleep 1"); writeserial(h,"SYST:ZCH 0"+ascii(10));
        writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    end
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(nFET_dCTRL(i_nFET_d,1))+"V run=0 start watch=2s analogin record channel=1 enable=1 range=2V offset=0 frequency=1k run=0.01s start save=null_data.csv');
    nFET_dCTRL(i_nFET_d,2)=abs(current);
    disp('S: 0V V D:'+string(nFET_dCTRL(i_nFET_d,1))+'V Current:'+string(current));
end
csvWrite(nFET_dCTRL,'data_nFET_IdVd.csv');
disp("done");

nFET_IdVd=csvRead('data_nFET_IdVd.csv');
scf(3);clf(3);
plot2d("nl", nFET_IdVd(:,1), nFET_IdVd(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vd(V)","Id(A)");
