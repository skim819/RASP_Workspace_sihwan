	   #O/PS        
        li_sm = ['gnd'             ,[0,  0],     #inputs from CAB and device outputs
		'vcc'              ,[0,  1],#y
		'cab_vmm.I[0:12]'       ,[0, range( 2, 15)],#y to be shifted for the decoder
		'vmm4x4_dummy[0:3]'	,[0,range(19,23)], #middle LI for VMM turn
		#O/PS OF CAB DEVICES
		'fgota[0:1].out[0]' ,[0, range(15, 17)],#y
		'h_rect[0].out[0]', [0,26], # Half Wave Rectifier
		'ota_buf[0].out[0]' ,[0, 17],#y
		'ota[0].out[0]'      ,[0, 18],#y
		'bias_gen[0].out[0:1]'      , [0, [32,19]],#ynmirror our and cap out
		'ladder_filter[0].out[0:2]'      , [0, [15,16,18]],#y
		'cap[0:3].out[0]'    ,[0, range(19, 23)],#y                                
		'nfet[0:1].out[0]'   ,[0, range(24, 22, -1)],#y numbering chnge for nFET0(24) and nFET1(23), needs to be verified
		'pfet[0:1].out[0]'   ,[0, range(26, 24,-1)],#y numbering chnge for pFETt0(26) and pFET1(23)
		'tgate[0:3].out[0]'  ,[0, range(27, 31)],#y
		'mux4_1[0].out[0]'  ,[0, 27],#y
		'nmirror[0:1].out[0]',[0, range(31, 33)],#y
		'ladder_blk[0].out[0:2]',[0,[17,15,16]],
		'TIA_blk[0].out[0]'	 ,[0,17],
		'ichar_nfet[0].out[0]',[0,25],
		'c4_blk[0].out[0]'	 ,[0,15],# c4 with floating gates
		'Algo_ADC[0].out[0]' ,[0,17],
		'Nagating_blk[0].out[0]'  ,[0,15],
		'speech[0].out[0:1]'	 ,[0,[17,26]],  #25 only c4 and pd. 26 with pfet out to inverse. 
		'gnd_out[0].out[0]',[0,24],
		'vdd_out[0].out[0]',[0,24],
		'in2in_x1[0].out[0]',[0,24],
		'in2in_x6[0].out[0]',[0,24],
		'volt_div[0].out[0]',[0,17], #OTA0's output
		'volt_div_fgota[0].out[0]',[0,15], #FGOTA0's output
		'integrator[0].out[0]',[0,18],
		'ichar_nfet[0].in[0:1]' ,[[19,30],0],#vg,vd
		'integrator_nmirror[0].out[0]',[0,18],
		'lpf[0].out[0]',[0, 17],
		'nfet_i2v[0].out[0]',[0, 17], #ota0 output
		'pfet_i2v[0].out[0]',[0, 17], #ota0 output
		'nmirror_w_bias[0].out[0]',[0, 31], #nmirror0 output
		'fgswc_nmirror_w_bias[0].out[0]',[0, 31], #nmirror0 output
		'i2v_pfet_gatefgota[0].out[0]',[0,17], #ota0 output
		'mismatch_meas[0].out[0]',[0,16], #fgota1 output
		'mmap_local_swc[0].out[0]'   ,[0,18+15], #chose col-18
		'INFneuron[0].out[0]',[0,17],
		'ramp_fe[0].out[0:3]' , [0,[18,20,21,22]], #26
		'sigma_delta_fe[0].out[0]', [0,17], #[0,[18,17]], # 18:ota1.out 17: ota0.out
		'volswc[0:1].out[0]',[0, range(33, 35)],
		'hhneuron[0].out[0:2]',[0,[18,15,16]],#Vmem,VNa,VK
		'dendiff[0].out[0]',[0,0],
		'tgate_so[0].out[0]',[0,19],
		'ota_vmm[0].out[0]'      	,[0, 18],#y
		'nmirror_vmm[0:1].out[0]'	,[0, range(31, 33)],#y
		'vmm4x4_SR[0].out[0]'  ,[0,34], #19+15--->15 is offset for middle LI
		'vmm4x4_SR2[0].out[0]'  ,[0,34], #19+15--->15 is offset for middle LI
		'vmm8x4_SR[0].out[0]'  ,[0,34], #19+15--->15 is offset for middle LI
		'SR4[0].out[0:4]',	[0,[19,20,21,22,18+15]],#cap--ops+15, and the 18+15
		'vmm4x4[0].out[0:3]',	[0,range(19,23)],
		'vmm8x4[0].out[0]',	[0,0], #dummy output
		'vmm8inx8in[0].out[0]',	[0,19], #dummy output cap0's output
		'vmm8x4_in[0].out[0]',	[0,0], #dummy output
		'vmm12x1[0].out[0]',	[0,18], #wta output
		'sftreg[0].out[0]'   ,[0,18+15], #chose col-18
		'DAC_sftreg[0].out[0]'   ,[0,18+15], #chose col-18
		'sftreg2[0].out[0]'   ,[0,18+15], #chose col-18
		'sftreg3[0].out[0]'   ,[0,33], #chose col-18
		'sftreg4[0].out[0]'   ,[0,27], #tgate0's output
		'Adaptive_receptor[0].out[0]'	 ,[0,18],
		'vmm_senseamp1[0].out[0]',[0,17], #ota0 output
		'vmm_senseamp2[0].out[0:1]',[0,[17,18]],
		'vmm12x1_wowta[0].out[0]',	[0,19], #vmm on cap out
		'inv_mcab[0].out[0]',[0,23],
		'Hyst_diff[0].out[0]',[0,18],
		'Max_detect[0].out[0]',[0,23],
		'Min_detect[0].out[0]',[0,25],
		'wta_w_bias[0].out[0]',[0,17],
		'hhn[0].out[0]',[0,18],
		'fgswitch[0].out[0]',[0,19],
		'common_drain[0].out[0]',[0,25],
		'common_drain_nfet[0].out[0]',[0,23],
		'hhn_debug[0].out[0:2]',[0,[18,16,15]],
			'vd_2ota[0].out[0]',[0,17],