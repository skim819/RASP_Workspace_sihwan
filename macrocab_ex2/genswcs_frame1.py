from lxml import etree
import sys
import os
dirx = os.path.dirname(__file__) + '/'
#dirx = os.path.dirname(__file__)
sys.path.append(dirx + '/arch') #suma
import pdb
from subprocess import call
from os.path import isfile
import copy

#intialization
vmm=0
rasp3a=0
num_vmm=0
ff_custom=1
fix_cab=0
#del cap_nams[:]
#del cap_vals[:]
cap_nams = ['0dum_nam0']
cap_vals = [0]
cap_seq = []
c_outin = []
#pdb.set_trace()
for i in range(len(sys.argv)):
        if sys.argv[i] == '-vmm': vmm=vmm+1
        if sys.argv[i] == '-rasp3a': rasp3a=rasp3a+1
	elif sys.argv[i] == '-route': fix_cab=fix_cab+1

if(vmm==0 and rasp3a==0):
    from rasp30 import *
    from rasp30 import rasp30 as chipStats
    from rasp30 import arrayStats as arrayStats_used
elif(rasp3a==1 and vmm==0):
    from rasp30a import *
    from rasp30a import rasp30a as chipStats
    from rasp30a import arrayStats as arrayStats_used   
elif(rasp3a==1 and vmm==1):
    from rasp30a_vmm import *
    from rasp30a_vmm import rasp30a_vmm as chipStats
    from rasp30a_vmm import arrayStats as arrayStats_used
    num_vmm=num_vmm+1
else:
    from rasp30_vmm import *
    from rasp30_vmm import rasp30_vmm as chipStats
    from rasp30_vmm import arrayStats as arrayStats_used
    num_vmm=num_vmm+1
#from genclasses import *        #suma   
#from rasp3classes import *	#suma

#example:
#python genswcs.py -c mad10

#we're mixing [row, col] and [x, y]
# lets stick w/ [x,y]

#---- common variable conventions ----
#block_type     CHANX, CHANY, SBLOCK, CAB, CAB2, CLB, IO
#tile_type      CAB, CAB2, CLB, IO_N, IO_E, IO_W, IO_S, tile_se
#
#grid_loc       grid location according to VTR      [x,y]
#tile_loc       grid location according to layout   [x,y]
#               for CHANY and SBLOCK    tile_loc = grid_loc + [1,0]
#               all others              tile_loc = grid_loc + [0,0]
#
#----- common functions ----
# tile_loc  <- getTileLoc(block_type, grid_loc)
# tile_type <- getTileType(block_type, grid_loc)

#            io_n    io_n         
#    io_w    clb        cab        io_e
#    io_w    clb        cab        io_e
#            io_s    io_s
#
#            io_gen    io_gen         
#    io_c4    clb        cab        io_tg
#    io_c4    clb        cab        io_tg
#            io_gen    io_gen
global ladder_blk

#from rasp30_vmm import *

