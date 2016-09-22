clear blk blk_objs jlist cat_num loctmp loctmp2;
global file_name jlist cat_num board_num addvmm plcvpr;
global file_name path fname extension;

importXcosDiagram(file_name);

arch = 'rasp3'; brdtype = ''; loc_num=1;
[path,fname,extension]=fileparts(file_name);
hid_dir=path+'.'+fname;


global dac_array dac_array_map gpin_array gpin_array_map number_samples period;
global file_name chip_num board_num;
global RAMP_ADC_check sftreg_check Signal_DAC_check GPIO_IN_check MITE_ADC_check plcloc;
clear dac_array dac_array_map;
dac_array = [0]; dac_array_map = ""; gpin_array = [0]; gpin_array_map = ""; number_samples = 0; period = "0x03e8";
//disp(dac_array)

//clear dac_array dac_array_map gpin_array gpin_array_map;

//exec("./input_pattern.sce")
no=length(scs_m.objs);

j=1;
objnum=1; ga_blk_num= 0; ip_count=1; gpin_blk_num= 0; numoflink=0;
numofblk=0; numofip=0; numofop=0;
dac_loc_idx=0; gpin_loc_idx=0;

dac_loc= cell();
//********** 3.0 **********
dac_loc(1,1).entries(1)= '9 0 1 #int[1]'; dac_loc(1,1).entries(2)= '2'; //DAC2 
dac_loc(1,2).entries(1)= '9 0 2 #int[2]'; dac_loc(1,2).entries(2)= '3'; //DAC3
dac_loc(1,3).entries(1)= '8 0 5 #int[5]'; dac_loc(1,3).entries(2)= '0'; //DAC0
dac_loc(1,4).entries(1)= '9 0 3 #int[3]'; dac_loc(1,4).entries(2)= '4'; //DAC4
dac_loc(1,5).entries(1)= '9 0 4 #int[4]'; dac_loc(1,5).entries(2)= '5'; //DAC5
dac_loc(1,6).entries(1)= '9 0 5 #int[5]'; dac_loc(1,6).entries(2)= '6'; //DAC6
dac_loc(1,7).entries(1)= '10 0 0 #int[0]'; dac_loc(1,7).entries(2)= '7'; //DAC7
dac_loc(1,8).entries(1)= '10 0 1 #int[1]'; dac_loc(1,8).entries(2)= '8'; //DAC8
dac_loc(1,9).entries(1)= '10 0 2 #int[2]'; dac_loc(1,9).entries(2)= '9'; //DAC9
dac_loc(1,10).entries(1)= '9 0 0 #int[0]'; dac_loc(1,10).entries(2)= '1'; //DAC1 
dac_loc(1,11).entries(1)= '10 0 3 #int[3]'; dac_loc(1,11).entries(2)= '10'; //DAC10
dac_loc(1,12).entries(1)= '10 0 4 #int[4]'; dac_loc(1,12).entries(2)= '11'; //DAC11
gpin_loc= cell();
//********** 3.0 **********
gpin_loc(1,1).entries(1)='13 0 1 #int[1]'; gpin_loc(1,1).entries(2)='0'; //west GPIO proc to arrat
gpin_loc(1,2).entries(1)='13 0 2 #int[2]'; gpin_loc(1,2).entries(2)='1'; //west
gpin_loc(1,3).entries(1)='13 0 3 #int[3]'; gpin_loc(1,3).entries(2)='2'; //west
gpin_loc(1,4).entries(1)='13 0 4 #int[4]'; gpin_loc(1,4).entries(2)='3'; //west
gpin_loc(1,5).entries(1)='13 0 5 #int[5]'; gpin_loc(1,5).entries(2)='4'; //west
gpin_loc(1,6).entries(1)='14 0 0 #int[0]'; gpin_loc(1,6).entries(2)='5'; //west
gpin_loc(1,7).entries(1)='14 0 1 #int[1]'; gpin_loc(1,7).entries(2)='6'; //west
gpin_loc(1,8).entries(1)='14 0 2 #int[2]'; gpin_loc(1,8).entries(2)='7'; //west
gpin_loc(1,9).entries(1)='14 0 3 #int[3]'; gpin_loc(1,9).entries(2)='8'; //west
gpin_loc(1,10).entries(1)='14 0 4 #int[4]'; gpin_loc(1,10).entries(2)='9'; //west
gpin_loc(1,11).entries(1)='14 0 5 #int[5]'; gpin_loc(1,11).entries(2)='10'; //west
gpin_loc(1,12).entries(1)='15 1 0 #int[0]'; gpin_loc(1,12).entries(2)='11'; //west
gpin_loc(1,13).entries(1)='15 1 1 #int[1]'; gpin_loc(1,13).entries(2)='12'; //west
gpin_loc(1,14).entries(1)='15 1 2 #int[2]'; gpin_loc(1,14).entries(2)='13'; //west
gpin_loc(1,15).entries(1)='15 1 3 #int[3]'; gpin_loc(1,15).entries(2)='14'; //west
gpin_loc(1,16).entries(1)='15 1 4 #int[4]'; gpin_loc(1,16).entries(2)='15'; //west

