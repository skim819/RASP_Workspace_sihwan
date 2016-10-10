import pdb
from genu import *
from rasp30 import *
class rasp30_vmm(stats):
    def __init__(self):
        self.array = arrayStats()
        self.cab = cabStats()
        self.cab_vmm = cab_vmmStats()
        self.cab2 = cab2Stats()
        self.clb = clbStats()
        self.io_sd = iosdStats()
        self.io_w = iowStats()
        self.io_sa = iosaStats()
        self.io_e = ioeStats()
	self.io_el = ioelStats()
        self.io_na= iosaStats()
##
## This should override previos definition of arrayStats which we use a lot
##
class arrayStats(stats):
    arch_file = './arch/rasp30.xml'
    pattern = [
            [    [], 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', 'io_w', []], 
            ['io_sd', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'io_nd'],
            ['io_sa', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'io_na'],
            ['io_sa', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'io_na'],
            ['io_sd', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'io_nd'],
            ['io_sd', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'io_nd'],
            ['io_sa', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'io_na'],
            ['io_sa', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'cab', 'io_na'],
            ['io_sd', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'io_nd'],
            ['io_sd', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'io_nd'],
            ['io_sa', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'io_na'],
            ['io_sa', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'cab_vmm', 'io_na'],
            ['io_sd', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'io_nd'],
            ['io_sd', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'clb', 'io_nd'],
            ['io_sa', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'cab2', 'io_na'],
            ['io_el', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e', 'io_e',[]]]
            
    def __init__(self):
        DEBUG = 0
        
        x_pattern = []
        for i in range(len(self.pattern)):
        	x_pattern.append(self.pattern[i][1])
        	
        y_pattern = self.pattern[1]
        
        if DEBUG:
        	for j in reversed(range(len(pattern))):
        		for i in range(len(pattern[j])):
        			print str(pattern[i][j]).rjust(6),
        		print

        #y offset is not higher order bits, but the lower bits
        #base addresses for y are the higher order bits
        #also we can't count the first clb
	#y offset:: col<3:0> while using in col 
        addrs = {'y':{'io_sd':1, 'clb':1, 'io_nd':0}, 'x':{'io_w':0, 'clb':34,'cab':34,'cab2':34, 'cab_vmm':34,'io_e':34}}
        
        self.x_offsets = [0]
        self.x_offsets.append(0) # this and the [2:] are to skip the first CLB
	#!!! check the x-offsets
        for x_type in x_pattern[2:]:
            self.x_offsets.append(self.x_offsets[-1] + addrs['x'][x_type])
        
        self.y_offsets = [0]
        for y_type in y_pattern[1:]:
            self.y_offsets.append(self.y_offsets[-1] + addrs['y'][y_type])
            
    def getTileOffset(self, swc, grid_loc):      
        
        DEBUG = 0
        x = grid_loc[0]
        y = grid_loc[1]
    	
	#pdb.set_trace()
        if DEBUG:
            return [999, 999]
        else:
	    # calculate the real column offset as some C-blocks are shifted
	    #print self.y_offsets[y]
	    #print swc[1]
	    #print 2**4
	    #print swc[1]*2**4
            return [swc[0]+self.x_offsets[x], swc[1]*2**4+self.y_offsets[y]] #kludge / hardcoded 2**4 part, fix this!

###########################################
#   CAB VMM stats 
###########################################   
class cab_vmmStats(stats):
    def __init__(self):
        global ladder_blk
	ladder_blk=0
        self.num_inputs = 16 # not accounting for si now
        self.num_outputs = 24
        # order is I[0:15] then si[0:3] O[0:7] so[0:12]  where si==O and so==I
        self.pin_order =['I0','I1','I2','I3','I4','I5','I6','I7','I8','I9','I10','I11','I12','I13','I14','I15','O0','O1','O2','O3','O0','O1','O2','O3','O4','O5','O6','O7','I0','I1','I2','I3','I4','I5','I6','I7','I8','I9','I10','I11']	
        #self.pin_order =['I0','I1','I2','I3','I4','I5','I6','I7','I8','I9','I10','I11','I12','I13','I14','I15','I0','I1','I2','I3','I4','I5','O0','O1','O0','O1','O2','O3','O4','O5','O6','O7']
	    #CHANX--C BLOCK ---y axis of adjacent CAB
	    # these are the decoder mapped addrs
	   	
        #chanx_sm = ['T[0:16]', [range(22,13,-1)+range(12,8,-1)+range(7,3,-1),0],### flipping chanx and chany ####
	chanx_sm = ['T[0:16]', [range(22,15,-1)+range(14,8,-1)+range(7,3,-1),0],
             'I8',   [ 0,36],     #pin names
             'I9',   [ 0,37],
             'I13',  [ 0,38],
             'I14',  [ 0,39],
	     'I15',  [ 0,40],
             'O4',   [ 0,41],
             'XI10', [ 0,42],
             'XI11', [ 0,43],
             'XI12', [ 0,44],
             'XO5',  [ 0,45],
             'XO6',  [ 0,46],
	     'XO7',  [ 0,47]]

        self.chanx = smDictFromList(chanx_sm, 'remBrak')
            
        # CHANY  --x axis block of original  
        #chany_sm = ['T[0:16]', [range(22,13,-1)+range(12,8,-1)+range(7,3,-1),0],
	chany_sm = ['T[0:16]', [range(22,15,-1)+range(14,8,-1)+range(7,3,-1),0],
            'I4',   [ 0,65],    #pin names
            'I5',   [ 0,66],
            'I6',   [ 0,67],
            'I7',   [ 0,68],
            'O2',   [ 0,69],
            'O3',   [ 0,70],
	    'XO0',  [ 0,63],
            'XO1',  [ 0,64],
            'XI0',  [ 0,59],
            'XI1',  [ 0,60],
            'XI2',  [ 0,61],## problem conflict
            'XI3',  [ 0,62],
            'DXI2', [ 0,65],#------to match w/ dif DIgital tile NAME BUT ANALOG TILE MAPPING
            'DXI6',  [ 0,66], #to match w/ dif tile
            'DXI10', [ 0,67],#to match w/ dif tile
	    'DXI14', [ 0,68],
            'DXO2',  [ 0,69],
	    'DXO6',  [ 0,70]]
			#'XO3',	[0,70]]  # $$ XO<0,4>??
        self.chany = smDictFromList(chany_sm, 'remBrak')
        
        # SBLOCK            
        #sb_sw = ['T[0:16]', [range(22,13,-1)+range(12,8,-1)+range(7,3,-1), 0],
	sb_sw = ['T[0:16]', [range(22,15,-1)+range(14,8,-1)+range(7,3,-1), 0],
            'we',   [ 0,54],#actual ns    #track direction (these are rotated 90deg ccw from schematic name: ww->W)
            'wn',   [ 0,51],#ne                     
            'ws',   [ 0,50],#nw                     
            'ns',   [ 0,52], #ew                     
            'ne',   [ 0,53],#es                     
            'es',   [ 0,49],                     
            'ew',   [ 0,54],#ns                     
            'nw',   [ 0,51],                     
            'sw',   [ 0,50],                     
            'sn',   [ 0,52],                     
            'en',   [ 0,53],                     
            'se',   [ 0,49]]    
        self.sblock = smDictFromList(sb_sw, 'remBrak')  
              
        #Local Interconnect
        li_sm_0a = ['gnd','vcc','cab_vmm.I[0:15]']
	# outputs order into the CAB for direct swcs
        #li_sm_0b = ['vmm16x16.out[0]','vmm2x2.out[0:1]']
	# defining the inputs order into the CAB #?? last term to connect i/ps to o/ps? for direct swcs
        #li_sm_1 = ['vmm16x16.in[0:15]','vmm2x2.in[0:1]','cab_vmm.O[0:5]'] 
        
    # outputs order into the CAB