def main():
    #globals are weird, apparently only need to assign global if you're modifying the variable. 
    #    not necessary to read from variable.  however, i can modify the var w/o declaring it global.
    #    anyway, just listing globals here for clarity. not for necessity.

    global swcs
    swcs = list()
    #pdb.set_trace()
    #things parsed from VTR
    #global pblocks 
    global groutes
    global nblocks
    global luts
    global xarray
    
    #extra floating-gates
    ex_fgs_dict = dict()
    global ex_fgs_dict
    
    #pblocks = dict()
    
    nblocks = dict()
    luts = dict()
    
    #arch specific addresses
    #global array
    #array = arrayStats()
    #array_info = arrayStats()
    
    #pdb.set_trace()
    #*******************************************************
    #---- input arguments / defaults ---- for calling VPR
    #*******************************************************	
    circuit_loc = './benchmarks/mad7' #default input
    #circuit_loc = './benchmarks/mad_vmm' #default input

    run_dir = dirx + 'temp' # stores all intermediate files in VPR
    vpr_disp = 0 # TURN DISPLAY ON 1 else 0
    arch_file = []
    pins_file = []

    for i in range(len(sys.argv)):
        if sys.argv[i] == '-c': circuit_loc = sys.argv[i+1] 
        if sys.argv[i] == '-d': run_dir = sys.argv[i+1]     
        if sys.argv[i] == '-v': vpr_disp = 1       
        if sys.argv[i] == '-a': arch_file = sys.argv[i+1]       
        if sys.argv[i] == '-p': pins_file = sys.argv[i+1]       
         
    circuit_name = circuit_loc.split('/')[-1]
    if not pins_file and isfile(circuit_loc + '.pads'):
        pins_file = circuit_loc + '.pads'        
    print run_dir
    #--- main functions ---    
    if not arch_file: arch_file = dirx + parseBlif(circuit_loc + '.blif')
    #initial import
    #pdb.set_trace()   I"M HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
    xarray = pbarray(len(chipStats().array.pattern),len(chipStats().array.pattern[0])) #could not get out of genu.py line 125 in debug mode
	
	
    runVTR(arch_file, circuit_loc, pins_file, run_dir, vpr_disp)    
    parseNet('%s/%s.net'%(run_dir, circuit_name))
    parsePlace('%s/%s.place'%(run_dir, circuit_name))
    #pdb.set_trace()
    if (pins_file):  
	parsePads(pins_file)
    parseRoute('%s/%s.route'%(run_dir, circuit_name))  #also generates global interconnect switch list
    #pdb.set_trace()
    genLISwcs()
    #pdb.set_trace()
    ##genLocalInterconnectSwcs()      #have to parse everything before generating LI swcs
    printSwcs('%s/%s.swcs'%(run_dir, circuit_name))
    saveCaps('%s/%s.caps'%(run_dir, circuit_name))
    
    
#******* DEbug statements
    #print xarray
    #xarray.getSub(2,1).printSubs()
    #xarray.getSub(2,1).dispLI()    
    #xarray.getSub(1,1).dispLI()
    #xarray.getSub(1,1).genDevFgs()
    #xarray.getSub(2,1).genDevFgs()
    
    #xarray.getSub(1,0).printSubs()
    #xarray.getSub(1,0).genLI()
    #xarray.getSub(1,0).genDevFgs()
        
#    for i in s0:
#        print '%g %g'%(i[0], i[1])
    
    #print 'dealn with it... '
    #pdb.set_trace()
    
def runVTR(arch_file, circuit, pins_file, run_dir, vpr_disp):
    DEBUG = 0
    vpr_loc = '/home/ubuntu/rasp30/vtr_release/vpr/vpr'
    chan_width = 17
    
    circuit_name = circuit.split('/')[-1]
    
    net_file   = '%s/%s.net'%(run_dir, circuit_name)
    place_file = '%s/%s.place'%(run_dir, circuit_name)
    route_file = '%s/%s.route'%(run_dir, circuit_name)
    
    if fix_cab>0:
	exec_str = '%s %s -route %s '\
        %(vpr_loc, arch_file, circuit)
    else:
	exec_str = '%s %s %s -net_file %s -place_file %s -route_file %s '\
        %(vpr_loc, arch_file, circuit, net_file, place_file, route_file )
        
    if chan_width > 0: exec_str = exec_str + ' -route_chan_width %g'%(chan_width)
    if pins_file and fix_cab==0:                            
        #exec_str = exec_str + ' -fix_pins %s.pads'%(circuit)
        exec_str = exec_str + ' -fix_pins %s'%(pins_file)   
    if vpr_disp == 0: exec_str = exec_str + ' -nodisp'
    if ff_custom >0: exec_str= exec_str + ' -timing_analysis off' #Michelle added on
    
    #exec_str= exec_str + ' -place_algorithm net_timing_driven -seed 20' #Michelle added this line
    
    print exec_str
    if not DEBUG: call(exec_str.split())

def genLISwcs():
    global ladder_blk
    #pdb.set_trace()
    for i in range(len(xarray.array)):
        for j in range(len(xarray.array[0])):
            csub = xarray.getSub(i,j)
	    #print "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
	    #print csub.type
