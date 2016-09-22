unix_g('sudo chmod 777 /dev/prologix');
h=openserial("/dev/prologix", "9600,n,8,1"); //please make sure all the tty values are correct before starting the program.
writeserial(h,"++addr 15"+ascii(10));
unix_w("sleep 1");
writeserial(h,"++auto 1"+ascii(10));
unix_w("sleep 1");
writeserial(h,"SYST:ZCH 0"+ascii(10));

//nFET_sCTRL=[(0:0.05:0.6)'; (0.62:0.02:1.2)'; (1.3:0.1:2.5)']
nFET_sCTRL=[(0.6:0.1:1.2)'; (1.22:0.02:2.1)'; (2.2:0.1:2.5)']
//nFET_sCTRL=[0.0 0; 0.5 0; 1 0; 1.5 0; 2.0 0; 2.5 0;];
size_nFET_sCTRL=size(nFET_sCTRL);
for i_nFET_s=1:size_nFET_sCTRL(1,1)
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(nFET_sCTRL(i_nFET_s,1))+"V run=0 start finish');
    writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    while current ==[]
        unix_g('sudo chmod 777 /dev/prologix'); h=openserial("/dev/prologix", "9600,n,8,1"); writeserial(h,"++addr 15"+ascii(10)); unix_w("sleep 1"); writeserial(h,"++auto 1"+ascii(10)); unix_w("sleep 1"); writeserial(h,"SYST:ZCH 0"+ascii(10));
        writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    end
    unix_g('sudo dwfcmd connect target=analogout channel=0 enable=1 function=dc offset="+string(nFET_sCTRL(i_nFET_s,1))+"V run=0 start watch=2s analogin record channel=1 enable=1 range=2V offset=0 frequency=1k run=0.01s start save=null_data.csv');
    nFET_sCTRL(i_nFET_s,2)=abs(current);
    disp('D: 2.5V V S:'+string(nFET_sCTRL(i_nFET_s,1))+'V Current:'+string(current));
end
csvWrite(nFET_sCTRL,'data_nFET_IdVs.csv');
disp("done");

nFET_IdVs=csvRead('data_nFET_IdVs.csv');
scf(2);clf(2);
plot2d("nl", nFET_IdVs(:,1), nFET_IdVs(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-11; 2.5 1e-4];
xtitle("","Vs(V)","Id(A)");

