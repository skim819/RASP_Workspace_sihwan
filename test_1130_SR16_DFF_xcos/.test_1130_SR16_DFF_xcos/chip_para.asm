/*---------------------------------------------------------------------------*/
/*                       chip parameters for chip 02                         */ 
/*---------------------------------------------------------------------------*/
/*----------------*/
/* Switch program */
/*----------------*/
.set    TUN_TIME_SP,     3          /* tunneling time for switch programming (ms) */
.set    R_TUN_TIME_SP,     2          /* reverse tunneling time for switch programming (ms) */
.set    INJ_TIME_SP_1,     50000          /* injection time for switch programming (10us) (1st pulse)*/
.set    INJ_TIME_SP_2,     5000          /* injection time for switch programming (10us) (2nd pulse)*/
.set    INJ_TIME_SP_3,     100          /* injection time for switch programming (10us) (3rd pulse)*/
.set    INJ_TIME_SP_4,     100          /* injection time for switch programming (10us) (4th pulse)*/
.set    INJ_TIME_SP_5,     100          /* injection time for switch programming (10us) (5th pulse)*/
.set    INJ_TIME_SP_SUM,     553          /* injection time for switch programming (ms) (calculation time)*/
.set    INJ_TIME_SP_RUN,     500          /* injection time for switch programming in run-mode(10us)*/

/*----------------*/
/* Target program */
/*----------------*/
.set    ADC_1nA,    0x1190          /* 1nA ADC value */

/* Tunnel and Reverse Tunnel */
.set    TUN_TIME_TP_CAB,     40          /* tunneling time for target programming (ms) - CAB */
.set    R_TUN_TIME_TP_CAB,   40          /* Reverse tunneling time for target programming (ms) - CAB */

/* Recover Inject (RI) */
.set    RI_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC recover injection = gnd */
.set    RI_VC1_SWC,     0x177f          /* Verify Current 1 for SWC recover injection = 30nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_SWC,     0x16c6          /* Verify Current 1 for SWC recover injection = 20nA @ Vgm=0V */
.set    RI_VC3_SWC,     0x145c           /* Verify Current 1 for SWC recover injection = 5nA @ Vgm=0V */
.set    RI_VC4_SWC,     0x1190           /* Verify Current 1 for SWC recover injection = 1nA @ Vgm=0V */
.set    RI_VD1_SWC,     0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_SWC,     0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set    RI_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_OTA,     0x1a2f           /* Verify Current 1 for OTA recover injection = 129nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTA,     0x1976          /* Verify Current 1 for OTA recover injection =  88nA @ Vgm=0V */
.set    RI_VC3_OTA,     0x170c           /* Verify Current 1 for OTA recover injection = 23nA @ Vgm=0V */
.set    RI_VC4_OTA,     0x1440           /* Verify Current 1 for OTA recover injection = 5nA @ Vgm=0V */
.set    RI_VD1_OTA,     0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_OTA,     0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set    RI_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF recover injection = gnd */
.set    RI_VC1_OTAREF,  0x177f              /* Verify Current 1 for OTAREF recover injection = 30nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTAREF,  0x16c6             /* Verify Current 1 for OTAREF recover injection = 20nA @ Vgm=0V */
.set    RI_VC3_OTAREF,  0x145c              /* Verify Current 1 for OTAREF recover injection = 5nA @ Vgm=0V */
.set    RI_VC4_OTAREF,  0x1190              /* Verify Current 1 for OTAREF recover injection = 1nA @ Vgm=0V */
.set    RI_VD1_OTAREF,  0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_OTAREF,  0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set    RI_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_MITE,    0x1b2f           /* Verify Current 1 for MITE recover injection = 215nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_MITE,    0x1a76           /* Verify Current 1 for MITE recover injection =  149nA @ Vgm=0V */
.set    RI_VC3_MITE,    0x180c            /* Verify Current 1 for MITE recover injection = 41nA @ Vgm=0V */
.set    RI_VC4_MITE,    0x1540            /* Verify Current 1 for MITE recover injection = 8nA @ Vgm=0V */
.set    RI_VD1_MITE,    0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_MITE,    0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set    RI_GATE_S_DIRSWC,     0x0000          /* Gate_S voltage for SWC recover injection = 2.5V */
;.set    RI_GATE_S_DIRSWC,     0x0040          /* Gate_S voltage for SWC recover injection = gnd */
.set    RI_VC1_DIRSWC,     5970          /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_DIRSWC,     5822          /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
.set    RI_VC3_DIRSWC,     4779           /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
;.set    RI_VC3_DIRSWC,     5379           /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
.set    RI_VC4_DIRSWC,     4493           /* Verify Current 1 for SWC recover injection = 1nA @ Vgm=0V */
.set    RI_VD1_DIRSWC,     0xbe0e          /* Drain Voltage for recover injection final stage */
;.set    RI_VD1_DIRSWC,     0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_DIRSWC,     0xd00e          /* Drain Voltage for recover injection pre-final stage */
;.set    RI_VD2_DIRSWC,     0xfe0e          /* Drain Voltage for recover injection pre-final stage */