#	    if csub.type in ['CAB'] and ladder_blk==1: 
#		pdb.set_trace();
#		csub.dev_pins={'fgota':3,'ladder_blk':3,'cap':2, 'nfet':3, 'pfet':3, 'tgate':3, 'nmirror':2} 
#		csub.dev_types =['fgota']*2 + ['ladder_blk']*1 + ['cap']*4 + ['nfet']*2 + ['pfet']*2 + ['tgate']*4 +['nmirror']*2
#	    a=5
	    a=5
	    #pdb.set_trace();
	    if csub.type in ['CAB','CLB','CAB2','CAB_VMM']:
		#pdb.set_trace()
		csub.genLI()
                csub.genDevFgs()
                swcs.extend(csub.swcs)
	    #pdb.set_trace();
            if csub.type in ['ioblock']:
		#pdb.set_trace()
		csub.genLI()
		csub.genDevFgs()  
		swcs.extend(csub.swcs)  
#                for k in csub.swcs:
#                    print '%g %g'%(k[0],k[1])
#                    if k == [7, 50]:
#                        pdb.set_trace()
                                
   
def genLocalInterconnectSwcs():

    #not sure how to do this in one pass
    # these two passes are for IO BLOCKS
    pin_types = dict()
    for block_name in pblocks.keys():
        block = pblocks[block_name]
        grid_loc  = block['grid_loc']
        tile_type = getTileType('CHANX', grid_loc)        
        if tile_type[:2] == 'io':
            pin_types[block_name] = block['io type']
    
    for block_name in pblocks.keys():
        block = pblocks[block_name]        
        grid_loc  = block['grid_loc']
        tile_type = getTileType('CHANX', grid_loc)
        tile_loc  = getTileLoc('CHANX', grid_loc)
        
        print '~~~~~ LI for BLOCK: %s %s (%s %s) ~~~~~~'%(block_name, tile_type, grid_loc[0], grid_loc[1])
        if tile_type[:2] == 'io':
            pin_nums = block['pin reorder']
            if pin_nums.keys() != []:
                for pin_block_name in pin_nums.keys():
                    if pin_block_name in pin_types.keys():
                        pin_type = pin_types[pin_block_name]
                    else:
                        pin_type = pin_types['out:'+pin_block_name]
                    pin_num = pin_nums[pin_block_name]
                    #just have to connect pin_type to pin_num on tile_loc
                    print tile_type, tile_loc, pin_block_name, pin_num, pin_type,     
                    
                    pin_name = array[tile_type]['pin names'][int(pin_num)]                
                    
                    if 'buffer interconnect' in array[tile_type].keys():
                        
                        cur_swcs = array[tile_type]['buffer interconnect'][pin_type]
                        for i in range(len(cur_swcs)):
                            swc = getTileOffset(cur_swcs[i], tile_loc)
                            swcs.append(swc)
                            print swc,         
                            
                    if 'local interconnect' in array[tile_type].keys():
                        if pin_type in     array[tile_type]['local interconnect']:
                            sub_swc1 = array[tile_type]['local interconnect'][pin_type]
                            sub_swc2 = array[tile_type]['local interconnect'][pin_name]
                            swc = [sub_swc1[0]+sub_swc2[0], sub_swc1[1]+sub_swc2[1]]
                            swc = getTileOffset(swc, tile_loc)
                            swcs.append(swc)
                            print swc,
                                     
                    print
        if tile_type == 'cab':
            #local interconnect for cab device inputs and cab outputs
            for subblock in block['subblocks']:
                dev_name = subblock['instance']                
                inputs = subblock['rinputs'] #inputs = subblock['inputs']
                outputs = subblock['outputs'].strip()
                
                #input local interconnect switches for current dev
                input_num = 0
                for inputx in inputs:
                    
                    #NOW DOING THAT IN REFORMDATA()
                    #need to find input reorder only for cab input/output pins
                    #if inputx[:3] == 'cab':
                    #    cab_input_num = int(inputx.split('[')[1].split(']')[0])        #get cab inputnumber             
                    #    cab_input_net = block['inputs'].split()[cab_input_num]     #get net name                     
                    #    cab_input_renum = block['pin reorder'][cab_input_net]     #get input reorder 
                    #
                    #    inputx = inputx.split('[')[0] + '[' + cab_input_renum + ']'
                    
                    swc0_name = inputx                                #dev input name
                    swc1_name = "%s.in[%s]"%(dev_name,input_num)    #dev input number
                    input_num = input_num + 1
                    
                    swc0 = array[tile_type]['local interconnect'][swc0_name]
                    swc1 = array[tile_type]['local interconnect'][swc1_name]
                    swc = [swc0[0] + swc1[0], swc0[1] + swc1[1]] 

                    print '%s --> %s (%g %g)'%(swc0_name, swc1_name, swc[0], swc[1])
                    
                #output local interconnect switches for current dev
                swc0_name = "%s.out[0]"%(dev_name)
                swc1_name = 'cab.O[%s]'%(block['outputs'].index(outputs))
                swc0 = array[tile_type]['local interconnect'][swc0_name]
                swc1 = array[tile_type]['local interconnect'][swc1_name]
                print '%s --> %s (%g %g)'%(swc0_name, swc1_name, swc[0], swc[1])
    
    print ' '         
    #pdb.set_trace()
                                                                
