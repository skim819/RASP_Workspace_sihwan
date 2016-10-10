		##### now the define parts
            	'ota_bias'	,[[32, 0],[33,0]],
		'ota_bias[0]'	,[[32, 0]],#62-17 ota_bias col-ota_out[0]col value
		'ota_bias[1]'	,[[32, 0]],
		'ramp_ota_biasfb[0]',[[32,-1],[28,17-63]],
		'sd_ota_biasfb[0]',[[32,-1],[28,17-63]], #sigma delta ota0 bias
		'sd_ota_bias[0]',[[32,-1]], #sigma delta ota0 bias
		'ota_biasfb[0]'	,[[32, 0],[28,-45]],#62-17 ota_bias col-ota_out[0]col value
		'fgota_biasfb[0]',[[32,0],[32,15-58]],#62-17 ota_bias col-ota_out[0]col value
		'fgota_biasfb[1]',[[32,0],[30,16-60]],
		'fgota_small_cap[0]',[[31,0],[31,1]],# switch for both n and p
		'fgota_small_cap[1]',[[31,0],[31,1]],#switches for both n and p
            	'gnd_out_c[0]', [[33, 0]],
            	'vdd_out_c[0]', [[33, 1]],
            	'ota_p_bias[0]', [[33, 1]],
           	'ota_n_bias[0]', [[33, 0]],
		'ota_p_bias[1]', [[33, 1]],
           	'ota_n_bias[1]', [[33, 0]],
           	'c4_ota_p_bias[0]', [[33, 1-62+58]],
           	'c4_ota_n_bias[0]', [[33, 0-62+58]],
		'c4_ota_p_bias[1]', [[33, 1-62+60]],
           	'c4_ota_n_bias[1]', [[33, 0-62+60]], 
		'hh_nabias', [32,58],
		'hh_kbias', [32,60],
		'hh_fbpfetbias', [32,15],
		'hh_vinbias', [32,63],
		'hh_ota_p_bias[0]', [[33, 59]],
        	'hh_ota_n_bias[0]', [[33, 58]],
		'hh_ota_p_bias[1]', [[33, 61]],
        	'hh_ota_n_bias[1]', [[33, 60]],
		'hh_leak', [31,1],
             	'speech_fg[0]',[[32,19-62],[32,20-62],[24,15-62],[28,62-62],[32,16-62],[30,16-62],[31,15-62],[31,1-62+58],[31,0-62+58],[31,1-62+60],[31,0-62+60],[28,2-62+57],[28,1-62+57],[28,0-62+57],[26,25-62],[27,15-62],[17,18-62],[16,0-62],[29,25-62],[28,17-62],[15,17-62]], #[16,0-62],[21,26-62],,[15,25-62],[14,1-62],pfet[15,17],[0,26]
		        'speech_pfetbias[0]' ,[[29,1-62]], #[26,1-62]
		         'speech_pfetbias[1]' ,[[29,0-62]], #[26,1-62]
		         'speech_peakotabias[0]' ,[[32,63-62]],
		         'speech_peakotabias[1]' ,[[32,62-62]], 
		'ladder_fb[0]' , [[28,0],[27,-1]],
		'INF_bias[0]'  ,[[26,-61]],
		'INF_fg[0]'	,[[19,-45],[18,-62],[28,-44],[20,-38],[26,-39]],
		'c4_ota_bias[0]',[[32, 0-62+58]],#62-17 ota_bias col-ota_out[0]col value
		'c4_ota_bias[1]',[[32, 0-62+60]],
		'INV_cs_fg[0]',[[14,1],[15,19],[21,19],[22,23],[20,26]],#[32,15],[33,1],[31,59],[31,58]
		'INV_cs_NBIAS[0]',[20,20],
		'INV_cs_PBIAS[0]',[23,26],
		'INV_cs_otaBIAS[0]',[32,58],
		'INV_cs_otaPBIAS[0]',[33,59],
		'INV_cs_otaNBIAS[0]',[33,58],
		    'bias_gen_fg[0]',  [[4,19],[25,32]],#[4,19],[25,32]], [24,1],[25,20] 
		    'bias_gen_current1',  [[24,19]], 
		    'bias_gen_current2',  [[25,1]], 
		'peak_ota_bias[0]',[[32, 0-62+58]],
           	'ladder_fg_fb[0]', [[30,16-62]],
           	'ladder_filter_fg[0]', [[32,16-62],[27,16-62],[26,18-62],[31,15-62],[31,1-62+58],[31,0-62+58],[31,1-62+60],[31,0-62+60]],
		'c4_fg[0]'	,[[32,-43],[32,-46],[30,-46],[31,-47]],#[ota_bias0|ota0neg->cap0|cap0.in->ota0out|ota_bias1|ota1_fb] |c2 and c3 conections
		'hhneuron_fg[0]', [[32,19],[25,20],[24,19],[31,58],[31,59],[28,2+60],[28,1+60],[28,0+60],[28,2+57],[28,1+57],[28,0+57],[17,15],[25,25],[25,24],[31,24],[30,16],[19,16],[25,18],[31,60],[31,61],[26,27],[18,27]],
		'c4_cap_3x[0]',[28,2-62+57],
		'c4_cap_2x[0]',[28,1-62+57],
		'c4_cap_1x[0]',[28,0-62+57],
		'c4_ota_small_cap[0]', [[31,1-62+58],[31,0-62+58]],
		'c4_ota_small_cap[1]', [[31,1-62+60],[31,0-62+60]],
		'peak_ota_small_cap[0]', [[31,1-62+58],[31,0-62+58]],
		'lpf_fg[0]'	,[[26,-43],[26,-42],[26,-41],[26,-40],[25,-61],[24,-61],[23,-61],[22,-61]],
		'peak_detector_fg[0]',[[32,25-62],[15,15-62],[14,25-62],[16,1-62],[30,26-62],[30,0-62]],
		'ramp_fe_fg[0]' ,[[32,27-62],[25,27-62],[12,19-62],[12,15-62],[30,15-62],[28,2-62+57],[31,1-62+58],[31,0-62+58],[33,1-62],[31,1-62+60],[31,0-62+60],[15,16-62],[19,16-62],[18,0-62],[17,26-62],[17,24-62],[21,24-62],[16,1-62],[20,0-62],[13,25-62],[13,23-62],[31,1-62+60],[31,0-62+60],[26,18-62],[27,25-62]], #w/tgate and no fb, also needs buffer for GPIO
		'ramp_pfetinput[0]' ,[[32,1-62]], #w/tgate and no fb
		'ramp_pfetinput[1]' ,[[14,1-62]], #w/tgate and no fb
		#'ramp_fe_fg[0]' ,[[14,1-63],[12,0-63],[25,0-63],[13,18-63],[29,19-63],[27,26-63],[27,27-63],[27,19-63]], #w/tgate
		#'ramp_fe_fg[0]' ,[[14,1-63],[18,0-63],[25,0-63],[19,18-63],[29,19-63],[27,26-63],[27,24-63],[27,19-63]], #w nfet
		'sigma_delta_fe_fg[0]',[[27,17-63],[27,27-63],[12,26-63],[14,1-63]],
		'lpf_cap_3x[0:1]',[28,[-5,-2]],
		'lpf_cap_2x[0:1]',[28,[-4,-1]],
		'lpf_cap_1x[0:1]',[28,[-3, 0]],
		'lpf_cap_3x[2:3]',[29,[-5,-2]],# cap2 and 3
		'lpf_cap_2x[2:3]',[29,[-4,-1]],
		'lpf_cap_1x[2:3]',[29,[-3, 0]],
		'cap_1x[0:3]'	,[[28,29,28,29], 2], 
		'cap_2x[0:3]'	,[[28,29,28,29], 1],
            	'cap_3x[0:3]'	,[[28,29,28,29], 0],
		'volt_div_fg[0]' ,[[33,19-58]],
		'cap_1x_vd[0]'	,[28, 1], #cap0 for voltage divider[0] 58
		'cap_2x_vd[0]'	,[28, 0], #cap0 for voltage divider[0]
		'cap_3x_vd[0]'	,[28, -1], #cap0 for voltage divider[0]
		'cap_1x_vd[1]'	,[29,2], #cap0 for voltage divider[1]
		'cap_2x_vd[1]'	,[29,1], #cap0 for voltage divider[1]
		'cap_3x_vd[1]'	,[29,0], #cap0 for voltage divider[1]
		'volt_div_fg[1]',[[31,20-58]],
		'vd_target[0:1]',[[33,31],13-58],
		'ota0bias[0]'   ,[32,62], # for vmm sense amps
		'ota1bias[0]'   ,[32,63],
		'fgota0bias[0]' ,[32,62],
		'fgota1bias[0]' ,[32,63],
		'fgota0pbias[0]' ,[33,59],
		'fgota1pbias[0]' ,[33,61],
		'fgota0nbias[0]' ,[33,58],
		'fgota1nbias[0]' ,[33,60],
		'vmm_target[0]'  ,[0,0],
		'wta_fg[0]'	 ,[[19,23],[20,0],[21,24],[18,15],[29,15],[28,17]], # fix input0 to I12,I11 and output to 04
		'wta_primary_fg[0]'	 ,[[24,0],[24,24],[19,13],[21,14],[29,23],[28,17],[20,32]], # fix input0 to I12,I11 and output to 04
		'wta_bufbias[0]' ,[32,62], 
		'wta_primary_bufbias[0]' ,[32,62], 
		'wta_pfetbias[0]' ,[29,1],
		'wta_primary_pfetbias[0]' ,[29,1], 
		'wta_primary_pfetbias1[0]' ,[4,1], 
                'integrator_fg[0]',[[28,19-57],[28,27-57],[12,17-57],[25,17-57],[27,17-57],[26,18-57]],
                'integrator_nmirror_fg[0]',[[28,19-57],[28,27-57],[12,17-57],[25,17-57],[27,17-57],[26,18-57],[28,31-57]],
            	'nmirror_bias[0]', [[5, 1]],
            	'nmirror_bias[1]', [[4, 1]],
                'common_source_fg[0]',[[18,0],[25,24]],
		'integrator_ota0[0]'   ,[[32,62-57]],
	        'integrator_ota1[0]'   ,[[32,63-57]],
		'integrator_nmirror_ota0[0]'   ,[[32,62-57]],
	        'integrator_nmirror_ota1[0]'   ,[[32,63-57]],
	        'integrator_nmirror_ota2[0]'   ,[[5,1-57]],
	        'cs_bias[0]'   ,[[25,1]],
                'tgate_so_fg[0]',[[21,27],[19,28],[17,29],[15,30],[13,19],[11,19],[9,19],[7,19]],
		'vmm_senseamp1_fg[0]',[[33,17],[32,15]],
		'vmm_senseamp2_fg[0]',[[33,17],[32,15],[30,16],[31,18]],
		'SR_fg[0]'	     ,[[33,19],[32,20],[31,21],[30,22],[33,8],[32,12],[31,2],[30,6],[25,18+15],[25,19+15]],
		'vmm_bias[0:3]'	     ,[[33,32,31,30],0],
		'vmm4x4_target[0:3]',[33,[10,11,13,14]], # Shift-register0
		'vmm4x4_target[4:7]',[32,[10,11,13,14]], #SR1
		'vmm4x4_target[8:11]',[31,[10,11,13,14]], #SR2
		'vmm4x4_target[12:15]',[30,[10,11,13,14]],#SR3
		'vmm8x4_target[0:7]',[33,[10,11,13,14,3,4,5,7]], # Shift-register0
		'vmm8x4_target[8:15]',[32,[10,11,13,14,3,4,5,7]], #SR1
		'vmm8x4_target[16:23]',[31,[10,11,13,14,3,4,5,7]], #SR2
		'vmm8x4_target[24:31]',[30,[10,11,13,14,3,4,5,7]],#SR3
		'vmm8x4_in_target[0:7]',[33,[2,3,4,5,6,7,8,9]], # 
		'vmm8x4_in_target[8:15]',[32,[2,3,4,5,6,7,8,9]], # 
		'vmm8x4_in_target[16:23]',[31,[2,3,4,5,6,7,8,9]], # 
		'vmm8x4_in_target[24:31]',[30,[2,3,4,5,6,7,8,9]], # 
		'dendrite_4x4_target[0:2]',[13,[2,20,0]], # The first is the input and the second is going to second output and third is to gnd
		'dendrite_4x4_target[3:5]',[11,[3,21,0]], # 
		'dendrite_4x4_target[6:8]',[9,[4,22,0]], # 
		'dendrite_4x4_target[9:11]',[7,[5,33,0]], # These are different to terminate it correctly.The middle one is dummy [7,33]
		'dendrite_4x4_target[12:14]',[21,[22,32,0]], #  These are different to terminate it correctly. The middle one is dummy[21,32]
		'dendrite_4x4_fg[0]',[[13,19],[11,20],[9,21],[7,22]], # these are being used for internal connection is dendrite
		'vmm12x1_target[0:11]',[19,[2,3,4,5,6,7,8,9,10,11,12,13]],#VMM target values
		'vmm12x1_wowta_fg[0]',[[19,19]],#VMM fg[19,23]
		'vmm12x1_fg[0]',[[19,23],[20,0],[21,24],[18,15],[27,15],[26,18]],#VMM fg[19,23]
		'vmm12x1_pfetbias[0]' ,[18,1], #WTA pfet bias
		'vmm12x1_offsetbias[0]' ,[19,1], #WTA pfet bias,offset for the vmm
		'vmm12x1_otabias[0]' ,[32,63], #WTA pfet bias
		'fg_io_fg[0]'	,[[22,13]], # fg_io block
		'sftreg_fg[0]'  ,[[30,40],[30,41],[30,42],[30,43],[30,44],[30,45],[30,46],[30,47],[30,48],[30,49],[30,50],[30,51],[30,52],[30,53],[30,54],[30,55],[25,19+15+21]],
		'DAC_sftreg_fg[0]'  ,[[25,19+15+21],[33,1],[30,40],[30,41],[30,42],[30,43],[30,44],[30,45],[30,46],[30,47],[30,48],[30,49],[30,50],[30,51],[30,52],[30,53],[30,54],[30,55]],
		'DAC_sftreg_normal[0]'  ,[[33,1],[33,15],[25,33]],
		'DAC_bias_pfet[0]'  ,[25,0],
		'DAC_sftreg_target[0:5]'  ,[33,[8,9,10,11,12,13]],
		'DAC_sftreg_target[6:7]'  ,[[26,27],36],
		'DAC_sftreg_target[8:13]'  ,[33,[2,3,4,5,6,7]],
		'DAC_sftreg_target[14:15]'  ,[[28,29],36],
		'sftreg2_fg[0]' ,[[30,40],[30,41],[30,42],[30,43],[30,44],[30,45],[30,46],[30,47],[30,48],[30,49],[30,50],[30,51],[30,52],[30,53],[30,54],[30,55],[25,19+15+21]],
		'sftreg3_fg[0]' ,[[30,40],[30,41],[30,42],[30,43],[30,44],[30,45],[30,46],[30,47],[30,48],[30,49],[30,50],[30,51],[30,52],[30,53],[30,54],[30,55],[21,33],[21,34]],
		'nfet_i2v_fg[0]', [[28,17],[29,24],[19,24],[18,0]],
		'nfet_i2v_otabias[0]', [32,62],
		'pfet_i2v_fg[0]', [[28,17],[29,26],[15,0],[14,0]],
		'pfet_i2v_otabias[0]', [32,62],
	        'mmap_ls_fg[0]' ,[[30,40],[30,41],[30,42],[30,43],[30,44],[30,45],[30,46],[30,47],[30,48],[30,49],[30,50],[30,51],[30,52],[30,53],[30,54],[30,55],[25,19+15+21]],
		'mmap_ls_in_r0_vdd[0]' ,[[33,1]],
		'mmap_ls_in_r0[0]' ,[[33,2],[33,3],[33,4],[33,5],[33,6],[33,7],[33,8],[33,9],[33,10],[33,11],[33,12],[33,13]],
		'mmap_ls_in_r1_vdd[0]' ,[[32,1]],
		'mmap_ls_in_r1[0]' ,[[32,2],[32,3],[32,4],[32,5],[32,6],[32,7],[32,8],[32,9],[32,10],[32,11],[32,12],[32,13]],
		'th_logic_fg[0]', [28,17],
		'th_logic_otabias[0]', [32,62],
		#'th_logic_inbias[0]' ,[[28,2],[28,3],[28,4],[28,5],[28,6],[28,7],[28,8],[28,9]],
		'th_logic_inbias_0[0]' ,[[28,2]],
		'th_logic_inbias_1[0]' ,[[28,3]],
		'testtemp_ls[0]',[[1,2],[31,61],[31,60],[31,59],[31,58]],
		'testtemp_cap0_4x_cs[0]',[28,57],
		'testtemp_cap0_2x_cs[0]',[28,58],
		'testtemp_cap0_1x_cs[0]',[28,59],
		'testtemp_cap1_4x_cs[0]',[28,57],
		'testtemp_cap1_2x_cs[0]',[28,58],
		'testtemp_cap1_1x_cs[0]',[28,59],
		'testtemp_fgota1_ibias[0]',[32,60],
		'testtemp_fgota1_pbias[0]',[33,61],
		'testtemp_fgota1_nbias[0]',[33,60],
		'testtemp_fgota0_ibias[0]',[32,58],
		'testtemp_fgota0_pbias[0]',[33,59],
		'testtemp_fgota0_nbias[0]',[33,58],
		'testtemp_ota0_ibias[0]',[32,62],
		'testtemp_ota1_ibias[0]',[32,63],
		'testtemp_fgswc_ibias[0]',[2,3],
