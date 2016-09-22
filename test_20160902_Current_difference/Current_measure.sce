clear data xcos_list;
//data=[1 5e-9;2 10e-9;3 20e-9;4 40e-9;5 80e-9;6 160e-9;7 320e-9;8 640e-9;9 1e-6;10 2e-6;11 4e-6;12 8e-6;]
data=[3 20e-9;4 40e-9;5 80e-9;6 160e-9;7 320e-9;8 640e-9;9 1e-6;10 2e-6;11 4e-6;12 8e-6;]
//xcos_list=[//'Current_difference_5nA_loc_10_1.xcos';'Current_difference_10nA_loc_10_1.xcos';
//'Current_difference_20nA_loc_10_1.xcos';'Current_difference_40nA_loc_10_1.xcos';'Current_difference_80nA_loc_10_1.xcos';'Current_difference_160nA_loc_10_1.xcos';'Current_difference_320nA_loc_10_1.xcos';
//'Current_difference_640nA_loc_10_1.xcos';'Current_difference_1uA_loc_10_1.xcos';'Current_difference_2uA_loc_10_1.xcos';'Current_difference_4uA_loc_10_1.xcos';'Current_difference_8uA_loc_10_1.xcos';];
//xcos_list=[
//'Current_difference_20nA_loc_11_1.xcos';'Current_difference_40nA_loc_11_1.xcos';'Current_difference_80nA_loc_11_1.xcos';'Current_difference_160nA_loc_11_1.xcos';'Current_difference_320nA_loc_11_1.xcos';
//'Current_difference_640nA_loc_11_1.xcos';'Current_difference_1uA_loc_11_1.xcos';'Current_difference_2uA_loc_11_1.xcos';'Current_difference_4uA_loc_11_1.xcos';'Current_difference_8uA_loc_11_1.xcos';];
xcos_list=[
'Current_difference_20nA_loc_10_2.xcos';'Current_difference_40nA_loc_10_2.xcos';'Current_difference_80nA_loc_10_2.xcos';'Current_difference_160nA_loc_10_2.xcos';'Current_difference_320nA_loc_10_2.xcos';
'Current_difference_640nA_loc_10_2.xcos';'Current_difference_1uA_loc_10_2.xcos';'Current_difference_2uA_loc_10_2.xcos';'Current_difference_4uA_loc_10_2.xcos';'Current_difference_8uA_loc_10_2.xcos';];
unix_g('sudo chmod 777 /dev/prologix');
h=openserial("/dev/prologix", "9600,n,8,1"); //please make sure all the tty values are correct before starting the program.
writeserial(h,"++addr 15"+ascii(10));
unix_w("sleep 1");
writeserial(h,"++auto 1"+ascii(10));
unix_w("sleep 1");
writeserial(h,"SYST:ZCH 0"+ascii(10));

i=1
writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
while current ==[]
    unix_g('sudo chmod 777 /dev/prologix'); h=openserial("/dev/prologix", "9600,n,8,1"); writeserial(h,"++addr 15"+ascii(10)); unix_w("sleep 1"); writeserial(h,"++auto 1"+ascii(10)); unix_w("sleep 1"); writeserial(h,"SYST:ZCH 0"+ascii(10));
    writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
end
data(i,3)=abs(current);

size_xcos_list=size(xcos_list);
for i=2:size_xcos_list(1,1)
    unix_w("cp "+xcos_list(i)+" Current_difference.xcos");
    Compile_Design_callback();
    etc2_callback();
    writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    while current ==[]
        unix_g('sudo chmod 777 /dev/prologix'); h=openserial("/dev/prologix", "9600,n,8,1"); writeserial(h,"++addr 15"+ascii(10)); unix_w("sleep 1"); writeserial(h,"++auto 1"+ascii(10)); unix_w("sleep 1"); writeserial(h,"SYST:ZCH 0"+ascii(10));
        writeserial(h,"READ?"+ascii(10)); xpause(3000000); temp_a=readserial(h); temp_b=part(temp_a,1:14); current(1,1)=msscanf(temp_b,"%lg");
    end
    data(i,3)=abs(current);
    disp(string(i)+" done");
end
//csvWrite(data,'data_loc_10_1.csv');
//csvWrite(data,'data_loc_11_1.csv');
csvWrite(data,'data_loc_10_2.csv');
disp("done");

data1=csvRead('data_loc_10_1.csv');
scf(1);clf(1);
plot2d("nl", data1(:,1), data1(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 2; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", data1(:,1), data1(:,3));p = get("hdl"); p.children.mark_style = 4; p.children.thickness = 2; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-9; 12 1e-4];
xtitle("","Target I(A)","Measured I(A)");

data2=csvRead('data_loc_11_1.csv');
scf(2);clf(2);
plot2d("nl", data2(:,1), data2(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 2; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", data2(:,1), data2(:,3));p = get("hdl"); p.children.mark_style = 4; p.children.thickness = 2; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-9; 12 1e-4];
xtitle("","Target I(A)","Measured I(A)");

data3=csvRead('data_loc_10_2.csv');
scf(3);clf(3);
plot2d("nl", data3(:,1), data3(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 2; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", data3(:,1), data3(:,3));p = get("hdl"); p.children.mark_style = 4; p.children.thickness = 2; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-9; 12 1e-4];
xtitle("","Target I(A)","Measured I(A)");


data4=csvRead('data_loc_10_1_before_mismatchtable.csv');
scf(4);clf(4);
plot2d("nl", data4(:,1), data4(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 2; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", data4(:,1), data4(:,3));p = get("hdl"); p.children.mark_style = 4; p.children.thickness = 2; p.children.line_mode="off";p.children.mark_foreground=1;
a=gca();a.data_bounds=[0 1e-9; 12 1e-4];
xtitle("","Target I(A)","Measured I(A)");