def printSwcs(file_name):
      
    
  f = open(file_name, 'w')  
  for i in range(-1,len(swcs)-1): 
##########

	if swcs[i+1][1] in range(0x281,0x28F)+range(0x291,0x29F)+range(0x2A1,0x2AF)+range(0x2B1,0x2BF)+range(0x2C1,0x2CF)+range(0x2D1,0x2DF)+range(0x2E1,0x2EF)+range(0x2F1,0x2FF)+range(0x301,0x30F)+range(0x311,0x31F)+range(0x321,0x32F)+range(0x331,0x33F)+range(0x341,0x34F)+range(0x351,0x35F)+range(0x361,0x36F)+range(0x371,0x37F):
		swcs[i+1].append(1);
		swcs[i+1].append(0);
        if swcs[i+1][0] in [22,25,26,29,30,33,102+22,102+25,102+26,102+29,102+30,102+33,136+22,136+25,136+26,136+29,136+30,136+33,238+22,238+25,238+26,238+29,238+30,238+33,272+22,272+25,272+26,272+29,272+30,272+33,374+22,374+25,374+26,374+29,374+30,374+33,408+22,408+25,408+26,408+29,408+30,408+33] and swcs[i+1][1] not in [272,288,304,320,336,352,368,384,400,416,432,448]:
		swcs[i+1].append(2); 
		swcs[i+1].append(0);
	else:
		swcs[i+1].append(0); 
		swcs[i+1].append(0);
	#print a       
    	print '%s'%swcs[i+1]  
	f.write('%s %s %s %s'%(swcs[i+1][0],swcs[i+1][1],swcs[i+1][2],swcs[i+1][3] ) + '\n')
    
##########################
# USE IF USING C-CODE
##########################
def printSwcs2(file_name):
      
    row_str =  'unsigned int row[] = {%s'%swcs[0][0]
    for i in range(len(swcs)-1):        
        row_str = row_str + ',%s'%swcs[i+1][0]
    row_str = row_str + '};'

    col_str =  'unsigned int col[] = {%s'%swcs[0][1]
    for i in range(len(swcs)-1):        
        col_str = col_str + ',%s'%swcs[i+1][1]
    col_str = col_str + '};'
    
    num_str = 'unsigned int prog_list_size = %s;'%len(swcs) 
    
    rev_cols = []
    for i in range(len(swcs)):
        rev_cols.append(swcs[i][1])
    rev_cols = list(set(rev_cols))
    
    rev_str = 'unsigned int col_revtun[] = {%s'%rev_cols[0]
    for i in range(len(rev_cols)-1):
        rev_str = rev_str + ',%s'%rev_cols[i+1]
    rev_str = rev_str + '};'
    
    rev_num = 'unsigned int revtun_list_size = %s;'%len(rev_cols)
    
    print row_str
    print col_str
    print num_str
    print rev_str
    print rev_num
    
    f = open(file_name, 'w')
    f.write(row_str + '\n')
    f.write(col_str + '\n')
    f.write(num_str + '\n')
    f.write(rev_str + '\n')
    f.write(rev_num + '\n')
    