for i =1:no
    if(length(scs_m.objs(i) )==8)  then 
        numoflink=numoflink+1;
        link_name(1,numoflink)=i;
    elseif ( length(scs_m.objs(i) )==1) then //disp("deleted block",i);
    else
        blk(j,1)=i;
        blk_name.entries(j)=scs_m.objs(i).gui;
        blk_objs(objnum)=j; //BLOCK NUMBER actually stored
        objnum=objnum+1;
        j=j+1;
        numofblk=numofblk+1;
    end;
end;

for bl=1:length(blk_objs)
        //****************************** Arb Gen *******************************
    if (blk_name.entries(bl) =='GENARB_f') then
        arb_gen.entries=[]
        ga_idx2=size(evstr(scs_m.objs(bl).model.opar(1)), "r")
        for ii = 1:ga_idx2
            dac_loc_idx = dac_loc_idx +1;
            arb_gen(1,1).entries(1,ii)= strtod(dac_loc(loc_num,dac_loc_idx).entries(2))
        end
        genarb_dac = arb_gen(1,1).entries(1,:);
        exec("~/rasp30/prog_assembly/libs/scilab_code/genarb_compile.sce",-1);
        genarb_compile(scs_m.objs(bl).model.opar(1),scs_m.objs(bl).model.rpar(1),genarb_dac,0); // regen = 0