.set    RIL_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC low sub Vth recover injection = gnd */
.set    RIL_VC1_SWC,     0x1190          /* Verify Current 1 for SWC low sub Vth recover injection = 1nA @ Vgm = 0V */   /* ???? */
.set    RIL_VC2_SWC,     0x10d0          /* Verify Current 1 for SWC low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_SWC,     0xea0e          /* Drain Voltage for recover injection final stage */
.set    RIL_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA low sub Vth recover injection = 2.5V @ IVDD 6.0V */
.set    RIL_VC1_OTA,     0x1190           /* Verify Current 1 for OTA low sub Vth recover injection = 1nA @ Vgm=0V */     /* ???? */
.set    RIL_VC2_OTA,     0x1100          /* Verify Current 1 for OTA low sub Vth recover injection =  hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_OTA,     0xea0e          /* Drain Voltage for recover injection final stage */
.set    RIL_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF low sub Vth recover injection = gnd */
.set    RIL_VC1_OTAREF,  0x1190              /* Verify Current 1 for OTAREF low sub Vth recover injection = 1nA @ Vgm=0V */   /* ???? */
.set    RIL_VC2_OTAREF,  0x1100             /* Verify Current 1 for OTAREF low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_OTAREF,  0xea0e          /* Drain Voltage for recover injection final stage */
.set    RIL_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE low sub Vth recover injection = 2.5V @ IVDD 6.0V */
.set    RIL_VC1_MITE,    0x1190           /* Verify Current 1 for MITE low sub Vth recover injection = 1nA @ Vgm=0V */     /* ???? */
.set    RIL_VC2_MITE,    0x1100           /* Verify Current 1 for MITE rlow sub Vth ecover injection =  hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_MITE,    0xea0e          /* Drain Voltage for recover injection final stage */
.set    RIL_GATE_S_DIRSWC,     0x0040          /* Gate_S voltage for SWC low sub Vth recover injection = gnd */
.set    RIL_VC1_DIRSWC,     4493          /* Verify Current 1 for SWC low sub Vth recover injection = 1nA @ Vgm = 0V */   /* ???? */
.set    RIL_VC2_DIRSWC,     4383          /* Verify Current 1 for SWC low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_DIRSWC,     0xea0e          /* Drain Voltage for recover injection final stage */

/* First_Coarse_Program (FCP) */
.set    FCP_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC first coarese program = 3.5V @ IVDD 6.0V */
.set    FCP_INJ_T_SWC,    1          /* Injection time for SWC first coarese program = *10us */
.set    FCP_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA first coarese program = 3.4V @ IVDD 6.0V */
.set    FCP_INJ_T_OTA,    2          /* Injection time for OTA first coarese program = *10us */
.set    FCP_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF first coarese program = 3.4V @ IVDD 6.0V */
.set    FCP_INJ_T_OTAREF,    7          /* Injection time for OTAREF first coarese program = *10us */
.set    FCP_GATE_S_MITE,    0x4200          /* Gate_S voltage for MITE first coarese program = 3.3V @ IVDD 6.0V */
.set    FCP_INJ_T_MITE,    2          /* Injection time for MITE first coarese program = *10us */
.set    FCP_GATE_S_DIRSWC,    0x6200          /* Gate_S voltage for SWC first coarese program = 3.5V @ IVDD 6.0V */
.set    FCP_INJ_T_DIRSWC,    1          /* Injection time for SWC first coarese program = *10us */

