/*---------------------------------------------------------------------------*/
/*                       chip parameters for chip 10                         */ 
/*---------------------------------------------------------------------------*/
/*----------------*/
/* Switch program */
/*----------------*/
.set    TUN_TIME_SP,     3          /* tunneling time for switch programming (ms) */
.set    R_TUN_TIME_SP,     2          /* reverse tunneling time for switch programming (ms) */
.set    INJ_TIME_SP_1,     500          /* injection time for switch programming (ms) (1st pulse)*/

/*----------------*/
/* Target program */
/*----------------*/
.set    ADC_1nA,    4496          /* 1nA ADC value */

/* Tunnel and Reverse Tunnel */
.set    TUN_TIME_TP_CAB,     40          /* tunneling time for target programming (ms) - CAB */
.set    R_TUN_TIME_TP_CAB,   40          /* Reverse tunneling time for target programming (ms) - CAB */

/* Recover Inject (RI) */
.set    RI_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC recover injection = gnd */
.set    RI_VC1_SWC,     5931          /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_SWC,     5788          /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
.set    RI_VC3_SWC,     5357           /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
.set    RI_VC4_SWC,     4496           /* Verify Current 1 for SWC recover injection = 1nA @ Vgm=0V */
.set    RI_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_OTA,     6732           /* Verify Current 1 for OTA recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTA,     6508          /* Verify Current 1 for OTA recover injection =  nA @ Vgm=0V */
.set    RI_VC3_OTA,     5837           /* Verify Current 1 for OTA recover injection = nA @ Vgm=0V */
.set    RI_VC4_OTA,     4496           /* Verify Current 1 for OTA recover injection = 5nA @ Vgm=0V */
.set    RI_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF recover injection = gnd */
.set    RI_VC1_OTAREF,  6135              /* Verify Current 1 for OTAREF recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTAREF,  5972             /* Verify Current 1 for OTAREF recover injection = nA @ Vgm=0V */
.set    RI_VC3_OTAREF,  5480              /* Verify Current 1 for OTAREF recover injection = nA @ Vgm=0V */
.set    RI_VC4_OTAREF,  4496              /* Verify Current 1 for OTAREF recover injection = 1nA @ Vgm=0V */
.set    RI_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_MITE,    7035           /* Verify Current 1 for MITE recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_MITE,    6781           /* Verify Current 1 for MITE recover injection =  nA @ Vgm=0V */
.set    RI_VC3_MITE,    6020            /* Verify Current 1 for MITE recover injection = nA @ Vgm=0V */
.set    RI_VC4_MITE,    4496            /* Verify Current 1 for MITE recover injection = 1nA @ Vgm=0V */

.set    RIL_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC low sub Vth recover injection = gnd */
.set    RIL_VC1_SWC,     4496          /* Verify Current 1 for SWC low sub Vth recover injection = 1nA @ Vgm = 0V */ 
.set    RIL_VC2_SWC,     4163          /* Verify Current 1 for SWC low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */
.set    RIL_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA low sub Vth recover injection = 2.5V @ IVDD 6.0V */
;.set    RIL_GATE_S_OTA,    0x2b00          /* Gate_S voltage for OTA low sub Vth recover injection = 3.1V @ IVDD 6.0V */
.set    RIL_VC1_OTA,     4496           /* Verify Current 1 for OTA low sub Vth recover injection = 1nA @ Vgm=0V */ 
.set    RIL_VC2_OTA,     4171          /* Verify Current 1 for OTA low sub Vth recover injection =  hundreds pA below 1nA @ Vgm=0V */
.set    RIL_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF low sub Vth recover injection = gnd */
.set    RIL_VC1_OTAREF,  4496              /* Verify Current 1 for OTAREF low sub Vth recover injection = 1nA @ Vgm=0V */
.set    RIL_VC2_OTAREF,  4174             /* Verify Current 1 for OTAREF low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */
.set    RIL_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE low sub Vth recover injection = 2.5V @ IVDD 6.0V */
.set    RIL_VC1_MITE,    4496           /* Verify Current 1 for MITE low sub Vth recover injection = 1nA @ Vgm=0V */  
.set    RIL_VC2_MITE,    4185           /* Verify Current 1 for MITE rlow sub Vth ecover injection =  hundreds pA below 1nA @ Vgm=0V */

