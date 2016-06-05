min_Vout=0.5;

x1_x2=[linspace(2.1,2.5,21)' linspace(2.1,2.5,21)']
xor_result=csvRead("XOR_hyperplane_data_before_compensation");
scf(1);clf(1);
[xx,yy,zz]=genfac3d(x1_x2(:,1),x1_x2(:,2),xor_result);
zz(1,1)=min_Vout;zz(1,2)=2.5;
plot3d(xx,yy,list(zz, zz));
f=gcf(); f.color_map = graycolormap(512);
h=gce(); h.color_flag=1; //color according to z
a = gca(); a.data_bounds=[2.2 2.2 0; 2.5 2.5 2.5];
a.rotation_angles=[0,270];
colorbar(min_Vout,2.5);


x1_x2=[linspace(2.1,2.5,21)' linspace(2.1,2.5,21)']
xor_result=csvRead("XOR_hyperplane_data_after_compensation");
scf(2);clf(2);
[xx,yy,zz]=genfac3d(x1_x2(:,1),x1_x2(:,2),xor_result);
zz(1,1)=min_Vout;zz(1,2)=2.5; // Forcing min & max
plot3d(xx,yy,list(zz, zz));
f=gcf(); f.color_map = graycolormap(512);
h=gce(); h.color_flag=1; //color according to z
a = gca(); a.data_bounds=[2.2 2.2 0; 2.5 2.5 2.5];
a.rotation_angles=[0,270];
colorbar(min_Vout,2.5);


//x1=linspace(2.1,2.5,2)';
//x2= linspace(2.1,2.5,21)';
//standtard_xor=[linspace(min_Vout,2.5-min_Vout,21); linspace(min_Vout,2.5-min_Vout,21);];
//scf(3);clf(3);
//[xx,yy,zz]=genfac3d(x1(:),x2(:),standtard_xor);
//zz(1,1)=min_Vout;zz(1,2)=2.5-min_Vout; // Forcing min & max
//plot3d(xx,yy,list(zz, zz));
//f=gcf(); f.color_map = graycolormap(512);
//h=gce(); h.color_flag=1; //color according to z
//a = gca(); a.data_bounds=[2.1 2.1 0; 2.5 2.5 2.5];
//a.rotation_angles=[0,270];
//colorbar(min_Vout,2.5-min_Vout);

