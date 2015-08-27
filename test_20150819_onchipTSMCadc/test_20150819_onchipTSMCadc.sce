global file_name path fname extension chip_num board_num brdtype hex_1nA hex_1na;
global dac_array dac_array_map number_samples period;
chip_num="16"; board_num=2; brdtype = ''; // 2: 3.0, 3: 3.0a, '':3.0 '_30a':3.0a
cd("~/RASP_Workspace/test_20150819_onchipTSMCadc");
path =  pwd();
file_name = path + "/test_20150819_onchipTSMCadc.xcos";
mkdir .test_20150819_onchipTSMCadc;
[path,fname,extension]=fileparts(file_name);
hid_dir=path+'.'+fname;

fd = mopen('input_vector','wt'); mputl('0x0000 0x0000 0x03e8 0xFFFF', fd); mclose(fd); // making fake input_vector
fd = mopen('output_info','wt'); mputl('0x0000', fd); mclose(fd); // making fake output_info

exec("~/rasp30/prog_assembly/libs/scilab_code/MakeProgramlilst_CompileAssembly.sce",-1);

exec("~/rasp30/prog_assembly/libs/scilab_code/MakeProgramlilst_CompileAssembly.sce",-1);
exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/tunnel_revtun_ver00_gui.sce', -1);
disp('tunnel , reverse tunnel done');
exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/switch_program_ver05_gui.sce', -1);
disp('switch_program done');
exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/dc_setup_gui.sce', -1);
disp('DC setup done');

unix_w('sudo ~/rasp30/prog_assembly/libs/sh/asm2ihex.sh onchip_adc_tsmc ~/rasp30/prog_assembly/libs/asm_code/onchip_adc_tsmc.s43 16384 16384 16384');
unix_w('sudo tclsh ~/rasp30/prog_assembly/libs/tcl/program.tcl -device /dev/ttyUSB1/ -speed 115200 onchip_adc_tsmc.elf')
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -device /dev/ttyUSB1/ -start_address 0x5300 -length 1 -output_file_name onchipADC_tsmc_value.hex");



