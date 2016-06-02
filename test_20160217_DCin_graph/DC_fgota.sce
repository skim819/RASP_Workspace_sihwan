DC_in_char = [
3.0e-06 2.4462;
2.5e-06 2.4163;
2.0e-06 2.2968;
1.5e-06 2.0720;
1.0e-06 1.7760;
0.9e-06 1.7016;
0.8e-06 1.6102;
0.7e-06 1.5330;
0.6e-06 1.4284;
0.5e-06 1.3176;
0.4e-06 1.1920;
0.3e-06 1.0064;
0.2e-06 0.7770;
0.15e-06 0.6270;
0.10e-06 0.4000;
0.08e-06 0.3044;
0.05e-06 0.1250];
[p_DC_in,S_DC_in]=polyfit(DC_in_char(:,2),log(DC_in_char(:,1)),1);
size_DC_in_char=size(DC_in_char)
Input_range=(DC_in_char(size_DC_in_char(1),2):0.01:DC_in_char(1,2))
scf(1);clf(1);
plot2d("nl", DC_in_char(:,2), DC_in_char(:,1), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
plot2d("nl", Input_range, exp(polyval(p_DC_in,Input_range,S_DC_in)), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend("Data","linefit","in_lower_right");
a=gca();a.data_bounds=[0 1e-8; 2.5 1e-5];
xtitle("","DC(V)","I(-) target(A)");
title('DC to I(-) target (I(+):2uA, Ibias:2uA, V(+):Vdd  )');

// I target 
//(+):2uA
//(-):Variable
//Bias:2uA
//Input Cap: Small