def saveCaps(file_name):
	
	cap_nams.pop(0)
	cap_vals.pop(0)
	f = open(file_name, 'w')
	
	for i in range(0,len(cap_nams)):
		f.write('%s, %.3e'%(cap_nams[i].strip('()'), cap_vals[i]) + '\n')

def getTileOffset(swc, block):
    #block = tile_loc
    
    DEBUG = 0

    if DEBUG:
        return swc
    else:
        return arrayStats_used().getTileOffset(swc, block)
        #return [swc[0]+array['x offsets'][x], swc[1]*2**4+array['y offsets'][y]] #kludge / hardcoded 2**4 part, fix this!

def getSwcSswitch(direction, track, grid_loc, net_name):
    VERBOSE = 1
    #print "S block check"
    if cap_nams[-1] != net_name:
        cap_nams.append(net_name)
        cap_vals.append(38e-15)
    else:
        cap_vals[-1] = cap_vals[-1]+38e-15
	if cap_seq[-1] == 2:
	    cap_vals[-1] = cap_vals[-1]+160e-15
	
	cap_seq.append(2)
	#print cap_vals[-1], cap_seq	
	#block_type = getBlockType(block)
    tile_type = getTileType('SBLOCK', grid_loc)
    tile_loc  = getTileLoc('SBLOCK', grid_loc)
    
    #if tile_type=="io_el":
     #	pdb.set_trace()
    
    #get direction partial switch
    #sub_swc1 = array[tile_type]['SBLOCK'][direction]
    sub_swc1 = chipStats().get(tile_type).get('sblock')[direction]
    
    #get track partial switch
    track_name = 'T' + track
    #sub_swc2 = array[tile_type]['SBLOCK'][track_name]
    sub_swc2 = chipStats().get(tile_type).get('sblock')[track_name]
    
    #switch address based on direction then adding a track based offset
    swc = [sub_swc1[0] + sub_swc2[0], sub_swc1[1] + sub_swc2[1]]

    #add block offset
    swc = getTileOffset(swc, tile_loc)
     
    if VERBOSE==1 or VERBOSE>1:        
        print '%s [%s,%s] SBLOCK %s (%s %s)' % (tile_type, 
            str(tile_loc[0]).rjust(2), str(tile_loc[1]).rjust(2),
            direction,        
            str(swc[0]), str(swc[1])),
    if VERBOSE>1 :
	print '%s %s %s' % (tile_loc,grid_loc,tile_type)
    return swc
