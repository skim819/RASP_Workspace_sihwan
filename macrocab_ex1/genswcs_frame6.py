                else:
			key = ports[2] #this key is just output port name
			 #pdb.set_trace()
                if ex_fgs:
                    ex_fgs_dict[key] = ex_fgs 
		print subckt                
		#pdb.set_trace()   
                
                
            elif words[0] == '.names':
                #pdb.set_trace()
		ff_custom=1
                get_cover = 1       
                new_lut = 1
                
                lut_outputs = words[-1]
                lut_inputs = words[1:-1]
                
                #cl = lut(lut_outputs) #yah, it's name is defined by it's single output net name. deal with it.
                cl = pblock(lut_outputs, 'lut')
                cl.inputs = lut_inputs
                cl.outputs = lut_outputs
                cl.cover = []
                
            elif get_cover:
                cl.cover.append(words[0])
        else:                               #blank line  
            if new_lut:
                luts[cl.name] = cl
                get_cover = 0
                new_lut = 0
    #pdb.set_trace()        
            
    print 'vmm types: 4x4, 8x8, 12x12, 16x16: %g %g %g %g'%(num_4x4, num_8x8, num_12x12, num_16x16)
            
    #simply using hardcoded arch files at the moment
    #one column of 8x8, 12x12 or 16x16
    arch_file = './arch/rasp3_arch.xml' ## suma
    #arch_file = arrayStats.arch_file ##suma
    if num_4x4 >0:    arch_file = './arch/rasp3_vmm_4x4_arch.xml'
    if num_8x8 > 0:   arch_file = './arch/rasp3_vmm_8x8_arch.xml'
    if num_12x12 > 0: arch_file = './arch/rasp3_vmm_12x12_arch.xml'
    if num_16x16 > 0: arch_file = './arch/rasp3_vmm_arch.xml'
    if num_vmm > 0:   arch_file = './arch/rasp3_vmm_arch.xml'
    if rasp3a > 0:   arch_file = './arch/rasp3a_arch.xml'
    if rasp3a > 0 and num_vmm > 0:   arch_file = './arch/rasp3a_vmm_arch.xml'
    elif rasp3a > 0 and macroblk>0: arch_file='./arch/rasp3a_arch_meas_volt_mite.xml'
    elif ladder_blk>0 or INFneuron>0 or macroblk>0: arch_file='./arch/rasp3_arch_meas_volt_mite.xml'
    return arch_file  
            
            
