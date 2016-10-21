			    #pdb.set_trace()
                            try:
                                #if i<2:
				    
                                    output_net_names[i]=nb.getSub(from_sub_name).outputs[net_num]
				    net_num=net_num+1 # omcrement net number
				    if net_num == len(sub_outputs):
					net_num=0
			    
                                #else:
                                #    pdb.set_trace()
                                #    output_net_names[i]=nb.getSub(from_sub_name).outputs[i]
				
                            except:
                                pdb.set_trace()
                        else:
                            output_net_names[i] = nb.getSub(from_sub_name).outputs
		    
                #pdb.set_trace()
                nb.outputs = output_net_names
                if verbose: print nb.outputs     
        elif block_type in ['inpad', 'outpad']:
            nb.type = 'ioslice_%s'%block_type    #global pblocksblock_type
            #nb.outputs = nb.inputs[0]
            nb.outputs = block_name
            nb.inputs[0] = block_name
        
        nb.portorder = range(len(nb.inputs)+len(nb.outputs))
        nblocks[nb.name] = nb
            #pdb.set_trace()
    	#print nb.name
    	#print nb
    #pdb.set_trace()
                              
def parsePlace(file_name):
    global xarray
    
    f = open(file_name, 'r')

    go = False
    for line in f:
        words = line.split()
        if go:
            grid_loc = [int(words[1]), int(words[2])]
            sub_num = int(words[3])
            block_name = words[0]
            
            new_block = nblocks[block_name]
            new_block.grid_loc = grid_loc
            #print "IN parse" #%%
	    #pdb.set_trace()
            #if tile is empty: xarray.addSub(grid_loc, new_block
            #if tile is not empty: xarray.getSub(grid_loc).addSub(new_block)
            if xarray.getSub(grid_loc).type == []:
                if new_block.type[:7] == 'ioslice':
                    xarray.addSub(ioblock(block_name), grid_loc)
                else:
                    xarray.addSub(new_block, grid_loc)
                    
            if new_block.type[:7] == 'ioslice':
                xarray.getSub(grid_loc).addSub(new_block, sub_num)
                
                # $$PROBLEM: setting port numbers for ioblocks is super hardcoded here! i blame VPR!
                if new_block.type[8:] == 'inpad':
                    xarray.getSub(grid_loc).setPort(sub_num*3+1, block_name) #setting output port
                else:
                    xarray.getSub(grid_loc).setPort(sub_num*3+0, block_name) #setting input port
                      
        #kind of a lazy check
        if len(words) and words[0] == "#----------":
            go = True
            
def parsePads(file_name):
    
    f = open(file_name, 'r')

    for line in f:
        words = line.split()        
        if len(words) !=0:
             grid_loc = [int(words[1]), int(words[2])]
       	     sub_num = int(words[3])
       	     io_type = words[-1]
             try:
            	xarray.getSub(grid_loc).getSub(sub_num).type = io_type
             except:
               	print 'oops'
               	print words
            	pdb.set_trace()
  
#***********************************
# Pre-parse blif file for different architecture types
#***********************************      
def parseBlif(file_name):
    f = open(file_name ,'r')
    num_4x4 = 0
    num_8x8 = 0
    num_12x12 = 0
    num_16x16 = 0
    meas_volt_mite= 0 
    global ladder_blk  
    global c4_blk 
    global Nagating_blk 
    ladder_blk=0
    c4_blk=0
    Nagating_blk=0
    get_cover = 0
    new_lut = 0
    INFneuron =0
    macroblk=0
    for line in f:
        words = line.split()
        if len(words):
            if words[0] == '.subckt':
                subckt = words[1]
                print '%s %s'%(words[0], subckt)
            
                #count vmm type and num
                if subckt == 'vmm_4x4':   num_4x4 = num_4x4 + 1
                if subckt == 'vmm_8x8':   num_8x8 = num_8x8 + 1
                if subckt == 'vmm_12x12': num_12x12 = num_12x12 + 1
                if subckt == 'vmm_16x16': num_16x16 = num_16x16 + 1
                if subckt == 'meas_volt_mite': meas_volt_mite=meas_volt_mite +1
		if subckt =='ladder_blk': ladder_blk=ladder_blk+1
		if subckt =='c4_blk': c4_blk=c4_blk+1	
		if subckt =='Nagating_blk': Nagating_blk=Nagating_blk+1	
		if subckt =='INFneuron': INFneuron=INFneuron+1
		if subckt in ['INFneuron','hyst_diff']: macroblk=macroblk+1
                #a = '.subckt ota in[1] = i4  out=o3 # ota_bias 0.9 ota_p_bias 0.5 ota_n_bias 0.5'
                dev_type = line.split(' ')[1]
                
                if len(line.split('#')) > 1:
                    ex_fgs = line.split('#')[1].rstrip()
                else:
                    ex_fgs = 0
                
                ports = []
                for i in line.split('=')[1:]:
                    port = i.lstrip().split(' ')[0].rstrip()
                    ports.append(port)
		print ports                
		#pdb.set_trace()    
                #key = dev_type + ' ' + ' '.join(ports) # this key is type + port list
		if subckt in ['lpf_2','meas_volt_mite','ramp_fe','cap','ota_buf','ota_buffer','lpf','nfet_i2v','pfet_i2v','i2v_pfet_gatefgota','HOP_bif','nmirror','wta_primary','common_source','common_source1','fg_io','nmirror_vmm','TIA_blk','fgswc_nmirror_w_bias','bias_gen','fgswitch']: ## single i/ps
                	key = ports[1] #this key is just output port name ## for all cases with a single i/p- o/p
		elif subckt in ['INFneuron','DAC_sftreg','latch_custom','integrator','integrator_nmirror','sigma_delta_fe','sftreg2','mmap_local_swc','speech','in2in_x1','mismatch_meas','switch_amp','mite']: #3 i/ps
			key=ports[3]
			 #pdb.set_trace()
		elif subckt in ['gnd_out','vdd_out','nmirror_w_bias','ichar_nfet']: #2 i/ps
			key=ports[2]
		elif subckt in ['vmm_senseamp2','SR4','vmm4x4','mult','hhneuron','hh_neuron_b_debug','dendrite_4x4','sftreg3','sftreg4']: #4 i/ps
			key=ports[4]
		elif subckt in ['switch_cap','Algo_ADC']:
			key=ports[5]
		elif subckt in ['dendiff']:
			key=ports[6]
		elif subckt in ['vmm4x4_SR']: #7 i/ps
			key=ports[7]
		elif subckt in ['vmm4x4_SR2','tgate_so','th_logic','mux4_1']: #8 i/ps
			key=ports[8]
		elif subckt in ['vmm8inx8in']: #17 i/ps
			key=ports[17]
		elif subckt in ['vmm8x4_SR']: #11 i/ps ,
			key=ports[11]
		elif subckt in ['vmm12x1_wowta']: #12 i/ps ,
			key=ports[12]
		elif subckt in ['vmm8x4','vmm8x4_in','in2in_x6','vmm12x1']: #13 i/ps ,
			key=ports[13]
	        elif subckt in ['sftreg']: #19 i/ps ,'sftreg'
			key=ports[19]
		elif subckt in ['inv_mcab']:
			key=ports[1]
