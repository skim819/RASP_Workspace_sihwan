//// For testing compensation circuit in integrator
//Initialize=[linspace(1,1,10) linspace(0,0,100) ];
//Vin=[linspace(2.1,2.1,110)];
//tgate_sel=[linspace(0,0,110)];
//rampadc_meas=[linspace(1,1,110)]; // will be compiled to gpin 15
//disp(size(Initialize),size(Vin),size(tgate_sel),size(rampadc_meas))

//// For measurement without voltage divider
//Initialize=[linspace(1,1,10) linspace(0,0,60) ];
//Vin=[linspace(1.7,1.7,27) linspace(1.75,1.75,43) ]; // 2.07, 2.08
//tgate_sel=[linspace(0,0,5) 1 linspace(0,0,14) 1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) ];
////tgate_sel=[linspace(0,0,70) ];
//rampadc_meas=[linspace(0,0,13) 1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,1) ]; // will be compiled to gpin 15
////rampadc_meas=[linspace(1,1,70)]; // will be compiled to gpin 15
//disp(size(Initialize),size(Vin),size(tgate_sel),size(rampadc_meas));

//// For measurement with voltage divider
//Initialize=[linspace(1,1,10) linspace(0,0,60) ];
////Vin=[linspace(1.4,1.4,70)];
////Vin=[linspace(1.4,1.4,19) 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1];
//Vin=[linspace(1.4,1.4,19) 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7];
//tgate_sel=[linspace(0,0,5) 1 linspace(0,0,14) 1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) ];
////tgate_sel=[linspace(0,0,70) ];
//rampadc_meas=[linspace(0,0,13) 1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,1) ]; // will be compiled to gpin 15
////rampadc_meas=[linspace(1,1,70)]; // will be compiled to gpin 15
////rampadc_meas=[linspace(0,0,70)]; // will be compiled to gpin 15
//disp(size(Initialize),size(Vin),size(tgate_sel),size(rampadc_meas));

// For measurement with voltage divider
Initialize=[linspace(1,1,10) linspace(0,0,60) ];
//Vin=[linspace(1.4,1.4,70)];
//Vin=[linspace(1.4,1.4,19) 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1 1.1 1.1 1.4 1.4 1.1];
Vin=[linspace(1.4,1.4,19) 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7 1.7 1.7 1.4 1.4 1.7];
//Vin=[linspace(1.4,1.4,19) 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3 2.3 2.3 1.4 1.4 2.3];
tgate_sel=[linspace(0,0,5) 1 linspace(0,0,14) 1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) ];
//tgate_sel=[linspace(1,1,70) ];
rampadc_meas=[linspace(0,0,13) 1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4)  1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,4) 1 linspace(0,0,1) ]; // will be compiled to gpin 15
//rampadc_meas=[linspace(0,0,13) 1 linspace(0,0,4)  0 linspace(0,0,4)  0 linspace(0,0,4)  0 linspace(0,0,4)  0 linspace(0,0,4) 0 linspace(0,0,4) 0 linspace(0,0,4) 0 linspace(0,0,4) 0 linspace(0,0,4) 0 linspace(0,0,4) 0 linspace(0,0,4) 1 linspace(0,0,1) ]; 
//rampadc_meas=[linspace(1,1,70)]; // will be compiled to gpin 15
//rampadc_meas=[linspace(0,0,70)]; // will be compiled to gpin 15
disp(size(Initialize),size(Vin),size(tgate_sel),size(rampadc_meas));

exec("/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/image_convolution.sce",-1);

