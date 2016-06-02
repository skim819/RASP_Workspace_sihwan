nfet_iv=csvRead("./test_20151220_leastsquares/data_nFET_IVg_curve");
//epsilon=0.005;
//plotting="on";
//[Is, VT, kappa]=ekvfit(nfet_iv(:,1), nfet_iv(:,2), epsilon, plotting)

tm = nfet_iv(:,1); // Vout
ym = nfet_iv(:,2); // Id

x0 = [500e-9 ; 0.7; 0.4; 5]; // initial parameters guess
function y=Id2(t, x) // x(1)=Ith, x(2)=kappa, x(3)=Vt, x(4)=Va
   Ut=0.0258; // [V]
   y  = x(1)*log(1+exp((x(2)*(t-x(3)))/(2*Ut)+x(4)))^2
endfunction

function e=myfun(x, tm, ym)
   e = log(Id2(tm, x)) - log(ym)
endfunction

x0 = [100e-9; 0.6; 0.5; 1]; // initial parameters guess
[f,xopt] = leastsq(list(myfun,tm,ym),x0);

tt = linspace(min(tm),max(tm),100)';
yy = Id2(tt, x0);
//yy = Id2(tt, xopt);
// Plot the data
scf(1);clf(1);
plot2d("nl", nfet_iv(:,1), nfet_iv(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
plot2d("nl", tt, yy, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
xtitle("","Vout","Ichar(A)");



//global chip_num board_num;
//
//diode_ivdd25V=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_diodeADC/data_diodeADC_chip"+chip_num+brdtype+"_ivdd25V");
//tm = diode_ivdd25V(:,3); // Vout
//ym = diode_ivdd25V(:,2); // Id
//
//x0 = [2e-6 ; 0.4; 1.68; 1]; // initial parameters guess
//function y=Id(t, x) // x(1)=Ith, x(2)=kappa, x(3)=Vt, x(4)=Va
//   Ut=0.0258; // [V]
//   y  = x(1)*log(1+exp((x(2)*(t-x(3)))/(2*Ut)+x(4)))^2
//endfunction
//
//function e=myfun(x, tm, ym)
//   e = log(Id(tm, x)) - log(ym)
//endfunction
//[f,xopt] = leastsq(list(myfun,tm,ym),x0);
//
//tt = linspace(min(tm),max(tm),100)';
//yy = Id(tt, xopt);
//// Plot the data
//scf(1);clf(1);
//plot2d("nl", diode_ivdd25V(:,3), diode_ivdd25V(:,2), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
//plot2d("nl", tt, yy, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_upper_left");
//xtitle("","Vout","Ichar(A)");