.set    FCPL_GATE_S_SWC,    0x4000          /* Gate_S voltage for SWC low sub Vth first coarese program = 3.26V @ IVDD 6.0V */
.set    FCPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth first coarese program = *10us */
.set    FCPL_GATE_S_OTA,    0x3200          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.1V @ IVDD 6.0V */
.set    FCPL_INJ_T_OTA,    2          /* Injection time for OTA low sub Vth first coarese program = *10us */
.set    FCPL_GATE_S_OTAREF,    0x3200          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.1V @ IVDD 6.0V */
.set    FCPL_INJ_T_OTAREF,    7          /* Injection time for OTAREF low sub Vth measured coarse program = *10us */
.set    FCPL_GATE_S_MITE,    0x0900          /* Gate_S voltage for MITE low sub Vth first coarese program = 2.62V @ IVDD 6.0V */
.set    FCPL_INJ_T_MITE,    1          /* Injection time for MITE low sub Vth first coarese program = *10us */
.set    FCPL_GATE_S_DIRSWC,    0x4000          /* Gate_S voltage for SWC low sub Vth first coarese program = 3.26V @ IVDD 6.0V */
.set    FCPL_INJ_T_DIRSWC,    1          /* Injection time for SWC low sub Vth first coarese program = *10us */

/* Measured_Coarse_Program (MCP) */
.set    MCP_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC sub Vth measured coarse program = 3.5V @ IVDD 6.0V */
.set    MCP_INJ_T_SWC,    1          /* Injection time for SWC sub Vth measured coarse program = *10us */
.set    MCP_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA sub Vth measured coarse program = 3.4V @ IVDD 6.0V */
.set    MCP_INJ_T_OTA,    2          /* Injection time for OTA sub Vth measured coarse program = *10us */
.set    MCP_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF sub Vth measured coarse program = 3.4V @ IVDD 6.0V */
.set    MCP_INJ_T_OTAREF,    7          /* Injection time for OTAREF sub Vth measured coarse program = *10us */
.set    MCP_GATE_S_MITE,    0x4200          /* Gate_S voltage for MITE sub Vth measured coarse program = 3.3V @ IVDD 6.0V */
.set    MCP_INJ_T_MITE,    2          /* Injection time for MITE sub Vth measured coarse program = *10us */
.set    MCP_GATE_S_DIRSWC,    0x6200          /* Gate_S voltage for SWC sub Vth measured coarse program = 3.5V @ IVDD 6.0V */
.set    MCP_INJ_T_DIRSWC,    1          /* Injection time for SWC sub Vth measured coarse program = *10us */

.set    MCPL_GATE_S_SWC,    0x4000          /* Gate_S voltage for SWC low sub Vth measured coarse program = 3.26V @ IVDD 6.0V */
.set    MCPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth measured coarse program = *10us */
.set    MCPL_GATE_S_OTA,    0x3200          /* Gate_S voltage for OTA low sub Vth measured coarse program = 3.1V @ IVDD 6.0V */
.set    MCPL_INJ_T_OTA,    2          /* Injection time for OTA low sub Vth measured coarse program = *10us */
.set    MCPL_GATE_S_OTAREF,    0x3200          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.1V @ IVDD 6.0V */
.set    MCPL_INJ_T_OTAREF,    7          /* Injection time for OTAREF low sub Vth measured coarse program = *10us */
.set    MCPL_GATE_S_MITE,    0x0900          /* Gate_S voltage for MITE low sub Vth measured coarse program = 2.62V @ IVDD 6.0V */
.set    MCPL_INJ_T_MITE,    2          /* Injection time for MITE low sub Vth measured coarse program = *10us */
.set    MCPL_GATE_S_DIRSWC,    0x4000          /* Gate_S voltage for SWC low sub Vth measured coarse program = 3.26V @ IVDD 6.0V */
.set    MCPL_INJ_T_DIRSWC,    1          /* Injection time for SWC low sub Vth measured coarse program = *10us */

