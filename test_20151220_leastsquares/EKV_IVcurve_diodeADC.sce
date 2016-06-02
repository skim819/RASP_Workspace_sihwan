// EKVFIT Attempts to fit a simplified EKV model to (VG, ISAT) pairs.
// EKVFIT(VG, ISAT, EPSILON) attempts to fit a simplified EKV model for
// the saturation region of MOS transistor operation to measured values
// of gate voltage (specified in VG) and channel current (specified in
// ISAT).  The assumed form of the model is
//
//    ISAT = Is * (log(1 + exp(kappa*(VG - VT)/(2*0.0258)))).^2
//
// The return values are [Is, VT, kappa].  EKVFIT makes use of LINEFIT.
// First, it attempts to find parameters for the weak-inversion region by
// using LINEFIT on VG and log(ISAT).  Then, it attepts to find
// parameters for the strong-inversion region by using LINEFIT on VG and
// sqrt(ISAT).  It then uses the x-axis intercept from the
// strong-inversion fit as a starting value for VT and computes a
// starting value for IS via cubic-spline interpolation as twice the
// value of ISAT when VG = VT.  EKVFIT then attepts to find a the value
// of IS in the interval between one tenth the initial value of IS and
// ten times the inital value of IS that minimizes the curvature of the
// inverse EKV model applied to ISAT, given by
//
//    log(exp(sqrt(ISAT/Is)) - 1),
//
// when plotted as a function of VG, using the golden-section search.
// Once the best value of Is is found, EKVFIT uses LINEFIT to get the
// slope and intercept of the best-fit line to the EKV model inverse
// expression, given above, applied to ISAT versus VG.  The slope of this
// curve should be kappa/(2*UT) and the VG-axis intercept should be VT.
//
// See the LINEFIT help comment for an explanation of the EPSILON 
// parameter.
cd /home/ubuntu/RASP_Workspace/test_20151220_leastsquares;

exec('~/rasp30/prog_assembly/libs/scilab_code/linefit.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/ekvfit_diodeADC.sce',-1);

diodeADC_iv=csvRead("./diodeADC_test.sce");

Isat=diodeADC_iv(:,2);
Vout=diodeADC_iv(:,3);
Hex_code=diodeADC_iv(:,4);

epsilon=0.004;
plotting="off"; //"on_all" or "on_final" or "off"
[Is, VT, kappa]=ekvfit_diodeADC(Vout, Isat, epsilon, plotting);
//disp('EKV Fit: I_s = '+string(Is)+'A, V_T = '+string(VT)+'V, Kappa = '+string(kappa));

epsilon=1;
[WIfirst, WIlast, Slope_v2h, Offset_v2h, WIN]=linefit(Vout, Hex_code, epsilon);

csvWrite([Is, VT, kappa, Slope_v2h, Offset_v2h],'EKV_diodeADC');

scf(1);clf(1);
plot2d("nl",Vout, Isat, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off"; 
plot2d("nl", Vout, Is*(log(1+exp(kappa*(Vout/2-VT)/(2*0.0258)))).^2, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend("Data","EKV fit","in_lower_right");
xtitle("","Vout(V)","Isat(A)"); //a=gca();a.data_bounds=[0 1e-13; 2.8 1e-3];
title(['EKV Fit: I_s = '+string(Is)+'A, V_T = '+string(VT)+'V, Kappa = '+string(kappa)]);
scf(2);clf(2);
plot2d("nn",Vout, Isat, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off"; 
plot2d("nn", Vout, Is*(log(1+exp(kappa*(Vout/2-VT)/(2*0.0258)))).^2, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend("Data","EKV fit","in_upper_left");
xtitle("","Vout(V)","Isat(A)"); //a=gca();a.data_bounds=[0 1e-10; 2.5 1e-3];
title(['EKV Fit: I_s = '+string(Is)+'A, V_T = '+string(VT)+'V, Kappa = '+string(kappa)]);


scf(3);clf(3);
plot2d("nn", Vout, Hex_code, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
plot2d("nn", Vout(WIfirst:WIlast), Hex_code(WIfirst:WIlast), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
plot2d("nn", Vout, Slope*Vout + Offset, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend("Data","Data for linefit","linefit","in_lower_right");
//a=gca();a.data_bounds=[0 1e-10; 2.5 1e-3];
xtitle("","Vout(V)","Hex_code");
title('Vout vs. Hex code Fit');
disp("Slope = "+string(Slope)+", Offset = "+string(Offset));
