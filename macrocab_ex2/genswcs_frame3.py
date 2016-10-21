			sub_outputs=subblock.findall("outputs")[0].findall("port")[0].text.split()
			#pdb.set_trace()
		    nsb.inputs = sub_inputs	
                    nsb.outputs = sub_outputs
                    #pdb.set_trace()
		    #print "++++++++++++"
                    #print sub_inst
		    #print nsb.inputs
		    print nsb.outputs
                    #nb.addSub(nsb)
                    #try:
		    #pdb.set_trace()
                    nb.addSub(nsb, sub_inst)
                    #except: pdb.set_trace()
		    #print "NSB copy"
                    if verbose: print nb.inputs
		    print nb.outputs
                    #pdb.set_trace()
                    
            #now that we have all subblocks, with all of their output names
            # we can go and update the input names 

            #pdb.set_trace()
            if counter_flag == 0:
                for i in range(len(nb.subblocks)):
                    #pdb.set_trace()
    		#print i
                    cur_sub = nb.getSub(i)
    		#print cur_sub
                    sub_inputs = cur_sub.inputs
                    sub_input_names = []
    		#pdb.set_trace()
                    for i in range(len(sub_inputs)):
                        cur_input = sub_inputs[i]                        
                        if cur_input.split('.')[0] == block_type:           #input from complex block input
                            in_num = int(cur_input.split('[')[-1].split(']')[0]) #cab.I[13] -> 13
                            sub_input_names.append(nb.inputs[in_num])                          
                        elif cur_input == 'open':                                  
                            sub_input_names.append('open')
                        else:     
                            #try:                                          #input from device output *****                             
                            sub_input_names.append(nb.getSub(cur_input.split('.')[0]).outputs)
                            #except:
                                #pdb.set_trace()
    
                    cur_sub.inputs = sub_input_names
    		#print cur_sub.inputs
                    if verbose: print cur_sub.inputs        
                output_net_names = outputs
		net_num=0
                for i in range(len(outputs)):
                    if outputs[i] != 'open':
	
                        from_sub_name = outputs[i].split('.')[0] #ota[0].out[0] -> ota[0]
			#pdb.set_trace()
                        if from_sub_name ==['SR4[0]']:
                            try:
                                if i<4:
                                    output_net_names[i]=nb.getSub(from_sub_name).outputs[i]
                                else:
                                    #pdb.set_trace()
                                    output_net_names[i]=nb.getSub(from_sub_name).outputs[i]
                            except:
                                pdb.set_trace()
                        elif from_sub_name =='vmm4x4[0]':
                            try:
                                if i<5:
                                    output_net_names[i]=nb.getSub(from_sub_name).outputs[i]
                                else:
                                    pdb.set_trace()
                                    output_net_names[i]=nb.getSub(from_sub_name).outputs[i]
				
                            except:
                                pdb.set_trace()
