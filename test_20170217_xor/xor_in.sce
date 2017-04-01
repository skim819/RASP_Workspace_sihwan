//xor_clk_sr  = [0 1 0 0 0 0 linspace(0,0,32)]; // 1st
//xor_clk_sr  = [0 1 0 1 0 0 linspace(0,0,32)]; // 2nd
xor_clk_sr  = [0 1 0 1 0 1 linspace(0,0,32)]; // 3rd XOR output
xor_data_sr = [1 1 linspace(0,0,36)];
xor_in=[
linspace(1.9,1.9,6) linspace(2.1,2.1,8) linspace(2.1,2.1,8) linspace(2.1,2.1,8) linspace(2.1,2.1,8);
linspace(1.9,1.9,6) linspace(1.9,1.9,8) linspace(1.9,1.9,8) linspace(2.1,2.1,8) linspace(2.1,2.1,8);
linspace(1.9,1.9,6) linspace(2.1,2.1,8) linspace(1.9,1.9,8) linspace(1.9,1.9,8) linspace(2.1,2.1,8);
linspace(1.9,1.9,6) linspace(1.9,1.9,8) linspace(1.9,1.9,8) linspace(1.9,1.9,8) linspace(1.9,1.9,8);];

//xor_weight4x4=[
//4e-06,1e-10,1e-10,1e-10;
//1e-10,4e-06,4e-06,1e-10;
//3e-06,2e-06,2e-06,1e-10;
//1e-10,1e-10,1e-10,1e-10];

xor_weight4x4=[   // chip 18 3.0a
6e-06,1e-10,1e-10,1e-10;
1e-10,4e-06,4e-06,1e-10;
4e-06,2.5e-06,2.55e-06,1e-10;
1e-10,1e-10,1e-10,1e-10];