#&&&&&&&&&&&&&&&&&
# C-block switch generation
#&&&&&&&&&&&&&&&&&
def getSwcCblock(pin_num, pin_grid_loc, cblock_type, track, cblock_grid_loc, net_name, c_outin):
    if cap_nams[-1] != net_name:
        cap_nams.append(net_name)
        cap_vals.append(160e-15)
    elif cap_nams[-1] == net_name and c_outin == 0:
        cap_vals[-1] = cap_vals[-1]+160e-15
        
    cap_seq.append(1)
    #print cap_vals[-1], cap_seq	
    #getSwcCblock(pin_num, pin_block, block_type, track, block_location)
    VERBOSE = 1 #0,1,2
    VERBOSE2=1
    #cblock location and tile type
    cblock_tile_type = getTileType(cblock_type, cblock_grid_loc)  #where the CBLOCK is
    cblock_tile_loc  =  getTileLoc(cblock_type, cblock_grid_loc)  #where the CBLOCK is

    #pin location and tile type -- pin loc independent of block type
    pin_tile_type = getTileType('CHANX', pin_grid_loc) #where the pin (source or sink) is WAS HARDCODED TO CHANX before::
    pin_tile_loc  =  getTileLoc(cblock_type, pin_grid_loc)

    if VERBOSE2>1 :
	print "@@***********" 
	print "pin_tile_loc :%s"  %(pin_tile_loc)
	print "pin_tile_type :%s"  %(pin_tile_type)
    	print "cblock_tile_loc: %s" %(cblock_tile_loc)
    	print "cblock_grid_loc:"+str(cblock_grid_loc)
    	print "cblock_tile_type:"+str(cblock_tile_type)
    #get net 1 name : pin name
    pin_num = int(pin_num)  
    #pin_name = array[pin_tile_type]['pin names'][pin_num] !!
    #if cblock_tile_type == 'cab2':
    #pdb.set_trace()
    #if cblock_tile_type == 'io_e':
    #	pdb.set_trace()
    #if pin_tile_type== 'io_e':
	#pdb.set_trace()
	#	if pin_num==1:
	#		pin_num=1	
	#	else:
	#		pin_num=pin_num*3 ##super--kludge$$
 	#   	pin_name = chipStats().get(pin_tile_type).pin_order[pin_num]
  	#  else:
    pin_name = chipStats().get(pin_tile_type).pin_order[pin_num]
    #pdb.set_trace()
    ##major change for external case:
    #if cblock_tile_loc != pin_tile_loc: 
    #    pin_name = 'X' + pin_name
    
    if rasp3a == 0:
		if cblock_tile_type == 'io_e':
			print "**"
			#pdb.set_trace()
		
		# A-A and D-D case
		elif cblock_grid_loc[0] in [3,5,7,9,11] and cblock_tile_loc != pin_tile_loc and (pin_tile_loc[0]-cblock_tile_loc[0] !=1) and cblock_type=='CHANY':
			if pin_name[0] != 'X':
				#pdb.set_trace()
				print "lala-land"
		#elif cblock_tile_type[:2] =="io":
		#print "IO BLOCK"	
		elif cblock_tile_type != pin_tile_type: 
			pin_name = 'X' + pin_name
			if pin_tile_type=='clb' and cblock_tile_type in ['cab','cab2','cab_vmm']:
				pin_name='D'+pin_name
			elif pin_tile_type in ['cab','cab2','cab_vmm'] and cblock_tile_type in ['clb']:
				pin_name='A'+pin_name
		elif cblock_tile_loc != pin_tile_loc:
			pin_name = 'X' + pin_name
		##we need to add X for C-blocks in ## super--kludge$$ might not need it anymore
		elif cblock_grid_loc[0] in [5,9,12] and cblock_tile_type in ['cab','cab2','cab_vmm'] :
			if pin_name[0] != 'X':
			   pin_name ='X' + pin_name
			print "lala-land"
		#pdb.set_trace()
		elif cblock_grid_loc[0] in [0,3,7,11] and cblock_tile_type== 'clb' :
			if pin_name[0] != 'X':
				pin_name = 'X' + pin_name
			print "lala-land2"
			#pdb.set_trace()
    elif rasp3a == 1:
		if cblock_tile_type == 'io_e':
			print "yeehaaa!"
		elif cblock_tile_type != pin_tile_type: 
			pin_name = 'X' + pin_name
			if pin_tile_type=='clb' and cblock_tile_type in ['cab','cab2','cab_vmm']:
				pin_name='D'+pin_name
			elif pin_tile_type in ['cab','cab2','cab_vmm'] and cblock_tile_type in ['clb']:
				pin_name='A'+pin_name
		elif cblock_grid_loc[0] in [0,2,4,6] and cblock_tile_type in ['cab','cab2','cab_vmm'] :
			if pin_name[0] != 'X':
			   pin_name ='X' + pin_name
			print "lala-land"
		elif cblock_tile_loc != pin_tile_loc:
			pin_name = 'X' + pin_name
		#	
		#pdb.set_trace()
		elif cblock_grid_loc[0] in [1,3,5] and cblock_tile_type== 'clb' :
			if pin_name[0] != 'X':
				pin_name = 'X' + pin_name
			print "lala-land2"
			#pdb.set_trace()
    #get net 2 name : track name
    track_name = 'T' + track
    
    #switch address is bassed on a crossbar network, pick location that
    # corresponds to net1 on one side and net2 on the other
    #sub_swc1 = array[cblock_tile_type][cblock_type][track_name]
    try:
        sub_swc1 = chipStats().get(cblock_tile_type).get(cblock_type)[track_name]
    except:
        pdb.set_trace()
    #sub_swc2 = array[cblock_tile_type][cblock_type][pin_name]
    if VERBOSE2>1 :print "!!***********" 
    if VERBOSE2>1 :print pin_name
    if VERBOSE2>1 :print cblock_type 
    if VERBOSE2>1 :print cblock_tile_type
    #pdb.set_trace()
    try:
    	sub_swc2 = chipStats().get(cblock_tile_type).get(cblock_type)[pin_name]
    except:
	pdb.set_trace()
    swc = [sub_swc1[0] + sub_swc2[0], sub_swc1[1] + sub_swc2[1]]
    
    #add block offset
    swc = getTileOffset(swc, cblock_tile_loc)
    
    if VERBOSE:
        print "%s [%s,%s] %s  (%s,%s) %s %s" % (cblock_tile_type.rjust(4), 
            str(cblock_tile_loc[0]).rjust(2), str(cblock_tile_loc[1]).rjust(2), cblock_type,  
            str(swc[0]), str(swc[1]), track_name, pin_name), 

    if VERBOSE > 1:
        print "CBLOCK swc: ",
        print cblock_type + ' <--> ' + pin_tile_type + ' ' ,
        print cblock_type + ' in ' + str(cblock_grid_loc[0]) + ' ' + str(cblock_grid_loc[1]) ,
        print 'on TRACK ' + str(track) + ' to pin ' + str(pin_num) ,
        print 'in block ' + str(pin_grid_loc[0]) + ' ' + str(pin_grid_loc[1]),

    return swc
    
