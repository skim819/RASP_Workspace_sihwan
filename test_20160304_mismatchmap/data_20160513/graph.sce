Vto_mismatch_data1=csvRead('Vto_mismatch_data_CAB_10_1_row0_27_vdd_in12_before');
Vto_mismatch_data2=csvRead('Vto_mismatch_data_CAB_10_1_row0_27_vdd_in12_after');
histogram_edges = -0.05:0.0005:0.05;
scf(1);clf(1);
histo(Vto_mismatch_data1(:,3),histogram_edges);p = get("hdl"); p.children.thickness = 3; p.children.line_mode="on";  p.children.line_style = 1;p.children.foreground=1;
a=gca();a.data_bounds=[-0.04 0; 0.04 40];
xtitle("","Vth mismatch [V]","# of Vfg");
scf(2);clf(2);
histo(Vto_mismatch_data2(:,3),histogram_edges);p = get("hdl"); p.children.thickness = 3; p.children.line_mode="on";  p.children.line_style = 1;p.children.foreground=2;
a=gca();a.data_bounds=[-0.04 0; 0.04 40];
xtitle("","Vth mismatch [V]","# of Vfg");


//-------- Mismatch map with colar -----//
Vto_mismatch_data1=csvRead('Vto_mismatch_data_CAB_10_1_row0_27_vdd_in12_before');
row_addr=1:1:28;
size_row_addr=size(row_addr);
row_addr_offset=311;
Vto_mismatch_data1(:,1)=Vto_mismatch_data1(:,1)-row_addr_offset;
col_addr=1:1:14;
size_col_addr=size(col_addr);
Vto_mismatch_data1(:,2)=(Vto_mismatch_data1(:,2)-1)/16;
size_Vto_mismatch_data1=size(Vto_mismatch_data1);
clear Vto_mismatch_values; //Vto_mismatch_values=[0 0];
for i=1:size_row_addr(2)
    for j=1:size_col_addr(2)
        for k=1:size_Vto_mismatch_data1(1)
            if (Vto_mismatch_data1(k,1) == row_addr(i)) & (Vto_mismatch_data1(k,2) == col_addr(j)) then 
                Vto_mismatch_values(i,j)=Vto_mismatch_data1(k,3);
            end
        end
    end
end
//max(abs(Vto_mismatch_values))

scf(4);clf(4);
Vto_mismatch_values=max(128+Vto_mismatch_values*20*128,0);
Matplot(Vto_mismatch_values);
h = gcf();h.color_map = graycolormap(256);

Vto_mismatch_data2=csvRead('Vto_mismatch_data_CAB_10_1_row0_27_vdd_in12_after');
row_addr=1:1:28;
size_row_addr=size(row_addr);
row_addr_offset=311;
Vto_mismatch_data2(:,1)=Vto_mismatch_data2(:,1)-row_addr_offset;
col_addr=1:1:14;
size_col_addr=size(col_addr);
Vto_mismatch_data2(:,2)=(Vto_mismatch_data2(:,2)-1)/16;
size_Vto_mismatch_data2=size(Vto_mismatch_data2);
clear Vto_mismatch_values; //Vto_mismatch_values=[0 0];
for i=1:size_row_addr(2)
    for j=1:size_col_addr(2)
        for k=1:size_Vto_mismatch_data2(1)
            if (Vto_mismatch_data2(k,1) == row_addr(i)) & (Vto_mismatch_data2(k,2) == col_addr(j)) then 
                Vto_mismatch_values(i,j)=Vto_mismatch_data2(k,3);
            end
        end
    end
end

scf(5);clf(5);
Vto_mismatch_values=max(128+Vto_mismatch_values*20*128,0);
Matplot(Vto_mismatch_values);
h = gcf();h.color_map = graycolormap(256);



