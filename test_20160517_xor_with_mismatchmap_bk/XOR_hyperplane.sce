global file_name path fname extension

clk__x1 = [0.2 2.5];
data_x1 = [2.5 2.5];
zero_x1 = [0.2 0.2];
clk_sr       = [clk__x1 clk__x1 clk__x1 linspace(0.2,0.2,21)];
data_sr      = [data_x1 zero_x1 zero_x1 linspace(0.2,0.2,21)];
input_vmmwta=[
zero_x1 zero_x1 zero_x1 linspace(2.5,2.5,21);  // "1"
zero_x1 zero_x1 zero_x1 linspace(2.1,2.1,21);  // "x1"
zero_x1 zero_x1 zero_x1 linspace(2.5,2.5,21);  // "x2"
zero_x1 zero_x1 zero_x1 linspace(0.2,0.2,21);];
exec('/home/ubuntu/rasp30/sci2blif/sci2blif_test2.sce', -1);
exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/dc_setup_gui.sce', -1);

x1=2.1;
clear xor_result;
for i_xor=1:21
    input_vmmwta=[
    zero_x1 zero_x1 zero_x1 linspace(2.5,2.5,21);  // "1"
    zero_x1 zero_x1 zero_x1 linspace(x1,x1,21);  // "x1"
    zero_x1 zero_x1 zero_x1 linspace(2.1,2.5,21);  // "x2"
    zero_x1 zero_x1 zero_x1 linspace(0.2,0.2,21);];
    exec('/home/ubuntu/rasp30/sci2blif/sci2blif_test2.sce', -1);
    exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/voltage_measurement_gui.sce', -1);
    temp=fscanfMat("test_20160517_xor_with_mismatchmap.data");
    xor_result(:,i_xor)=temp(7:27,8);
    x1=x1+0.02;
    disp("Loop "+string(i_xor)+" is done");
end
csvWrite(xor_result,"XOR_hyperplane_data");

x1_x2=[linspace(2.1,2.5,21)' linspace(2.1,2.5,21)']
xor_result=csvRead("XOR_hyperplane_data");

scf(1);clf(1);
[xx,yy,zz]=genfac3d(x1_x2(:,1),x1_x2(:,2),xor_result-0.6);
plot3d(xx,yy,list(zz, zz))
e=gce(); f=e.data;
TL = tlist(["3d" "x" "y" "z" "color"],f.x,f.y,f.z,f.z+3.3); // random color matrix
e.data = TL;
clf();
plot3d(xx,yy,list(zz, zz));
h=gce(); h.color_flag=1; //color according to z
f=gcf(); f.color_map = graycolormap(512)*5;
h.data = TL;
a = gca(); a.data_bounds=[2.2 2.2 0; 2.5 2.5 2];
a.rotation_angles=[0,270];