def getBlockName(grid_loc):
    for block_name in pblocks.keys():
        block = pblocks[block_name]
        if block['grid_loc'] == grid_loc or block['grid_loc'] == [str(grid_loc[0]), str(grid_loc[1])]:
            return block_name
    return 'not found'

def getTileType(block_type, grid_loc):
    #returns: cab, cab2, clb, io_w, io_e, io_n, io_s, or tile_se

    tile_loc = getTileLoc(block_type, grid_loc) #&&&
    #return array['pattern'][int(tile_loc[0])][int(tile_loc[1])]
    return arrayStats_used.pattern[int(tile_loc[0])][int(tile_loc[1])]

def getTileLoc(block_type, grid_loc):
    #this translates the vpr grid location to a physical schematic tile location
    #returns tile_loc [x,y]
    #ex. getTileLoc('CHANY',[1,1]) -> [0,1]
    #ex. getTileLoc('CHANX',[1,1]) -> [1,1]

    #tile_loc = list(grid_loc)	
    tile_loc = [int(grid_loc[0]), int(grid_loc[1])]
    if block_type in ['CHANY','SBLOCK']: #and tile_loc[0] != 0: ## removed CHANY and SBLOCK as option
       tile_loc[0] = tile_loc[0] + 1 #&&& should be +1 dodo ...hmmm

    return tile_loc

def parseNet(file_name):
    xmlData = etree.parse(file_name)
    blocks = xmlData.findall("block") #first level
    verbose=0
	
    for block in blocks:        
        block_name = block.attrib["name"]
        block_type = block.attrib['mode']

        input_str = block.findall('inputs')[0].findall('port')[0].text
        inputs = input_str.split()
        
        output_str = block.findall('outputs')[0].findall('port')[0].text
        outputs = output_str.replace('->crossbar', ' ').split()
        
