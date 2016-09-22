//unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4300 -input_file_name input_vector");
//unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4000 -input_file_name sr_out_hex");
//unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4080 -input_file_name sr_itg_in_hex");
//unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4100 -input_file_name sr_vmm_out_hex");
//unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4180 -input_file_name sr_vmm_in_hex");
//unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x4300 -length 8198 -output_file_name a1");
//unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x4000 -length 34 -output_file_name a2");
//unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x4080 -length 34 -output_file_name a3");
//unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x4100 -length 34 -output_file_name a4");
//unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x4180 -length 34 -output_file_name a5");

unix_w("rm a1");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4300 -input_file_name input_vector_1");
temp_string="0x0068"; fd = mopen('temp','wt'); mputl(temp_string, fd); mclose(fd);
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x43fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x45fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x49fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4bfe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4dfe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x51fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x53fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x55fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x59fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x5bfe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x5dfe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x61fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x62fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x4300 -length 4096 -output_file_name a1");
clear input_vec_1; input_vec_1=["" ""];
fd_1_a = mopen('input_vector_1','r'); fd_1_b = mopen('a1','r');
for i=1:4096
    input_vec_1(i,1)=mgetstr(7,fd_1_a);
    input_vec_1(i,2)=mgetstr(7,fd_1_b);
    if input_vec_1(i,1) ~= input_vec_1(i,2) then
        //disp(input_vec_1(i,:),i);
        disp(input_vec_1(i,:),'0x'+ string(sprintf('%4.4x', 2*(i-1)+17152)));  // 17152 = 0x4300
    end
end
mclose(fd_1_a); mclose(fd_1_b);

unix_w("rm a2");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x5300 -input_file_name input_vector_2");
temp_string="0x0068"; fd = mopen('temp','wt'); mputl(temp_string, fd); mclose(fd);
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x65fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x67fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x69fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x6dfe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x71fe -input_file_name temp");
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x5300 -length 4102 -output_file_name a2");
clear input_vec_2; input_vec_2=["" ""];
fd_2_a = mopen('input_vector_2','r'); fd_2_b = mopen('a2','r');
for i=1:4102
    input_vec_2(i,1)=mgetstr(7,fd_2_a);
    input_vec_2(i,2)=mgetstr(7,fd_2_b);
    if input_vec_2(i,1) ~= input_vec_2(i,2) then
        //disp(input_vec_2(i,:),i);
        disp(input_vec_2(i,:),'0x'+ string(sprintf('%4.4x', 2*(i-1)+21248)));  // 21248 = 0x5300
    end
end
mclose(fd_2_a); mclose(fd_2_b);