/* First_Coarse_Program (FCP) */
.set    FCP_GATE_S_SWC,    0x5800          /* Gate_S voltage for SWC first coarese program = V @ IVDD 6.0V */
.set    FCP_INJ_T_SWC,    1          /* Injection time for SWC first coarese program = *10us */
.set    FCP_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA first coarese program = V @ IVDD 6.0V */
.set    FCP_INJ_T_OTA,    3          /* Injection time for OTA first coarese program = *10us */
.set    FCP_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF first coarese program = V @ IVDD 6.0V */
.set    FCP_INJ_T_OTAREF,    6          /* Injection time for OTAREF first coarese program = *10us */
.set    FCP_GATE_S_MITE,    0x4a00          /* Gate_S voltage for MITE first coarese program = V @ IVDD 6.0V */
.set    FCP_INJ_T_MITE,    3          /* Injection time for MITE first coarese program = *10us */

.set    FCPL_GATE_S_SWC,    0x4400          /* Gate_S voltage for SWC low sub Vth first coarese program = V @ IVDD 6.0V */
.set    FCPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth first coarese program = *10us */
.set    FCPL_GATE_S_OTA,    0x3200          /* Gate_S voltage for OTA low sub Vth first coarese program = V @ IVDD 6.0V */
.set    FCPL_INJ_T_OTA,    3          /* Injection time for OTA low sub Vth first coarese program = *10us */
.set    FCPL_GATE_S_OTAREF,    0x3400          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = V @ IVDD 6.0V */
.set    FCPL_INJ_T_OTAREF,    6          /* Injection time for OTAREF low sub Vth measured coarse program = *10us */
.set    FCPL_GATE_S_MITE,    0x3200          /* Gate_S voltage for MITE low sub Vth first coarese program = V @ IVDD 6.0V */
.set    FCPL_INJ_T_MITE,    3          /* Injection time for MITE low sub Vth first coarese program = *10us */

/* Measured_Coarse_Program (MCP) */
.set    MCPS_GATE_S_SWC,    0x5800          /* Gate_S voltage for SWC sub Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPS_INJ_T_SWC,    1          /* Injection time for SWC sub Vth measured coarse program = *10us */
.set    MCPS_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA sub Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPS_INJ_T_OTA,    3          /* Injection time for OTA sub Vth measured coarse program = *10us */
.set    MCPS_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF sub Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPS_INJ_T_OTAREF,    6          /* Injection time for OTAREF sub Vth measured coarse program = *10us */
.set    MCPS_GATE_S_MITE,    0x4a00          /* Gate_S voltage for MITE sub Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPS_INJ_T_MITE,    3          /* Injection time for MITE sub Vth measured coarse program = *10us */

.set    MCPA_GATE_S_SWC,    0x5800          /* Gate_S voltage for SWC above Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPA_INJ_T_SWC,    1          /* Injection time for SWC above Vth measured coarse program = *10us */
.set    MCPA_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA above Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPA_INJ_T_OTA,   3           /* Injection time for OTA above Vth measured coarse program = *10us */
.set    MCPA_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF above Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPA_INJ_T_OTAREF,    6          /* Injection time for OTAREF above Vth measured coarse program = *10us */
.set    MCPA_GATE_S_MITE,    0x4a00          /* Gate_S voltage for MITE above Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPA_INJ_T_MITE,    3          /* Injection time for MITE above Vth measured coarse program = *10us */

