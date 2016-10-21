        li_sm = ['gnd'             	,[0,  0],     #inputs from CAB and device outputs
		'vcc'               	,[0,  1],#y
		'cab_vmm.I[0:12]'       ,[0, range( 2, 15)],#y to be shifted for the decoder
		'vmm4x4_dummy[0:3]'	,[0,range(19,23)], #middle LI for VMM turn
		#O/PS OF CAB DEVICES
		'fgota[0:1].out[0]'  	,[0, range(15, 17)],#y
		'ota_buf[0].out[0]'  	,[0, 17],#y
		'ota[0].out[0]'      	,[0, 18],#y
                'ladder_filter[0].out[0:2]'      , [0, [15,16,18]],#y
		'cap[0:3].out[0]'    	,[0, range(19, 23)],#y                                
		'nfet[0:1].out[0]'   	,[0, range(24, 22, -1)],#y numbering chnge for nFET0(24) and nFET1(23), needs to be verified
		'pfet[0:1].out[0]'   	,[0, range(26, 24,-1)],#y numbering chnge for pFETt0(26) and pFET1(23)
		'INV_cs[0].out[0]'   	,[0, 26],#current starved inverter
		'dendrite_4x4[0].out[0:3]'   	,[0, [19,20,21,22]],#These are output of CAP
		'tgate[0:3].out[0]'  	,[0, range(27, 31)],#y
		'nmirror_vmm[0:1].out[0]'	,[0, range(31, 33)],#y
		'ladder_blk[0].out[0:1]',[0,[17,18]],
            'bias_gen[0].out[0:1]'      , [0, [32,19]],#ynmirror our and cap out32
		'c4_blk[0].out[0]'	 ,[0,15],
	   	 'hhneuron[0].out[0:2]',[0,[18,15,16]],#Vmem,VNa,VK
    	        'speech[0].out[0:1]'	 ,[0,[17,26]],
		'lpf[0].out[0]'  	 ,[0, 17],
                'nfet_i2v[0].out[0]',[0, 2+15],
                'pfet_i2v[0].out[0]',[0, 2+15],
		'INFneuron[0].out[0]',[0,17],
		'peak_detector[0].out[0]',[0,25], # cap[0]'s out'
		'ramp_fe[0].out[0]' , [0,18], #[0,[18,17]], # 18:ota1.out 17: ota0.out
		'sigma_delta_fe[0].out[0]', [0,18], #[0,[18,17]], # 18:ota1.out 17: ota0.out
		'volt_div[0:1].out[0]',[0,[15,16]],
		'vmm_senseamp1[0].out[0]',[0,17], #ota0 output
		'vmm_senseamp2[0].out[0:1]',[0,[17,18]],
		'wta[0].out[0]'		 ,[0,17],#nfet0 source
		'wta_primary[0].out[0:1]'		 ,[0,[17,32]],#nfet0 source
		'integrator[0].out[0]',[0,18],
		'integrator_nmirror[0].out[0]',[0,18],
		'common_source[0].out[0]',[0,24],
		'gnd_out[0].out[0]',[0,24],
		'vdd_out[0].out[0]',[0,24],
		'in2in_x1[0].out[0]',[0,24],
		'in2in_x6[0].out[0]',[0,24],
		'tgate_so[0].out[0]',[0,19],
		'vmm4x4_SR[0].out[0]'  ,[0,34], #19+15--->15 is offset for middle LI
		'vmm4x4_SR2[0].out[0]'  ,[0,34], #19+15--->15 is offset for middle LI
		'vmm8x4_SR[0].out[0]'  ,[0,34], #19+15--->15 is offset for middle LI
		'SR4[0].out[0:4]',	[0,[19,20,21,22,18+15]],#cap--ops+15, and the 18+15
		'vmm4x4[0].out[0:3]',	[0,range(19,23)],
		'vmm8x4[0].out[0]',	[0,0], #dummy output
		'vmm8x4_in[0].out[0]',	[0,0], #dummy output
		'vmm12x1[0].out[0]',	[0,18], #wta output#has to be 18
		'vmm12x1_wowta[0].out[0]',	[0,19], #vmm on cap out
		'sftreg[0].out[0]'   ,[0,18+15], #chose col-18
		'DAC_sftreg[0].out[0]'   ,[0,18+15], #chose col-18
		'sftreg2[0].out[0]'   ,[0,18+15], #chose col-18
		'mmap_local_swc[0].out[0]'   ,[0,18+15], #chose col-18
                'th_logic[0].out[0]',[0,2+15],
		'sftreg3[0].out[0]'   ,[0,33], #chose col-18
		'fg_io[0].out[0]'     ,[0,0],
		#'volswc[0:1].out[0]',[0, range(33, 35)],
		'inv_mcab[0].out[0]',[0,23],
		'macrocab_ex2[0].out[0:1]',[0,[23,19]],