def parseRoute(file_name):
    global groutes
    global xarray
    
    VERBOSE = 1
    groutes = list()
    f = open(file_name, 'r')

    for line in f:
        words = line.split()
        cur = words
	#print cur
	#pdb.set_trace()
        if len(cur):
            if cur[0] == "Net" and cur[2]!="(gnd):":

                del cap_seq[:]
		#print '!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
		#new route. add old route to groutes
                if 'new_route' in locals():
                    groutes.append(new_route)
                
                net_name = words[2]
                    
                new_route = dict()
                new_route['name'] = net_name
                new_route['num'] = words[1]
                new_route['connections'] = list()
                last = []
		lastlast = []
                if VERBOSE: print  " ------------- " + words[2] + " ------------- "
            elif cur[0] in ['SOURCE']:
		source=cur
		source[0]='CHANX'
		source_pin=int(cur[3])
	    elif cur[0] in ['SINK']:
		#last=source
		continue
		#pdb.set_trace()    
            elif cur[0] in ['OPIN','CHANX','CHANY','IPIN']:
		try:
		    tile_t=int(cur[3])
		except:
		    tile_t=int(cur[5])
                if last:
                    cgl = [int(i) for i in cur[1][1:-1].split(',')] #current grid location
                    lgl = [int(i) for i in last[1][1:-1].split(',')] #last grid location
                    #print '###############', lastlast, last, cur
		    if lastlast != []:
			if lastlast[0] == 'OPIN' and last[0] == 'CHANX' and cur[0] == 'IPIN':
			    if lastlast[1] == last[1] and last[1] == cur[1]:
				c_outin = 1
				#print 'yup_yup_yup_yup_yup' 
			    else:
				c_outin = 0
			else:
			    c_outin = 0
		    else:
			c_outin = 0
		    #print c_outin
                    pin_num = -1
                    if cur[0] == 'IPIN':
                        #pdb.set_trace() 
                        pin_num = tile_t
                    elif last[0] == 'OPIN':
                        pin_num = int(last[3]) 
		    elif last[0] == 'SINK':
                        pin_num = int(last[3]) # special case

		    #connection = last[0] + " " + last[1] + " --> " + cur[0] + " " + cur[1]
                    connection = "%s %s --> %s %s" % (last[0].rjust(5), last[1].rjust(6), cur[0].rjust(5), cur[1].rjust(6))
                    if cur[0][:-1] == 'CHAN':
                        connection = connection + " T/P: " + cur[3].rjust(2) + ' ' + str(pin_num).rjust(2)
                    else:
                        connection = connection + " T/P: " + last[3].rjust(2) + ' ' + str(pin_num).rjust(2)
                        
                    new_route['connections'].append(connection)                   
                    if VERBOSE: print '| ' + connection + ' |',

                    # add switch address -- lets keep this clean shall we?
                    if last[0][:-1] == 'CHAN' and cur[0][:-1] == 'CHAN':
                        
                        #SBLOCK connection: CHAN to CHAN
                        block_dir = [int(cgl[0])-int(lgl[0]), int(cgl[1])-int(lgl[1])]
                        track = cur[3]
			#print block_dir
			
                        if last[0] == 'CHANY':
                            if cur[0] == 'CHANY':
                                if block_dir == [0,1]:
                                    swc = getSwcSswitch('sn', track, lgl, new_route['name'])
                                else:
                                    swc = getSwcSswitch('ns', track, cgl, new_route['name'])
                            elif cur[0] == 'CHANX':
                                if block_dir == [0,0]:
                                    swc = getSwcSswitch('sw', track, lgl, new_route['name'])
                                elif block_dir == [1,0]:
                                    swc = getSwcSswitch('se', track, lgl, new_route['name'])
                                elif block_dir == [0,-1]:
				    #pdb.set_trace()	
                                    swc = getSwcSswitch('nw', track, cgl, new_route['name'])
                                elif block_dir == [1,-1]:
                                    swc = getSwcSswitch('ne', track, [lgl[0],lgl[1]-1], new_route['name']) #
				else:
				     print "SBLOCK switch error"
				     print block_dir
				     pdb.set_trace()
                        elif last[0] == 'CHANX':
                            if cur[0] == 'CHANX':
				#pdb.set_trace()
                                if block_dir == [1,0]:
                                    swc = getSwcSswitch('we', track, lgl, new_route['name'])
				else:
                                    swc = getSwcSswitch('ew', track, cgl, new_route['name'])
			    if cur[0] == 'CHANY':
                                if block_dir == [0,1]:
                                    swc = getSwcSswitch('wn', track, lgl, new_route['name'])
                                elif block_dir == [0,0]:
                                    swc = getSwcSswitch('ws', track, lgl, new_route['name']) # can be lgl or cgl
                                elif block_dir == [-1,0]:
                                    swc = getSwcSswitch('es', track, cgl, new_route['name']) 
                                elif block_dir == [-1,1]:
                                    swc = getSwcSswitch('en', track, [cgl[0],cgl[1]-1], new_route['name'])
                                elif block_dir == [1,0]:
                                    swc = getSwcSswitch('se', track, lgl, new_route['name']) #%%
				    #pdb.set_trace() 
				elif block_dir == [0,-1]: ##special case when branching...so create CHANY->CHANY case
                                    swc = getSwcSswitch('sn', track, cgl, new_route['name'])
				else:
				     print "SBLOCK switch error"
				     print block_dir
				     pdb.set_trace()     
		    elif last[0] == 'OPIN' and cur[0][:-1] == 'CHAN':
			block_dir = [int(cgl[0])-int(lgl[0]), int(cgl[1])-int(lgl[1])]
                        track = cur[3]
                        
                        #CBLOCK connection from source: CAB/CLB/IO -> CBLOCK
                        if cur[0] == 'CHANX':
			    swc = getSwcCblock(last[3], lgl, 'CHANX', track, cgl, new_route['name'], c_outin)
                        elif cur[0]== 'CHANY':
			    if block_dir ==[0,0]:
				swc = getSwcCblock(last[3], [cgl[0],cgl[1]], 'CHANY', track, cgl, new_route['name'], c_outin) # &&removed as pin_grid update
			    else:		
                            	swc = getSwcCblock(last[3], lgl, 'CHANY', track, cgl, new_route['name'], c_outin) 
                              
                        #update pin order
                        #xo =  xarray.getSub(int(lgl[0]),int(lgl[1])).outputs
                        #iold = xo.index(net_name[1:-1])                        
                        #inew = int(last[3]) - len(xarray.getSub(lgl).inputs)
                        #xo[iold], xo[inew] = xo[inew], xo[iold]     
                        
                        #block_name = getBlockName(lgl)
                        #if net_name[1:-1] not in pblocks[block_name]['pin reorder'].keys():                        
                        #    pblocks[block_name]['pin reorder'][net_name[1:-1]] = last[3]   
                        #else:
                        #    pblocks[block_name]['pin reorder']['out:' + net_name[1:-1]] = last[3]   
                        #print '-- %s %s' % (net_name, last[3])                     

                    elif last[0][:-1] == 'CHAN' and cur[0] == 'IPIN':

                        track = last[3]
			#pdb.set_trace()
			block_dir = [int(cgl[0])-int(lgl[0]), int(cgl[1])-int(lgl[1])]
                        #CBLOCK connection to sink: CHAN to CBLOCK
                        if last[0] == 'CHANX':
                            swc = getSwcCblock(tile_t, cgl, 'CHANX', track, lgl, new_route['name'], c_outin)
                        else:
                            swc = getSwcCblock(tile_t, cgl, 'CHANY', track, lgl, new_route['name'], c_outin)
                        
                        print '~~~~ PIN SINK ~~~~ || net %s -> pin %s in %s %s'%(new_route['name'], cur[3], cgl[0], cgl[1])
                        
                        #update pin order
                        #pdb.set_trace()
                        xarray.getSub(int(cgl[0]),int(cgl[1])).movePort(new_route['name'][1:-1], tile_t)
                        
                        #update pin order    
                        #block_name = getBlockName(cgl)
                        #if net_name[1:-1] not in pblocks[block_name]['pin reorder'].keys():                         
                        #    pblocks[block_name]['pin reorder'][net_name[1:-1]] = cur[3]  
                        #else:
                        #    pblocks[block_name]['pin reorder']['out:' + net_name[1:-1]] = cur[3]  
                        #print '-- %s %s' % (net_name, cur[3])  

                    if VERBOSE: print 'SWC '
                    swcs.append(swc)

                if cur[0] == 'IPIN': #$$ add the pin number for 
                    last = []
                    pin_loc = cur[3]
                    #pdb.set_trace()
		    #xarray[[int(cur[1][1:3])][int(cur[1][4:5])]].pin_loc=pin_loc #$$ 
		    #pdb.set_trace()
                    #update pin input reorder information
                    #for key in pblocks.keys():
                    #    if pblocks[key]['grid_loc'] == cgl:
                    #        pblocks[key]['input reorder'][new_route['name']] = pin_loc
                else:
                    lastlast = last
		    last = cur 
		    #pdb.set_trace()  
                    
    #done parsing file, add last route     
    groutes.append(new_route)
    	#pdb.set_trace()
if __name__ == "__main__":
    main()
                

            

    
