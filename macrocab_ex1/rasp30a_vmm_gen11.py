		'vmm_volatile[0]'     ,[[30,40],[30,44],[30,48],[30,52],[25,54]]]#volatile switch in shift register
		
        self.dev_fgs = smDictFromList(dev_fgs_sm)
	#pdb.set_trace()
     
    
class cab_vmm(complexBlock):
    def __init__(self, name):
        
        self.name = name
        self.type = 'CAB_VMM'
        self.stats = cab_vmmStats()     
        self.array_stats = arrayStats()
        self.subblocks = []
        
        #CAB ports
        self.inputs = ['open']*self.stats.num_inputs
        self.outputs = ['open']*self.stats.num_outputs

        #CAB Devices
        dev_types = self.stats.dev_types
        dev_pins = self.stats.dev_pins 
	#pdb.set_trace()  
        self.addSubs(dev_types, dev_pins)
        
    def genLI(self, *var):
        self.swcs = []
	#print a
	#pdb.set_trace()
        #cab = rasp3array().array['cab']
        verbose = 0
        if len(var) == 1: verbose = 1
        
        #inputs to local interconnect--
        #   inputs to CAB + outputs from DEVs
        self.li_in_in = ['gnd','vcc']+self.inputs
        self.li_in_dev = []
        for i in range(len(self.subblocks)):
	    if isinstance(self.getSub(i).outputs,str):
	    	self.getSub(i).outputs= self.getSub(i).outputs.split()
	    for j in range(len(self.getSub(i).outputs)):
            	self.li_in_dev.append(self.getSub(i).outputs[j])
        self.li_in_dev.reverse()
        self.li_in = self.li_in_in + self.li_in_dev
       
        #outputs from local interconnect--
        #   inputs to DEVs + outputs from CAB
        self.li_out_out = self.outputs
        self.li_out_dev = []
        for i in range(len(self.subblocks)):
            for j in range(len(self.getSub(i).inputs)):
                self.li_out_dev.append(self.getSub(i).inputs[j])      
        self.li_out = self.li_out_dev+self.li_out_out 
        #pdb.set_trace()
        self.li = [[0]*len(self.li_in) for x in self.li_out]
        #pdb.set_trace()
        #printing connectivity matrix and filling the local interconnect matrix
        x = 1
        for i in range(len(self.li_in)):
            if verbose: print '%s'%str(i).ljust(2),
        if verbose: 
		print
        	#pdb.set_trace()    
        for i in range(len(self.li_in)):
            if self.li_in[i] != 'open':
                if verbose: print '%s'%self.li_in[i].ljust(x),
            else:
                if verbose: print ''.ljust(x),
        if verbose: print
	#pdb.set_trace()
        for i in range(len(self.li_out_dev)):
            if self.li_out[i] != 'open':
                for j in range(len(self.li_in)):
		    #print self.li_out[i]
                    if self.li_out[i] == self.li_in[j]:
                        if verbose: print str('X').ljust(x),
                        self.li[i][j] = 1
                    else:
                        if verbose: print str('.').ljust(x),
                if verbose: 
                    print self.li_out[i].ljust(2), 
                    print str(i).ljust(2)
            else:
                for j in range(len(self.li_in)):
                    if verbose: print str('.').ljust(x),
                if verbose: print '%s%s'%(''.ljust(3), str(i).ljust(2))
        #pdb.set_trace()        
        for i in range(len(self.li_out_out)):
            for j in range(len(self.li_in_in)):
                if verbose: print ''.ljust(x),
            for j in range(len(self.li_in_dev)):
                if self.li_out_out[i] == self.li_in_dev[j] and self.li_out_out[i] != 'open':
                    if verbose: print 'X'.ljust(x),
                    self.li[i+len(self.li_out_dev)][j+len(self.li_in_in)] = 1
                else:
                    if verbose: print '.'.ljust(x),
            if self.li_out_out[i] == 'open':
                if verbose: print self.li_out_out[i]
            else:
                if verbose: print self.li_out_out[i]
                
        #actually generating the switches addresses here  
        self.swcsFromLi()    
                 
    def dispLI(self):
        self.genLI('verbose')
        
    def genDevFgs(self):
	print "getting here!"
        verbose = 1
        for i in range(len(self.subblocks)):
            sb = self.getSub(i)
	    #pdb.set_trace()
	    #print sb
            if sb.outputs != 'open':
                swc_name0 = sb.name
                #pdb.set_trace()
                if sb.ex_fgs:
		    ex_fg=sb.ex_fgs.split("&")
		    #pdb.set_trace()
		    for s in range(len(ex_fg)):
			    for j in ex_fg[s].split()[::2]:
				if swc_name0 in["ladder_blk[0]","hhneuron[0]","c4_blk[0]","speech[0]","INFneuron[0]","lpf[0]","peak_detector[0]","ramp_fe[0]",'sigma_delta_fe[0]','nmirror_vmm[0]','bias_gen[0]']:
					#pdb.set_trace()
					swc_name1 = j
				#elif 
				elif swc_name0 in ["vmm4x4_SR[0]","vmm4x4_SR2[0]","vmm8x4_SR[0]",'vmm4x4[0]','vmm8x4[0]','vmm8x4_in[0]','vmm12x1[0]','vmm12x1_wowta[0]','DAC_sftreg[0]','dendrite_4x4[0]']:
				    swc_name1 = j+'['+sb.name.split('[')[1]
				     #pdb.set_trace()
				    if swc_name0 in ['vmm4x4_SR[0]','vmm4x4_SR2[0]','vmm4x4[0]']:
					vmm_size=16
					vmm_str='vmm4x4_target'
				    elif swc_name0 in ['vmm12x1[0]','vmm12x1_wowta[0]']:
					vmm_size=12
					vmm_str='vmm12x1_target'
				    elif swc_name0 in ['dendrite_4x4[0]']:
					vmm_size=15
					vmm_str='dendrite_4x4_target'
				    elif swc_name0 in ['DAC_sftreg[0]']:
					vmm_size=16
					vmm_str='DAC_sftreg_target'
				    elif swc_name0 in ['vmm8x4_in[0]']:
					vmm_size=32
					vmm_str='vmm8x4_in_target'
        			    elif swc_name0 in ['vmm8x4[0]']:
					vmm_size=32
					vmm_str='vmm8x4_target'
                                    if swc_name1 in ['vmm4x4_target[0]','vmm8x4_target[0]','vmm8x4_in_target[0]','vmm12x1_target[0]','DAC_sftreg_target[0]','dendrite_4x4_target[0]']:
					targets=list(ex_fg[s].split("=")[1].split(","))
					for h in range(0,vmm_size):
					    swc_name1=vmm_str+'['+str(h)+']'
					     #pdb.set_trace()
					    swc2 = self.stats.dev_fgs[swc_name1]
					     #pdb.set_trace()
					    swcx = self.array_stats.getTileOffset(swc2, self.grid_loc)
					     #pdb.set_trace()
					    swcx.append(targets[h])
					    swcx.append(1)
					    self.swcs.append(swcx)
					    if verbose: print '%s %s -> (%g %g) -> (%g %g)'%(swc_name0, swc_name1, swc2[0], swc2[1], swcx[0], swcx[1])
					#pdb.set_trace()
					continue
				    elif swc_name1=='vmm_bias[0]':
					targets=list(ex_fg[s].split("=")[1].split(","))
					#pdb.set_trace()
					for h in range(0,4):
					    swc_name1='vmm_bias['+str(h)+']'
					    swc2 = self.stats.dev_fgs[swc_name1]
					    swcx = self.array_stats.getTileOffset(swc2, self.grid_loc)
					    swcx.append(targets[h])
					    swcx.append(1)
					    self.swcs.append(swcx)
					    if verbose: print '%s %s -> (%g %g) -> (%g %g)'%(swc_name0, swc_name1, swc2[0], swc2[1], swcx[0], swcx[1])
					#pdb.set_trace()
					continue
				    else:
					#pdb.set_trace()
					swc_name1 = j+'['+sb.name.split('[')[1]
				else:
		                	swc_name1 = j+'['+sb.name.split('[')[1]
		                swc0 = self.stats.dev_fgs[swc_name0]
		                swc2 = self.stats.dev_fgs[swc_name1]
				#pdb.set_trace()
				for n in range(len(swc2)):
					if isinstance(swc2[0],int):
						swc1=swc2
					else:
						swc1=swc2[n]
				        swc = [swc0[0]+swc1[0], swc0[1]+swc1[1]]
				        swcx = self.array_stats.getTileOffset(swc, self.grid_loc)
				        if verbose: print '%s %s -> (%g %g) -> (%g %g)'%(swc_name0, swc_name1, swc[0], swc[1], swcx[0], swcx[1])
					#if swc_name1 in['vmm_volatile[0]'] :
					#	#pdb.set_trace()
					#	swcx.append(1)
					
					if n==0 and swc_name1 not in ['sftreg_fg[0]', 'DAC_sftreg_fg[0]','sftreg2_fg[0]','sftreg3_fg[0]','nfet_i2v_fg[0]','pfet_i2v_fg[0]','mmap_ls_fg[0]','mmap_ls_in_r0_vdd[0]','mmap_ls_in_r0[0]','mmap_ls_in_r1_vdd[0]','mmap_ls_in_r1[0]','th_logic_fg[0]']: 
						swcx.append(ex_fg[s].split('=')[1])
					#else:
						#swcx.append(0)
					#pdb.set_trace()	
					if ex_fg[s].split('=')[0] in ['ota_p_bias ','ota_n_bias ','fgota0nbias ','fgota0pbias ','fgota1nbias ','fgota1pbias ']:
						swcx.append(3)
					elif swc_name1 in ['c4_ota_p_bias[0]','c4_ota_n_bias[0]','INV_cs_otaPBIAS[0]','INV_cs_otaNBIAS[0]','c4_ota_p_bias[1]','c4_ota_n_bias[1]','peak_ota_n_bias[0]','peak_ota_p_bias[0]']:
						swcx.append(3)	
					elif swc_name1 in ['c4_ota_bias[0]','c4_ota_bias[1]','peak_ota_bias[0]','wta_bufbias[0]','wta_primary_bufbias[0]','speech_peakotabias[0]','speech_peakotabias[1]','vmm12x1_otabias[0]','nfet_i2v_otabias[0]','pfet_i2v_otabias[0]','th_logic_otabias[0]','INV_cs_otaBIAS[0]']:
						swcx.append(2)
					elif swc_name1 in ['hh_ota_p_bias[0]','hh_ota_n_bias[0]','hh_ota_p_bias[1]','hh_ota_n_bias[1]']:
						swcx.append(3)
					elif swc_name1 in ['hh_nabias','hh_kbias','hh_vinbias']:
						swcx.append(2)
					elif ex_fg[s].split('=')[0] in ['ota0bias ','ota1bias ','fgota0bias ','fgota1bias ','integrator_ota0 ','integrator_ota1 ','integrator_nmirror_ota0 ','integrator_nmirror_ota1 ','fgota_biasfb[0] ','fgota_biasfb[1] ','fgota_biasfb '] and n==0:
					        #pdb.set_trace()
						swcx.append(2)
					elif swc_name1 == 'fgota_biasfb[0] 'and n==0:
						swcx.append(2)
					elif swc_name1 == 'fgota_biasfb[1] 'and n==0:
						swcx.append(2)
					elif swc_name1 in ['hh_leak','hh_fbpfetbias','vd_target[0]','vd_target[1]','ramp_pfetinput[0]','ramp_pfetinput[1]','wta_pfetbias[0]','wta_primary_pfetbias1[0]','wta_primary_pfetbias[0]','speech_pfetbias[0]','speech_pfetbias[1]','vmm12x1_pfetbias[0]','integrator_nmirror_ota2 ','DAC_bias_pfet[0]','vmm12x1_offsetbias[0]','fg_io_fg[0]','nmirror_bias[0]','INF_bias[0]','cs_bias[0]','INV_cs_NBIAS[0]','INV_cs_PBIAS[0]','bias_gen_current1','bias_gen_current2']:
						swcx.append(1)
					elif swc_name1 in ['INF_bias[0]']:
						swcx.append(1)
                                        elif sb.name.split('[')[0] in ['ota','ota_buf','fgota','ladder_blk','c4_blk','INFneuron','lpf','ramp_fe','sigma_delta_fe'] and swc_name1[0:6]!="c4_cap" and  swc_name1[0:5]!="c4_fg" and n==0 and swc_name1 not in ['INF_fg[0]','lpf_fg[0]','peak_detector[0]'] and swc_name1[0:7] not in ['lpf_cap','ramp_fe','sigma_d'] :
						#pdb.set_trace()
						swcx.append(2)
					elif swc_name1 in ['mmap_ls_in_r0[0]','mmap_ls_in_r0[1]']:
						swcx.append(ex_fg[s].split('=')[1])
                                                swcx.append(1)
					elif swc_name1 in ['th_logic_inbias_0[0]','th_logic_inbias_1[0]']:
                                                swcx.append(1)
					#else:
						#swcx.append(0)
				        self.swcs.append(swcx)
