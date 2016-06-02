cd("~/RASP_Workspace/test_20160103_tr_gm_saturation"); 

nFET_IdVg_50mV=csvRead('nFET_IdVg_Vd_50mV_40nm');
scf(6);clf(6);
plot2d("nl", nFET_IdVg_50mV(:,1), nFET_IdVg_50mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
legend("Vd_50mV","in_lower_right"); 
//a=gca();a.data_bounds=[0 1e-12; 5 4e-5];
xtitle("","Vg [V]","Id ");
title('Id vs. Vg ');

scf(7);clf(7);
plot2d("nn", nFET_IdVg_50mV(:,1), nFET_IdVg_50mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
legend("Vd_50mV","in_lower_right"); 
//a=gca();a.data_bounds=[0 1e-12; 5 4e-5];
xtitle("","Vg [V]","Id ");
title('Id vs. Vg ');


//pFET_IdVg_50mV=csvRead('pFET_IdVg_Vd_50mV_130nm');
//scf(6);clf(6);
//plot2d("nl", pFET_IdVg_50mV(:,1), pFET_IdVg_50mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//legend("Vd_25mV","Vd_50mV","Vd_100mV","in_upper_right"); 
////a=gca();a.data_bounds=[0 1e-12; 5 4e-5];
//xtitle("","Vg [V]","Id / Vds ");
//title('Id vs. Vg ');
//
//scf(7);clf(7);
//plot2d("nn", pFET_IdVg_50mV(:,1), pFET_IdVg_50mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//legend("Vd_25mV","Vd_50mV","Vd_100mV","in_upper_right"); 
////a=gca();a.data_bounds=[0 1e-12; 5 4e-5];
//xtitle("","Vg [V]","Id / Vds ");
//title('Id vs. Vg ');
//