/* Fine_Program (FP) */
.set    FPS_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC sub Vth fine program = 3.5V @ IVDD 6.0V */
.set    FPS_INJ_T_SWC,    1          /* Injection time for SWC sub Vth fine program = *10us */
.set    FPS_VD_OS_SWC,    46         /* Vd table offset */
.set    FPS_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA sub Vth fine program = 3.4V @ IVDD 6.0V */
.set    FPS_INJ_T_OTA,    2          /* Injection time for OTA sub Vth fine program = *10us */
.set    FPS_VD_OS_OTA,    46         /* Vd table offset */
.set    FPS_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF sub Vth fine program = 3.4V @ IVDD 6.0V */
.set    FPS_INJ_T_OTAREF,    7          /* Injection time for OTAREF sub Vth fine program = *10us */
.set    FPS_VD_OS_OTAREF,    46         /* Vd table offset */
.set    FPS_GATE_S_MITE,    0x4200          /* Gate_S voltage for MITE sub Vth fine program = 3.3V @ IVDD 6.0V */
.set    FPS_INJ_T_MITE,    2          /* Injection time for MITE sub Vth fine program = *10us */
.set    FPS_VD_OS_MITE,    46         /* Vd table offset */
.set    FPS_GATE_S_DIRSWC,    0x5c00          /* Gate_S voltage for SWC sub Vth fine program = 3.5V @ IVDD 6.0V */
.set    FPS_INJ_T_DIRSWC,    1          /* Injection time for SWC sub Vth fine program = *10us */
.set    FPS_VD_OS_DIRSWC,    46         /* Vd table offset */

.set    FPA_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC above Vth fine program = 3.5V @ IVDD 6.0V */
.set    FPA_INJ_T_SWC,    1          /* Injection time for SWC above Vth fine program = *10us */
.set    FPA_VD_OS_SWC,    21         /* Vd table offset */
.set    FPA_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA above Vth fine program = 3.4V @ IVDD 6.0V */
.set    FPA_INJ_T_OTA,    2          /* Injection time for OTA above Vth fine program = *10us */
.set    FPA_VD_OS_OTA,    21         /* Vd table offset */
.set    FPA_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF above Vth fine program = 3.4V @ IVDD 6.0V */
.set    FPA_INJ_T_OTAREF,    7          /* Injection time for OTAREF above Vth fine program = *10us */
.set    FPA_VD_OS_OTAREF,    21         /* Vd table offset */
.set    FPA_GATE_S_MITE,    0x4200          /* Gate_S voltage for MITE above Vth fine program = 3.3V @ IVDD 6.0V */
.set    FPA_INJ_T_MITE,    2          /* Injection time for MITE above Vth fine program = *10us */
.set    FPA_VD_OS_MITE,    21         /* Vd table offset */
.set    FPA_GATE_S_DIRSWC,    0x7000          /* Gate_S voltage for SWC above Vth fine program = 3.5V @ IVDD 6.0V */
.set    FPA_INJ_T_DIRSWC,    1          /* Injection time for SWC above Vth fine program = *10us */
.set    FPA_VD_OS_DIRSWC,    25         /* Vd table offset */
;.set    FPA_VD_OS_DIRSWC,    21         /* Vd table offset */

.set    FPL_GATE_S_SWC,    0x4000          /* Gate_S voltage for SWC low sub Vth fine program = 3.26V @ IVDD 6.0V */
.set    FPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth fine program = *10us */
.set    FPL_VD_OS_SWC,    46         /* Vd table offset */
.set    FPL_GATE_S_OTA,    0x3200          /* Gate_S voltage for OTA low sub Vth fine program = 3.1V @ IVDD 6.0V */
.set    FPL_INJ_T_OTA,    2          /* Injection time for OTA low sub Vth fine program = *10us */
.set    FPL_VD_OS_OTA,    46         /* Vd table offset */
.set    FPL_GATE_S_OTAREF,    0x3200          /* Gate_S voltage for OTAREF low sub Vth fine program = 3.1V @ IVDD 6.0V */
.set    FPL_INJ_T_OTAREF,    7          /* Injection time for OTAREF low sub Vth fine program = *10us */
.set    FPL_VD_OS_OTAREF,    46         /* Vd table offset */
.set    FPL_GATE_S_MITE,    0x0a00          /* Gate_S voltage for MITE low sub Vth fine program = 2.63V @ IVDD 6.0V */
.set    FPL_INJ_T_MITE,    2          /* Injection time for MITE low sub Vth fine program = *10us */
.set    FPL_VD_OS_MITE,    46         /* Vd table offset */
.set    FPL_GATE_S_DIRSWC,    0x4600          /* Gate_S voltage for SWC low sub Vth fine program = 3.26V @ IVDD 6.0V */
.set    FPL_INJ_T_DIRSWC,    1          /* Injection time for SWC low sub Vth fine program = *10us */
.set    FPL_VD_OS_DIRSWC,    46         /* Vd table offset */

