	   #O/PS        
        li_sm = ['gnd'             ,[0,  0],     #inputs from CAB and device outputs
            'vcc'                ,[0,  1],#y
            'cab.I[0:12]'        ,[0, range( 2, 15)],#y to be shifted for the decoder
	    #O/PS OF CAB DEVICES
	    'fgota[0:1].out[0]'  ,[0, range(15, 17)],#y
	    'h_rect[0].out[0]', [0,26], # Half Wave Rectifier
	    'ota_buf[0].out[0]'  ,[0, 17],#y
            'ota[0].out[0]'      , [0, 18],#y
            'bias_gen[0].out[0:1]'      , [0, [32,19]],#ynmirror our and cap out
            'HOP_bif[0].out[0]'      , [0, 16],#y
            'ladder_filter[0].out[0:2]'      , [0, [15,16,18]],#y
            'hh_neuron_b_debug[0].out[0:2]'      , [0, [17,18,16]], #Vout, V_Na, V_K
            'cap[0:3].out[0]'    ,[0, range(19, 23)],#y                                
            'nfet[0:1].out[0]'   ,[0, range(24, 22, -1)],#y numbering chnge for nFET0(24) and nFET1(23), needs to be verified
            'pfet[0:1].out[0]'   ,[0, range(26, 24,-1)],#y numbering chnge for pFETt0(26) and pFET1(23)
            'tgate[0:3].out[0]'  ,[0, range(27, 31)],#y
            'mux4_1[0].out[0]'  ,[0, 27],#y
            'nmirror[0:1].out[0]',[0, range(31, 33)],#y
	    'ladder_blk[0].out[0:2]',[0,[17,15,16]],
		'common_source1[0].out[0]',[0,24],
		'common_drain[0].out[0]',[0,24],
	    'ichar_nfet[0].out[0]',[0,25],
	    'c4_blk[0].out[0]'	 ,[0,15],# c4 with floating gates
   	    'TIA_blk[0].out[0]'	 ,[0,17],
	    'Nagating_blk[0].out[0]'  ,[0,15],
	    'speech[0].out[0:1]'	 ,[0,[17,26]],  #25 only c4 and pd. 26 with pfet out to inverse. 
	    'gnd_out[0].out[0]',[0,24],
	    'vdd_out[0].out[0]',[0,24],
	    'in2in_x1[0].out[0]',[0,24],
	    'switch_cap[0].out[0]',[0,18],
            'in2in_x6[0].out[0]',[0,24],
	    'volt_div[0:1].out[0]',[0,[15,16]],
            'integrator[0].out[0]',[0,18],
	    'ichar_nfet[0].in[0:1]' ,[[19,30],0],#vg,vd
            'integrator_nmirror[0].out[0]',[0,18],
            'lpf[0].out[0]',[0, 17],
            'nfet_i2v[0].out[0]',[0, 2+15],
            'pfet_i2v[0].out[0]',[0, 2+15],
	    'INFneuron[0].out[0]',[0,17],
	    'peak_detector[0].out[0]',[0,25], # 
	    'ramp_fe[0].out[0]' , [0,18], #26
	    'sigma_delta_fe[0].out[0]', [0,17], #[0,[18,17]], # 18:ota1.out 17: ota0.out
	    'cap_sense[0].out[0]'     , [0,18],
	    'volswc[0:1].out[0]',[0, range(33, 35)],
	    'lpf_2[0].out[0]', [0,18],
	    'hhneuron[0].out[0:2]',[0,[18,15,16]],#Vmem,VNa,VK
	    'dendiff[0].out[0]',[0,0],
		'testtemp[0].out[0:2]',[0,[38,43,44]],
