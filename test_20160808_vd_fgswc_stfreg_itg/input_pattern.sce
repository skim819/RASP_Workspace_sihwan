// First values of Vin & Vd_Vref set the default value.
//Vin           = [1.4 1.6 1.2 1.6 1.2 1.6 1.2 1.6 1.2 1.6 1.2 1.6 1.2 1.6 1.2 1.6 1.2 ];
Vin           = [1.4 1.7 1.1 1.7 1.1 1.7 1.1 1.7 1.1 1.7 1.1 1.7 1.1 1.7 1.1 1.7 1.1 ];
//Vin           = [1.4 linspace(1.7,1.7,8) linspace(1.1,1.1,8)];
//Vin           = [1.4 linspace(1.1,1.1,8) linspace(1.7,1.7,8)];
//Vin           = [1.4 linspace(1.4,1.4,16)];
Vd_Vref       = [linspace(1.7,1.7,17)];

entire_length = 17;
sr_out_clk    = [linspace(0,0,entire_length) ];
sr_out_D      = [linspace(0,0,entire_length) ];
sr_itg_in_clk = [linspace(0,0,entire_length) ];
sr_itg_in_D   = [linspace(0,0,entire_length) ];
itg_ini    = [linspace(0,0,entire_length) ];

disp(size(Vin),size(itg_ini));

exec("/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/image_convolution_sr.sce",-1);





