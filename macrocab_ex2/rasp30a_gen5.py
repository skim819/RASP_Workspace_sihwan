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
	      'TIA_blk[0].in[0]'   ,[26,0],
	    'Nagating_blk[0].in[0:1]'   ,[[33,25],0],
	    'speech[0].in[0:2]'   ,[[33,25,18],0],#25
            'gnd_out[0].in[0:1]'	 ,[[19,33],0],
            'vdd_out[0].in[0:1]'	 ,[[19,33],0],
            'in2in_x1[0].in[0:2]'	  ,[[19,33,33],0],
            'switch_cap[0].in[0:4]'	  ,[[27,12,13,11,9],0],
            'in2in_x6[0].in[0:12]'	  ,[[19,33,33,32,32,31,31,30,30,29,29,28,28],0],
	    'volt_div[0:1].in[0:1]', [[25,33,24,31],0],
            'integrator[0].in[0:2]'	  ,[[29,28,13],0],
            'integrator_nmirror[0].in[0:2]'	  ,[[29,28,13],0],
            'lpf[0].in[0]'	  ,[29,0],
            'nfet_i2v[0].in[0]',[29,0],
            'pfet_i2v[0].in[0]',[29,0],
		'common_source1[0].in[0]'	  ,[19,0],
		'common_drain[0].in[0:1]'	  ,[[19,21],0],
            'HOP_bif[0].in[0]'      , [33,0],#y
            'ladder_filter[0].in[0:1]'      , [[33,30],0],#y
            'hh_neuron_b_debug[0].in[0:3]'      , [[33,14,18,27],0],  #Vin, E_Na, E_K, Vref
	    'INFneuron[0].in[0:2]',[[27,29,21],0],#ota[in0] ota1[in1] and nfet[in0]
	    'peak_detector[0].in[0:1]',[[33,17],0], #fgota.0[in0] pfet[gate]
	    'ramp_fe[0].in[0]' , [31,0], #26: ota1.n 18:pfet0.gate
	    'sigma_delta_fe[0].in[0:2]', [[33,32,13],0], #29:ota0+, 26:ota1 28:ota0- - 19:nfet0.gate 21 nfet1.gate
	    'cap_sense[0].in[0:1]'     , [[29,28],0],
	    'lpf_2[0].in[0]', [29,0],
	    'hhneuron[0].in[0:3]',[[25,16,26,33],0],#Vin,ENa,EK,Vref27
	    'dendiff[0].in[0:5]',[[26,27,25,24,23,22],-1],
	    #'sigma_delta_fe[0].in[:4]', [[13,15],0], ## weird doesn't like 4 in a row...hmm
		'inv_mcab[0].in[0]',[21,0],
		'macrocab_ex2[0].in[0:2]',[[25,14,18],0],
