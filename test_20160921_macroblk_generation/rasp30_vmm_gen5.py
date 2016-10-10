		'fgota[0:1].in[0:1]' ,[range(33,29,-1), 0],# in<0:7> y its high because of the decoded address where 4==33 for 
		'ota_buf[0].in[0]' ,  [29, 0],# in<0:7> y
		'ota[0].in[0:1]'     ,[range(27,25,-1), 0],# in<0:7> y
		'ota_vmm[0].in[0:1]'     ,[range(27,25,-1), 0],# in<0:7> y
                'ladder_filter[0].in[0:1]'      , [[33,30],0],#y
		'cap[0:3].in[0]'     ,[range(25,21,-1), 0],# in<8:11 y
		'nfet[0:1].in[0:1]'  ,[[19, 18, 21, 20], 0],# in<12:15> y 21, 17,-1) it's flipped
		'pfet[0:1].in[0:1]'  ,[[15, 14, 17, 16], 0],# in<16:19> n---change (17, 13,-1) it;s flipped
		'tgate[0:3].in[0:1]' ,[range(13,5,-1), 0],# in<20:27> y
		'nmirror_vmm[0:1].in[0]' ,[range(5,3,-1), 0],# in<28:29> y
		'ladder_blk[0].in[0:1]',[[29,26],0],
		'c4_blk[0].in[0:1]'   ,[[33,25],0],
		'speech[0].in[0:2]'   ,[[33,25,14],0],#25
		'lpf[0].in[0]'	  	,[29,0],
                'nfet_i2v[0].in[0]',[29,0], #ota0's in0
                'pfet_i2v[0].in[0]',[29,0], #ota0's in0
                'nmirror_w_bias[0].in[0:1]',[[19,21],0], #nfet1's and nfet0's gate
                'fgswc_nmirror_w_bias[0].in[0]',[21,0], #nfet0's gate
                'i2v_pfet_gatefgota[0].in[0]',[29,0], #ota0's in0
		'INFneuron[0].in[0:2]',[[27,29,21],0],#ota[in0] ota1[in1] and nfet[in0]
		'peak_detector[0].in[0:1]',[[27,15],0], #ota.0[in0] nfet1[gate]
		'ramp_fe[0].in[0]' , [31,0], #26: ota1.n 18:pfet0.gate
		'sigma_delta_fe[0].in[0:4]', [[29,26,28,13,15],0], #29:ota0+, 26:ota1 28:ota0- - 19:nfet0.gate 21 nfet1.gate
                'volt_div[0].in[0:1]', [[25,21],0], #Cap0's input, nFET0's input (to make input FG)
                'volt_div_fgota[0].in[0:1]', [[25,21],0], #Cap0's input, nFET0's input (to make input FG)
		'vmm_senseamp1[0].in[0:1]',[[29,28],0], #ota0 V+, V-
		'vmm_senseamp2[0].in[0:3]',[[29,28,27,26],0],#ota0 V+, V- ,#ota1 V+, V-
		'wta[0].in[0:1]'		 ,[[19,21],0],#nfet0 and nfet1 drains
		'wta_primary[0].in[0]'		 ,[18,0],#nfet0 and nfet1 drains
		'integrator[0].in[0:2]'	  ,[[29,28,13],0],
	      'TIA_blk[0].in[0]'   ,[26,0],
   	    'Adaptive_receptor[0].in[0:1]'	 ,[[27,29],0],
		'integrator_nmirror[0].in[0:2]'	  ,[[29,28,13],0],
                'fgswitch[0].in[0]'	  ,[21,0], #nFET0's gate
		'common_source[0].in[0]'	  ,[19,0],
		'sftreg3[0].in[3]'   ,[21,0], 
		'sftreg4[0].in[3]'   ,[13,0], #tgate0's sel 
                'gnd_out[0].in[0:1]'	  ,[[19,33],0],
                'vdd_out[0].in[0:1]'	  ,[[19,33],0],
                'in2in_x1[0].in[0:2]'	  ,[[19,33,33],0],
                'in2in_x6[0].in[0:12]'	  ,[[19,33,33,32,32,31,31,30,30,29,29,28,28],0],
		'tgate_so[0].in[0:7]'	  ,[[12,21,10,19,8,17,6,15],0],
		'vmm4x4_SR[0].in[0:3]'	,[[33,32,31,30],0], #connection lines to turn into shift register
		'vmm4x4_SR2[0].in[0:7]'	,[[33,32,31,30,0,0,0,25],0], #connection lines to turn into shift register
		'vmm8x4_SR[0].in[0:7]'	,[[33,32,31,30,33,32,31,30],0], #connection lines to turn into shift register
		'vmm8x4[0].in[0:12]'	,[[33,32,31,30,33,32,31,30,33,32,31,30,29],0], #connection lines to turn into shift register ---check
		'vmm8inx8in[0].in[0]'	,[25,0], #dummy input cap0's input
		'vmm8x4_in[0].in[0:12]'	,[[33,32,31,30,33,32,31,30,33,32,31,30,29],0], #in[0]~[7] will be ignored by genu.py
		'vmm12x1[0].in[0:12]'	,[[19,19,19,19,19,19,19,19,19,19,19,19,21],0], #VMM_WTA INPUTS------------------------------------------------------here --------------------------------------------------
		'vmm12x1_wowta[0].in[0:11]'	,[[19,19,19,19,19,19,19,19,19,19,19,19],0], #VMM only------------------------------------------------------here --------------------------------------------------
		'SR4[0].in[0:3]'	,[[25,0,0,0],0], ## FG-OTAs input is now blocked
		'vmm4x4[0].in[0:3]'	,[[33,32,31,30],0],
		'fg_io[0].in[0]'     	,[22,0], # equivalent for cap[3]
		#'vmm16x16[0].out[0:15]' ,[0, range(0,16)],#y
		#'vmm2x2[0].out[0:1]'    ,[0, [0,1]],
		#'vmm16x16[0].in[0:1]' ,[range(22,20,-1),0],
		#'vmm16x16[0].in[0:15]'  ,[range(22,15,-1)+range(14,8,-1)+range(7,3,-1),0],#
		'testtemp[0].in[0:2]',[[24,14,18],0],