.set    MCPL_GATE_S_SWC,    0x4400          /* Gate_S voltage for SWC low sub Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth measured coarse program = *10us */
.set    MCPL_GATE_S_OTA,    0x3200          /* Gate_S voltage for OTA low sub Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPL_INJ_T_OTA,    3          /* Injection time for OTA low sub Vth measured coarse program = *10us */
.set    MCPL_GATE_S_OTAREF,    0x3400          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPL_INJ_T_OTAREF,    6          /* Injection time for OTAREF low sub Vth measured coarse program = *10us */
.set    MCPL_GATE_S_MITE,    0x3200          /* Gate_S voltage for MITE low sub Vth measured coarse program = V @ IVDD 6.0V */
.set    MCPL_INJ_T_MITE,    3          /* Injection time for MITE low sub Vth measured coarse program = *10us */

/* Fine_Program (FP) */
.set    FPS_GATE_S_SWC,    0x4600          /* Gate_S voltage for SWC sub Vth fine program = V @ IVDD 6.0V */
.set    FPS_INJ_T_SWC,    1          /* Injection time for SWC sub Vth fine program = *10us */
.set    FPS_GATE_S_OTA,    0x4600          /* Gate_S voltage for OTA sub Vth fine program = V @ IVDD 6.0V */
.set    FPS_INJ_T_OTA,    3          /* Injection time for OTA sub Vth fine program = *10us */
.set    FPS_GATE_S_OTAREF,    0x4400          /* Gate_S voltage for OTAREF sub Vth fine program = V @ IVDD 6.0V */
.set    FPS_INJ_T_OTAREF,    6          /* Injection time for OTAREF sub Vth fine program = *10us */
.set    FPS_GATE_S_MITE,    0x4600          /* Gate_S voltage for MITE sub Vth fine program = V @ IVDD 6.0V */
.set    FPS_INJ_T_MITE,    3          /* Injection time for MITE sub Vth fine program = *10us */

.set    FPA_GATE_S_SWC,    0x4800          /* Gate_S voltage for SWC above Vth fine program = V @ IVDD 6.0V */
.set    FPA_INJ_T_SWC,    1          /* Injection time for SWC above Vth fine program = *10us */
.set    FPA_GATE_S_OTA,    0x4000          /* Gate_S voltage for OTA above Vth fine program = V @ IVDD 6.0V */
.set    FPA_INJ_T_OTA,    3          /* Injection time for OTA above Vth fine program = *10us */
.set    FPA_GATE_S_OTAREF,    0x3e00          /* Gate_S voltage for OTAREF above Vth fine program = V @ IVDD 6.0V */
.set    FPA_INJ_T_OTAREF,    6          /* Injection time for OTAREF above Vth fine program = *10us */
.set    FPA_GATE_S_MITE,    0x4a00          /* Gate_S voltage for MITE above Vth fine program = V @ IVDD 6.0V */
.set    FPA_INJ_T_MITE,    3          /* Injection time for MITE above Vth fine program = *10us */

.set    FPL_GATE_S_SWC,    0x3c00          /* Gate_S voltage for SWC low sub Vth fine program = V @ IVDD 6.0V */
.set    FPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth fine program = *10us */
.set    FPL_GATE_S_OTA,    0x2c00          /* Gate_S voltage for OTA low sub Vth fine program = V @ IVDD 6.0V */
.set    FPL_INJ_T_OTA,    3          /* Injection time for OTA low sub Vth fine program = *10us */
.set    FPL_GATE_S_OTAREF,    0x3400          /* Gate_S voltage for OTAREF low sub Vth fine program = V @ IVDD 6.0V */
.set    FPL_INJ_T_OTAREF,    7          /* Injection time for OTAREF low sub Vth fine program = *10us */
.set    FPL_GATE_S_MITE,    0x2e00          /* Gate_S voltage for MITE low sub Vth fine program = V @ IVDD 6.0V */
.set    FPL_INJ_T_MITE,    3          /* Injection time for MITE low sub Vth fine program = *10us */

