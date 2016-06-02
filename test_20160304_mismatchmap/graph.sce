Vto_mismatch_data1=csvRead('Vto_mismatch_data_row0_2_before');
Vto_mismatch_data2=csvRead('Vto_mismatch_data_row0_2_after');
scf(1);clf(1);
for i=1:12
    plot2d("nn", i, Vto_mismatch_data1(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 1;
    plot2d("nn", i, Vto_mismatch_data1(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 2;
    plot2d("nn", i, Vto_mismatch_data1(i+24,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 3;
end
a=gca();a.data_bounds=[0 -0.1; 12 +0.1];
//legend(,"row 0 before","row 1 before","row 0 after1","row 1 after1","row 0 after2","row 1 after2","in_upper_left");
xtitle("","switch No.","Vth mismatch [V]");

scf(2);clf(2);
for i=1:12
    plot2d("nn", i, Vto_mismatch_data2(i,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 1;
    plot2d("nn", i, Vto_mismatch_data2(i+12,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 2;
    plot2d("nn", i, Vto_mismatch_data2(i+24,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off"; p.children.mark_foreground = 3;
end
a=gca();a.data_bounds=[0 -0.1; 12 +0.1];
//legend(,"row 0 before","row 1 before","row 0 after1","row 1 after1","row 0 after2","row 1 after2","in_upper_left");
xtitle("","switch No.","Vth mismatch [V]");

histogram_edges = -0.05:0.005:0.05;
scf(3);clf(3);
histo(Vto_mismatch_data1(:,3),histogram_edges);p = get("hdl"); p.children.thickness = 3; p.children.line_mode="on";  p.children.line_style = 1;p.children.foreground=1;
histo(Vto_mismatch_data2(:,3),histogram_edges);p = get("hdl"); p.children.thickness = 3; p.children.line_mode="on";  p.children.line_style = 1;p.children.foreground=2;
a=gca();a.data_bounds=[-0.05 0; 0.05 40];
xtitle("","Vth mismatch [V]","# of Vfg");
