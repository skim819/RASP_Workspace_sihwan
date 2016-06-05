exec('~/rasp30/prog_assembly/libs/scilab_code/linefit.sce',-1);
exec('~/rasp30/prog_assembly/libs/scilab_code/ekvfit_nfet.sce',-1);
vdd=2.5;

nFET_IVg=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_nFETpFET/data_nFET_IVg_curve_chip"+chip_num+brdtype);
plotting="on_all";  // "on_all" or "on_final" or "off"
epsilon=0.001; // epsilon=0.005;
[nFET_Is, nFET_VT, nFET_kappa]=ekvfit_nfet(nFET_IVg(:,1), nFET_IVg(:,2), epsilon, plotting);
nFET_IVg(:,3) = nFET_Is*(log(1+exp((nFET_kappa*(nFET_IVg(:,1)-nFET_VT))/(2*0.0258))))^2;

// Plot the data
scf(8);clf(8);
plot2d("nl", nFET_IVg(:,1), nFET_IVg(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
plot2d("nl", nFET_IVg(:,1), nFET_IVg(:,3), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
a=gca();a.data_bounds=[0 1e-10; 1.2 1e-4];
legend("nFET Measurement","nFET EKV fit","pFET Measurement","pFET EKV fit","in_lower_right");
xtitle("","Vg(V)","Id(A)");
//title(['EKV Fit: nFET_I_s = '+string(nFET_Is)+'A, nFET_V_T = '+string(nFET_VT)+'V, nFET_Kappa = '+string(nFET_kappa);'EKV Fit: pFET_I_s = '+string(pFET_Is)+'A, pFET_V_T = '+string(pFET_VT)+'V, pFET_Kappa = '+string(pFET_kappa);]);