disp(dac_array)
        //****************************** DC IN ************************************
    elseif(blk_name.entries(bl)=='dac')  then
        Signal_DAC_check=1;
        dc.entries=[]
        for ss=1:scs_m.objs(bl).model.ipar(1)
            dac_loc_idx = dac_loc_idx +1;
            dc(1,1).entries(1,ss)= strtod(dac_loc(loc_num,dac_loc_idx).entries(2));
        end
        dc_dac = dc(1,1).entries(1,:);
        exec("~/rasp30/prog_assembly/libs/scilab_code/dc_compile.sce",-1);
        dc_compile(scs_m.objs(bl).model.opar(1),scs_m.objs(bl).model.rpar(1)',dc_dac);
    end
    //exec("/home/ubuntu/rasp30/sci2blif/sci2blif_added_blocks/gpio_in.sce",-1);
    //exec("/home/ubuntu/rasp30/sci2blif/sci2blif_added_blocks/gpio_in_fixloc.sce",-1);
end

//genarb_gpin= 15;
//genarb_gpin_compile("rampadc_meas",100000,genarb_gpin,0);

exec("~/rasp30/prog_assembly/libs/scilab_code/make_input_vector_file.sce",-1);
make_input_vector_file();

exec("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_onchipDAC.sce",-1);

//temp_string="0x0003 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0xffff"; 
temp_string="0x0003 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0x0001 0x0000 0xffff"; // 16 clock with the first data for sr_out
fd = mopen('sr_out_hex','wt'); mputl(temp_string, fd); mclose(fd);
//temp_string="0x0018 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0x0000 0xffff"; // 16 clock with the first data for sr_out
//temp_string="0x0018 0x0010 0x0018 0x0010 0x0018 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0xffff"; // 16 clock with the first data for sr_out
temp_string="0x0018 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0x0008 0x0000 0xffff"; // 16 clock with the first data for sr_out
fd = mopen('sr_itg_in_hex','wt'); mputl(temp_string, fd); mclose(fd);
unix_w("~/rasp30/prog_assembly/libs/sh/asm2ihex.sh voltage_meas ~/rasp30/prog_assembly/libs/asm_code/runmode_signalDAC_gpin_rampADC_imageconvolution_sr.s43 16384 16384 16384");


while 1==1,
    [a1,b1]=unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4300 -input_file_name input_vector");
    [a2,b2]=unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4000 -input_file_name sr_out_hex");
    [a5,b5]=unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4100 -input_file_name sr_itg_in_hex");
    if (b1==0) & (b2==0) & (b5==0) then
        //[a3,b3]=unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/run_without_uploading.tcl -speed 115200");
        [a3,b3]=unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/run.tcl -speed 115200 voltage_meas.elf");
        [a4,b4]=unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x6000 -length 1000 -output_file_name output_vector");
    end
    if (b1==0) & (b2==0) & (b3==0) & (b4==0) & (b5==0) then break end // 0 if no error occurred, 1 if error.
    if (b1==1) | (b2==1) | (b3==1) | (b4==1) | (b5==1) then disp("connection issue -> it is trying again"); unix_w('/home/ubuntu/rasp30/sci2blif/usbreset'); sleep(2000); end
end

// Read DAC_mapping_info 
fd= mopen("DAC_mapping_info"); str_temp = mgetl(fd); DAC_map_information_temp = strsplit(str_temp," "); mclose(fd);
DAC_map_information=[""];

// Check which and how many DACs were used
clear data; data = [1:2]; 
j=1; fd = mopen("input_vector_for_graph",'r');
str_temp = mgetstr(7,fd);length_input = msscanf(str_temp,"%x");
str_temp = mgetstr(7,fd);x_ori = msscanf(str_temp,"%x");
No_of_DACs=0; 
DAC15=floor(x_ori/(2^15));x_ori=x_ori-floor(x_ori/(2^15))*2^15;
DAC14=floor(x_ori/(2^14));x_ori=x_ori-floor(x_ori/(2^14))*2^14;
DAC13=floor(x_ori/(2^13));x_ori=x_ori-floor(x_ori/(2^13))*2^13;
DAC12=floor(x_ori/(2^12));x_ori=x_ori-floor(x_ori/(2^12))*2^12;
DAC11=floor(x_ori/(2^11));x_ori=x_ori-floor(x_ori/(2^11))*2^11;
DAC10=floor(x_ori/(2^10));x_ori=x_ori-floor(x_ori/(2^10))*2^10;
DAC09=floor(x_ori/(2^9));x_ori=x_ori-floor(x_ori/(2^9))*2^9;
DAC08=floor(x_ori/(2^8));x_ori=x_ori-floor(x_ori/(2^8))*2^8;
DAC07=floor(x_ori/(2^7));x_ori=x_ori-floor(x_ori/(2^7))*2^7;
DAC06=floor(x_ori/(2^6));x_ori=x_ori-floor(x_ori/(2^6))*2^6;
DAC05=floor(x_ori/(2^5));x_ori=x_ori-floor(x_ori/(2^5))*2^5;
DAC04=floor(x_ori/(2^4));x_ori=x_ori-floor(x_ori/(2^4))*2^4;
DAC03=floor(x_ori/(2^3));x_ori=x_ori-floor(x_ori/(2^3))*2^3;
DAC02=floor(x_ori/(2^2));x_ori=x_ori-floor(x_ori/(2^2))*2^2;
DAC01=floor(x_ori/(2^1));x_ori=x_ori-floor(x_ori/(2^1))*2^1;
DAC00=floor(x_ori/(2^0));x_ori=x_ori-floor(x_ori/(2^0))*2^0;
No_of_DACs=DAC00+DAC01+DAC02+DAC03+DAC04+DAC05+DAC06+DAC07+DAC08+DAC09+DAC10+DAC11+DAC12+DAC13+DAC14+DAC15;
str_temp = mgetstr(7,fd);period_graph = msscanf(str_temp,"%x");
str_temp = mgetstr(7,fd);
for j=1:length_input
    data(j,1)= period_graph * (j-1);
    for i=1:No_of_DACs
        data(j,i+1) = msscanf(str_temp,"%x");
        str_temp = mgetstr(7,fd);
    end
end
mclose(fd);

data(:,1)=data(:,1)*1E-05;  // 10us

// Converts Input hex values to voltages based on the onchip DAC calibration file
i=2;
if DAC00 == 1 then data(:,i)=polyval(p_onchip_dac00,data(:,i),S_onchip_dac00); DAC_map_information(i-1)=DAC_map_information_temp(1); i=i+1; end
if DAC01 == 1 then data(:,i)=polyval(p_onchip_dac01,data(:,i),S_onchip_dac01); DAC_map_information(i-1)=DAC_map_information_temp(2); i=i+1; end
if DAC02 == 1 then data(:,i)=polyval(p_onchip_dac02,data(:,i),S_onchip_dac02); DAC_map_information(i-1)=DAC_map_information_temp(3); i=i+1; end
if DAC03 == 1 then data(:,i)=polyval(p_onchip_dac03,data(:,i),S_onchip_dac03); DAC_map_information(i-1)=DAC_map_information_temp(4); i=i+1; end
if DAC04 == 1 then data(:,i)=polyval(p_onchip_dac04,data(:,i),S_onchip_dac04); DAC_map_information(i-1)=DAC_map_information_temp(5); i=i+1; end
if DAC05 == 1 then data(:,i)=polyval(p_onchip_dac05,data(:,i),S_onchip_dac05); DAC_map_information(i-1)=DAC_map_information_temp(6); i=i+1; end
if DAC06 == 1 then data(:,i)=polyval(p_onchip_dac06,data(:,i),S_onchip_dac06); DAC_map_information(i-1)=DAC_map_information_temp(7); i=i+1; end
if DAC07 == 1 then data(:,i)=polyval(p_onchip_dac07,data(:,i),S_onchip_dac07); DAC_map_information(i-1)=DAC_map_information_temp(8); i=i+1; end
if DAC08 == 1 then data(:,i)=polyval(p_onchip_dac08,data(:,i),S_onchip_dac08); DAC_map_information(i-1)=DAC_map_information_temp(9); i=i+1; end
if DAC09 == 1 then data(:,i)=polyval(p_onchip_dac09,data(:,i),S_onchip_dac09); DAC_map_information(i-1)=DAC_map_information_temp(10); i=i+1; end


// Result graphs
scf(101); clf(101);
legend_list = ('a');
j=1;
for i=1:No_of_DACs
    temp=modulo(j,7)+1;
//    plot2d("nn", data(:,1), data(:,i+1), style=temp); p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; p.children.mark_foreground = temp;
    plot2d("nn", data(:,1), data(:,i+1), style=temp); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = temp;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
    legend_list(j,1)='Input_' + DAC_map_information(j);
    j=j+1;
end

//temp_size_gpin=size(gpin_array);
//fd= mopen("gpin_mapping_info"); str_temp = mgetl(fd); gpin_map_info_temp = strsplit(str_temp," "); mclose(fd);
////for i=1:temp_size_gpin(1)
//for i=1:2
//    temp=modulo(j,7)+1;
//    plot2d("nn", data(:,1), 2.5*gpin_array(i,3:temp_size_gpin(2)'), style=temp); p = get("hdl"); p = get("hdl"); p.children.line_style = 1; p.children.foreground = temp;p.children.thickness = 2;p.children.line_mode = 'on';p.children.mark_mode = 'off';
//    legend_list(j,1)='GPIO_In_' + gpin_map_info_temp(i);
//    j=j+1;
//end

clear ramp_adc_data; 
fd = mopen('output_vector','r');
str_temp = mgetstr(7,fd);
//for jjj=1:length_input
jjj=1;
while str_temp~="0xffff "
    ramp_adc_data(jjj,1) = msscanf(str_temp,"%x");
    str_temp = mgetstr(7,fd);
    jjj=jjj+1;
end
mclose(fd);

ramp_adc_char=csvRead('~/rasp30/prog_assembly/libs/scilab_code/characterization/char_csv/Ramp_ADC_char_'+chip_num+'.csv');

[p_ramp_adc,S_ramp_adc]=polyfit(ramp_adc_char(:,2),ramp_adc_char(:,1),1); 
RAMP_ADC_Output_voltage=polyval(p_ramp_adc,ramp_adc_data,S_ramp_adc);
temp=modulo(j,7)+1;
//plot2d("nn", data(:,1), RAMP_ADC_Output_voltage(:), style=temp); p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; p.children.mark_foreground = temp;
//legend_list(j,1)='Ramp_ADC_' + string(j);
//j=j+1;

legend(legend_list(:,1),"in_upper_right");
xtitle("","time [s]", "Vout [V]"); b=gca(); b.data_bounds(1,1)=0; b.data_bounds(1,2)=0; b.data_bounds(2,1)=b.data_bounds(2,1)*1.1; b.data_bounds(2,2)=3;

size_temp=size(RAMP_ADC_Output_voltage);
for iii=1:size_temp(1)
    //RAMP_ADC_Output_voltage(iii,2)=iii*10.420e-3; // [A] For testing compensation circuit in integrator
    RAMP_ADC_Output_voltage(iii,2)=iii*2.4e-6; // [A] For testing compensation circuit in integrator
end
csvWrite(RAMP_ADC_Output_voltage,'RAMP_ADC_Output_voltage.csv');

n=size_temp(1)/16;
clear RampADC_vout_sr;
for i=1:n
    for j=1:16
       RampADC_vout_sr(j,i)=RAMP_ADC_Output_voltage(j+16*(i-1),1); 
    end
end
xaxis_time=[0 1]*2.4e-6;

scf(102); clf(102);
plot2d("nn", RAMP_ADC_Output_voltage(:,2), RAMP_ADC_Output_voltage(:,1), style=1); p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; p.children.mark_foreground = 1;
xtitle("","time [s]", "Vout [V]"); b=gca();b.data_bounds(1,2)=0; b.data_bounds(2,2)=2.5;

scf(103); clf(103);
for j=1:16
    temp=modulo(j,7)+1;
    plot2d("nn",xaxis_time , RampADC_vout_sr(j,:)); p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; p.children.mark_foreground = temp;p.children.line_style = 1; p.children.foreground = temp;p.children.thickness = 2;p.children.line_mode = 'on';
end
xtitle("","time [s]", "Vout [V]"); b=gca();b.data_bounds(1,2)=0; b.data_bounds(2,2)=2.5;

//disp(RAMP_ADC_Output_voltage);
//disp(RampADC_vout_sr);
disp("done");