#        nb = complexBlock(block_name, block_type)
        if block_type == 'cab':
            nb = cab(block_name)
        elif block_type == 'clb':
            nb = clb(block_name)
	elif block_type == 'cab2':
            nb = cab2(block_name)
	elif block_type == 'cab_vmm':
            nb = cab_vmm(block_name)
        else:
            nb = complexBlock(block_name, block_type)
            
        nb.inputs = inputs      
        #pdb.set_trace()
        #if block.attrib["mode"] in ['cab2', 'cab', 'clb']:    
        if block_type in ['cab', 'clb', 'cab2','cab_vmm']:  
        
# add if counter8
# make ble[0] then variable containing ble[1-7]
# for each ble make a kk list of clb.dev_fgs for counter support
# run through similar switch generation as normal lut/ff
        
            #pdb.set_trace()
            #start adding subblocks to block
            #only getting subblock type, position, and output name
            #will update input names later
            counter_flag = 0
            subblocks = block.findall("block")
            for subblock in subblocks:                
                sub_outputs = subblock.attrib["name"]
                sub_inst = subblock.attrib["instance"]  
                if (sub_inst[:-3] == 'counter8') & (sub_outputs != 'open'):
                    counter_flag = 1
                    #pdb.set_trace()
                    for blenum in range(8):
						sub_output = subblock.findall("outputs")[0].findall("port")[0].text
						sub_output = sub_output.split(" ")
						sub_output = sub_output[blenum]
						sub_inst = 'ble['
						sub_inst += str(blenum)
						sub_inst += ']'
						print(sub_output)
						print(sub_inst)
						if blenum == 0:
							cover = ['ff_in', 'ff_out','res_g']
						else:
							cover = ['ff_in', 'clk_a', 'ff_out','res_g']
						nsb = pblock(sub_inst, 'lut')
						#pdb.set_trace()						
						nsb.ex_fgs = cover	
						nsb.inputs_orig = ['temp']
						nsb.inputs = ['temp']
						nsb.outputs = ['temp']
						nb.addSub(nsb, sub_inst)
                    #pdb.set_trace()
                #pdb.set_trace()
                elif sub_outputs != "open": 
                    sub_input_str  = subblock.findall("inputs")[0].findall("port")[0].text
                    sub_inputs = sub_input_str.replace('->crossbar', ' ').split()
                    #print "@@@@@@@@@"
		    #print sub_input_str
		    #pdb.set_trace()
                    #special handling for BLEs / LUTs.  grabbing cover
                    if sub_inst[:3] == 'ble':
                        sub3blks=subblock.findall('block')
                        for sub3blk in sub3blks:
							sub3_inst = sub3blk.attrib["instance"] 
							sub3_outputs = sub3blk.attrib["name"]                        
							#pdb.set_trace()
							if sub3_inst[:-3] =='soft_logic': ##can't use the latch standalone
								#pdb.set_trace() 
								cover = luts[sub3_outputs].cover     #index luts by name == output
								nsb = pblock(sub_inst, 'lut')
								nsb.ex_fgs = cover                   #LUT cover comes from blif parsing
								nsb.inputs_orig = luts[sub3_outputs].inputs
                        #pdb.set_trace()	
                        mux_use = subblock.findall('outputs')[0].findall('port')[0].text[0:2]
                        if mux_use == 'ff':
							nsb.ex_fgs.append('res_g')
                                                        nsb.ex_fgs.append('ff_out') # add flip flop covers
							#pdb.set_trace()
							sub_outputs = subblock.findall('block')[2].attrib["name"]						
                    else:
                        nsb = pblock(sub_inst, '%s_dev'%block_type)
                        if sub_outputs in ex_fgs_dict.keys(): 
                            nsb.ex_fgs = ex_fgs_dict[sub_outputs]
                            #if (nsb.ex_fgs).split('=')[0]== 'ota_biasfb': ##questionable!! ok resolved
			    #	sub_inputs[1]='open'
                    if nsb.name =="SR4[0]":
			sub_outputs=subblock.findall("outputs")[0].findall("port")[0].text.split()
		    if nsb.name =="vmm4x4[0]":
			sub_outputs=subblock.findall("outputs")[0].findall("port")[0].text.split()
