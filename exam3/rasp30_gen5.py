		'fgota[0:1].in[0:1]' ,[range(33,29,-1), 0],# in<0:7> y its high because of the decoded address where 4==33 for 
		'h_rect[0].in[0:1]'  , [[29, 28], 0],
		'ota_buf[0].in[0]' ,  [29, 0],# in<0:7> y
		'ota[0].in[0:1]'     ,[range(27,25,-1), 0],# in<0:7> y
		'cap[0:3].in[0]'     ,[range(25,21,-1), 0],# in<8:11 y
		'bias_gen[0].in[0]'     ,[24, 0],# in<8:11 y
		'nfet[0:1].in[0:1]'  ,[[19, 18, 21, 20], 0],# in<12:15> y 21, 17,-1) it's flipped
		'pfet[0:1].in[0:1]'  ,[[15, 14, 17, 16], 0],# in<16:19> n---change (17, 13,-1) it;s flipped
		'tgate[0:3].in[0:1]' ,[range(13,5,-1), 0],# in<20:27> y
		'mux4_1[0].in[0:7]' ,[range(13,5,-1), 0],# in<20:27> y
		'nmirror[0:1].in[0]' ,[range(5,3,-1), 0],# in<28:29> y
		'ladder_blk[0].in[0:1]',[[33,30],0],
		'c4_blk[0].in[0:1]'   ,[[33,25],0],
		'Algo_ADC[0].in[0:4]'   ,[[8,13,11,9,7],0],
		'Nagating_blk[0].in[0:1]'   ,[[33,25],0],
		'speech[0].in[0:2]'   ,[[33,25,14],0],#25
		'gnd_out[0].in[0:1]'	 ,[[19,33],0],
		'vdd_out[0].in[0:1]'	 ,[[19,33],0],
		'in2in_x1[0].in[0:2]'	  ,[[19,33,33],0],
		'in2in_x6[0].in[0:12]'	  ,[[19,33,33,32,32,31,31,30,30,29,29,28,28],0],
		'volt_div[0].in[0:1]', [[25,21],0], #Cap0's input, nFET0's input (to make input FG)
		'volt_div_fgota[0].in[0:1]', [[25,21],0], #Cap0's input, nFET0's input (to make input FG)
		'integrator[0].in[0:2]'	  ,[[29,28,13],0],
		'integrator_nmirror[0].in[0:2]'	  ,[[29,28,13],0],
		'lpf[0].in[0]'	 ,[29,0],
		'nfet_i2v[0].in[0]',[29,0],
		'pfet_i2v[0].in[0]',[29,0],
		'nmirror_w_bias[0].in[0:1]',[[19,21],0], #nfet1's and nfet0's gate
		'fgswc_nmirror_w_bias[0].in[0]',[21,0], #nfet0's gate
		'i2v_pfet_gatefgota[0].in[0]',[29,0], #ota0's in0
		'mismatch_meas[0].in[0:2]',[[12,13,11],0], #tgate0's in, s and tgate1's s
		'TIA_blk[0].in[0]'   ,[26,0],
		'ladder_filter[0].in[0:1]'      , [[33,30],0],#y
		'INFneuron[0].in[0:2]',[[27,29,21],0],#ota[in0] ota1[in1] and nfet[in0]
		'ramp_fe[0].in[0]' , [31,0], #26: ota1.n 18:pfet0.gate
		'sigma_delta_fe[0].in[0:2]', [[33,32,13],0], #29:ota0+, 26:ota1 28:ota0- - 19:nfet0.gate 21 nfet1.gate
		'hhneuron[0].in[0:3]',[[25,16,26,33],0],#Vin,ENa,EK,Vref27
		'inv_mcab[0].in[0]',[21,0],
		'Hyst_diff[0].in[0]',[27,0],
		'Max_detect[0].in[0]',[29,0],
		'Min_detect[0].in[0]',[29,0],
		'wta_w_bias[0].in[0:1]',[[19,21],0],
		'hhn[0].in[0:3]',[[29,16,20,31],0],
		'fgswitch[0].in[0]',[21,0],
		'common_drain[0].in[0]',[17,0],
		'common_drain_nfet[0].in[0]',[21,0],
		'hhn_debug[0].in[0:3]',[[29,16,20,31],0],
		'exam2[0].in[0]',[0,0],
		'exam2[0].in[0:1]',[[21,19],0],
		'exam3[0].in[0]',[29,0],
