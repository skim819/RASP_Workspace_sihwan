aaaaa=csvRead('/home/ubuntu/rasp30/prog_assembly/libs/chip_parameters/mismatch_map/mismatch_map_chip21');
bbbbb=csvRead('/home/ubuntu/rasp30/prog_assembly/work/calibration_step4/mmap_data_files/Vto_mismatch_data');

aaaaa(1:36,3)=aaaaa(1:36,3)+bbbbb(1:36,3);
aaaaa(1:36,:)
csvWrite(aaaaa,'/home/ubuntu/rasp30/prog_assembly/libs/chip_parameters/mismatch_map/mismatch_map_chip21');
