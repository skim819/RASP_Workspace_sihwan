myVariable=[2 2 2 (2:-0.1:0.2) 0.2 0.2];
sr_clk=[0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
sr_data=[1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
//tgate_sel=[linspace(0,0,22)];
//tgate_sel_bar=[linspace(1,1,24)];
tgate_sel1=[linspace(0,0,24)];
tgate_sel2=[linspace(1,1,24)];
tgate_sel3=[linspace(1,1,24)];
disp(size(myVariable), size(sr_clk), size(sr_data),size(tgate_sel1))
