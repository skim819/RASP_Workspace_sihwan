cd("~/RASP_Workspace/test_20160103_tr_gm_saturation"); 

nFET_IdVg_25mV=csvRead('nFET_IdVg_Vd_25mV_350nm');
nFET_IdVg_50mV=csvRead('nFET_IdVg_Vd_50mV_350nm');
nFET_IdVg_100mV=csvRead('nFET_IdVg_Vd_100mV_350nm');
nFET_IdVg_50mV_pwr=csvRead('nFET_IdVg_Vd_50mV_350nm_pwr_supply');

scf(3);clf(3);
//plot2d("nl", nFET_IdVg_25mV(:,1), nFET_IdVg_25mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//plot2d("nl", nFET_IdVg_50mV(:,1), nFET_IdVg_50mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 2; p.children.line_mode="off";
//plot2d("nl", nFET_IdVg_100mV(:,1), nFET_IdVg_100mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
plot2d("nl", nFET_IdVg_50mV_pwr(:,1), nFET_IdVg_50mV_pwr(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//legend("Vd_25mV","Vd_50mV","Vd_100mV","in_lower_right"); 
legend("Vd_50mV","in_lower_right"); 
//a=gca();a.data_bounds=[0 1e-12; 5 1e-4];
xtitle("","Vg [V]","Id [A]");
title('Id vs. Vg ');

scf(4);clf(4);
//plot2d("nn", nFET_IdVg_25mV(:,1), nFET_IdVg_25mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//plot2d("nn", nFET_IdVg_50mV(:,1), nFET_IdVg_50mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 2; p.children.line_mode="off";
//plot2d("nn", nFET_IdVg_100mV(:,1), nFET_IdVg_100mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
plot2d("nn", nFET_IdVg_50mV_pwr(:,1), nFET_IdVg_50mV_pwr(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
//legend("Vd_25mV","Vd_50mV","Vd_100mV","in_upper_left"); 
legend("Vd_50mV","in_lower_right"); 
//a=gca();a.data_bounds=[0 1e-12; 5 4e-5];
a=gca();a.data_bounds=[0 1e-12; 7 2.9e-5];
xtitle("","Vg [V]","Id [A]");
title('Id vs. Vg ');

scf(5);clf(5);
plot2d("nn", nFET_IdVg_25mV(:,1), nFET_IdVg_25mV(:,2)/18, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
plot2d("nn", nFET_IdVg_50mV(:,1), nFET_IdVg_50mV(:,2)/42.4, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 2; p.children.line_mode="off";
plot2d("nn", nFET_IdVg_100mV(:,1), nFET_IdVg_100mV(:,2)/91, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
//legend("Vd_25mV","Vd_50mV","Vd_100mV","in_upper_left"); 
legend("Vd_50mV","in_lower_right"); 
//a=gca();a.data_bounds=[0 1e-12; 5 4e-5];
xtitle("","Vg [V]","Id / Vds ");
title('Id vs. Vg ');



pFET_IdVg_50mV=csvRead('pFET_IdVg_Vd_50mV_350nm');
scf(6);clf(6);
plot2d("nl", pFET_IdVg_50mV(:,1), pFET_IdVg_50mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
legend("Vd_50mV","in_upper_right"); 
//a=gca();a.data_bounds=[0 1e-12; 5 4e-5];
xtitle("","Vg [V]","Id / Vds ");
title('Id vs. Vg ');

scf(7);clf(7);
plot2d("nn", pFET_IdVg_50mV(:,1), pFET_IdVg_50mV(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
legend("Vd_50mV","in_upper_right"); 
//a=gca();a.data_bounds=[0 1e-12; 5 4e-5];
xtitle("","Vg [V]","Id / Vds ");
title('Id vs. Vg ');
