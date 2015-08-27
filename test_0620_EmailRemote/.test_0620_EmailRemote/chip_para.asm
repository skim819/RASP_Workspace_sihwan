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
/* Tunnel and Reverse Tunnel */
.set    TUN_TIME_TP_CAB,     40          /* tunneling time for target programming (ms) - CAB */
.set    R_TUN_TIME_TP_CAB,   40          /* Reverse tunneling time for target programming (ms) - CAB */

/* Recover Inject (RI) */
.set    RI_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC recover injection = gnd */
.set    RI_VC1_SWC,     0x1ae1          /* Verify Current 1 for SWC recover injection = 30nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_SWC,     0x1a10          /* Verify Current 1 for SWC recover injection = 20nA @ Vgm=0V */
.set    RI_VC3_SWC,     0x1741           /* Verify Current 1 for SWC recover injection = 5nA @ Vgm=0V */
.set    RI_VC4_SWC,     0x1401           /* Verify Current 1 for SWC recover injection = 1nA @ Vgm=0V */

;.set    RI_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA recover injection = 2.5V @ IVDD 6.0V */
.set    RI_GATE_S_OTA,    0x2b00          /* Gate_S voltage for OTA recover injection = 3.1V @ IVDD 6.0V */
.set    RI_VC1_OTA,     0x1de6           /* Verify Current 1 for OTA recover injection = 129nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTA,     0x1d18          /* Verify Current 1 for OTA recover injection =  88nA @ Vgm=0V */
.set    RI_VC3_OTA,     0x1a58           /* Verify Current 1 for OTA recover injection = 23nA @ Vgm=0V */
.set    RI_VC4_OTA,     0x1741           /* Verify Current 1 for OTA recover injection = 5nA @ Vgm=0V */

.set    RI_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF recover injection = gnd */
.set    RI_VC1_OTAREF,  0x1ae1              /* Verify Current 1 for OTAREF recover injection = 30nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTAREF,  0x1a10             /* Verify Current 1 for OTAREF recover injection = 20nA @ Vgm=0V */
.set    RI_VC3_OTAREF,  0x1741              /* Verify Current 1 for OTAREF recover injection = 5nA @ Vgm=0V */
.set    RI_VC4_OTAREF,  0x1401              /* Verify Current 1 for OTAREF recover injection = 1nA @ Vgm=0V */

.set    RI_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_MITE,    0x1f00           /* Verify Current 1 for MITE recover injection = 215nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_MITE,    0x1e35           /* Verify Current 1 for MITE recover injection =  149nA @ Vgm=0V */
.set    RI_VC3_MITE,    0x1b85            /* Verify Current 1 for MITE recover injection = 41nA @ Vgm=0V */
.set    RI_VC4_MITE,    0x1835            /* Verify Current 1 for MITE recover injection = 8nA @ Vgm=0V */

.set    RIL_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC low sub Vth recover injection = gnd */
.set    RIL_VC1_SWC,     0x1401          /* Verify Current 1 for SWC low sub Vth recover injection = 1nA @ Vgm = 0V */   /* ???? */
.set    RIL_VC2_SWC,     0x1370          /* Verify Current 1 for SWC low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */

;.set    RIL_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA low sub Vth recover injection = 2.5V @ IVDD 6.0V */
.set    RIL_GATE_S_OTA,    0x2b00          /* Gate_S voltage for OTA low sub Vth recover injection = 3.1V @ IVDD 6.0V */
.set    RIL_VC1_OTA,     0x1401           /* Verify Current 1 for OTA low sub Vth recover injection = 1nA @ Vgm=0V */     /* ???? */
.set    RIL_VC2_OTA,     0x1370          /* Verify Current 1 for OTA low sub Vth recover injection =  hundreds pA below 1nA @ Vgm=0V */

.set    RIL_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF low sub Vth recover injection = gnd */
.set    RIL_VC1_OTAREF,  0x1401              /* Verify Current 1 for OTAREF low sub Vth recover injection = 1nA @ Vgm=0V */   /* ???? */
.set    RIL_VC2_OTAREF,  0x1370             /* Verify Current 1 for OTAREF low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */

.set    RIL_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE low sub Vth recover injection = 2.5V @ IVDD 6.0V */
.set    RIL_VC1_MITE,    0x1401           /* Verify Current 1 for MITE low sub Vth recover injection = 1nA @ Vgm=0V */     /* ???? */
.set    RIL_VC2_MITE,    0x1370           /* Verify Current 1 for MITE rlow sub Vth ecover injection =  hundreds pA below 1nA @ Vgm=0V */

/* First_Coarse_Program (FCP) */
.set    FCP_1nA_ADC,    0x1401          /* 1nA ADC value */

;.set    FCP_GATE_S_SWC,    0x4b00          /* Gate_S voltage for SWC first coarese program = 3.5V @ IVDD 6.0V */
;.set    FCP_GATE_S_SWC,    0x5400          /* Gate_S voltage for SWC first coarese program = 3.6V @ IVDD 6.0V */
;.set    FCP_GATE_S_SWC,    0x5200          /* Gate_S voltage for SWC first coarese program = 3.58V @ IVDD 6.0V */
.set    FCP_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC first coarese program = 3.55V @ IVDD 6.0V */
.set    FCP_INJ_T_SWC,    1          /* Injection time for SWC first coarese program = *10us */

;.set    FCP_GATE_S_OTA,    0x4300          /* Gate_S voltage for OTA first coarese program = 3.4V @ IVDD 6.0V */
;.set    FCP_GATE_S_OTA,    0x4b00          /* Gate_S voltage for OTA first coarese program = 3.5V @ IVDD 6.0V */
;.set    FCP_GATE_S_OTA,    0x5400          /* Gate_S voltage for OTA first coarese program = 3.6V @ IVDD 6.0V */
;.set    FCP_GATE_S_OTA,    0x5000          /* Gate_S voltage for OTA first coarese program = 3.55V @ IVDD 6.0V */
.set    FCP_GATE_S_OTA,    0x4e00          /* Gate_S voltage for OTA first coarese program = 3.53V @ IVDD 6.0V */
.set    FCP_INJ_T_OTA,    18          /* Injection time for OTA first coarese program = *10us */
;.set    FCP_INJ_T_OTA,    20          /* Injection time for OTA first coarese program = *10us */

;.set    FCP_GATE_S_OTAREF,    0x4300          /* Gate_S voltage for OTAREF first coarese program = 3.4V @ IVDD 6.0V */
;.set    FCP_GATE_S_OTAREF,    0x4b00          /* Gate_S voltage for OTAREF first coarese program = 3.5V @ IVDD 6.0V */
;.set    FCP_GATE_S_OTAREF,    0x5400          /* Gate_S voltage for OTAREF first coarese program = 3.6V @ IVDD 6.0V */
;.set    FCP_GATE_S_OTAREF,    0x5000          /* Gate_S voltage for OTAREF first coarese program = 3.55V @ IVDD 6.0V */
.set    FCP_GATE_S_OTAREF,    0x4e00          /* Gate_S voltage for OTAREF first coarese program = 3.53V @ IVDD 6.0V */
;.set    FCP_INJ_T_OTAREF,    25          /* Injection time for OTAREF first coarese program = *10us */
.set    FCP_INJ_T_OTAREF,    12          /* Injection time for OTAREF first coarese program = *10us */

;.set    FCP_GATE_S_MITE,    0x3b00          /* Gate_S voltage for MITE first coarese program = 3.3V @ IVDD 6.0V */
;.set    FCP_GATE_S_MITE,    0x4300          /* Gate_S voltage for MITE first coarese program = 3.4V @ IVDD 6.0V */
;.set    FCP_GATE_S_MITE,    0x4b00          /* Gate_S voltage for MITE first coarese program = 3.5V @ IVDD 6.0V */
;.set    FCP_GATE_S_MITE,    0x5400          /* Gate_S voltage for MITE first coarese program = 3.6V @ IVDD 6.0V */
;.set    FCP_GATE_S_MITE,    0x5000          /* Gate_S voltage for MITE first coarese program = 3.55V @ IVDD 6.0V */
.set    FCP_GATE_S_MITE,    0x4e00          /* Gate_S voltage for MITE first coarese program = 3.53V @ IVDD 6.0V */
;.set    FCP_INJ_T_MITE,    27          /* Injection time for MITE first coarese program = *10us */
.set    FCP_INJ_T_MITE,    32          /* Injection time for MITE first coarese program = *10us */

;.set    FCPL_GATE_S_SWC,    0x3700          /* Gate_S voltage for SWC low sub Vth first coarese program = 3.26V @ IVDD 6.0V */
;.set    FCPL_GATE_S_SWC,    0x4000          /* Gate_S voltage for SWC low sub Vth first coarese program = 3.36V @ IVDD 6.0V */
.set    FCPL_GATE_S_SWC,    0x3e00          /* Gate_S voltage for SWC low sub Vth first coarese program = 3.34V @ IVDD 6.0V */
;.set    FCPL_GATE_S_SWC,    0x3b00          /* Gate_S voltage for SWC low sub Vth first coarese program = 3.3V @ IVDD 6.0V */
;.set    FCPL_GATE_S_SWC,    0x3d00          /* Gate_S voltage for SWC low sub Vth first coarese program = 3.32V @ IVDD 6.0V */
.set    FCPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth first coarese program = *10us */

;.set    FCPL_GATE_S_OTA,    0x2b00          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.1V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTA,    0x3300          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.2V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTA,    0x3b00          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.3V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTA,    0x4300          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.4V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTA,    0x4b00          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.5V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTA,    0x5400          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.6V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTA,    0x5000          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.55V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTA,    0x4e00          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.53V @ IVDD 6.0V */
.set    FCPL_GATE_S_OTA,    0x4d00          /* Gate_S voltage for OTA low sub Vth first coarese program = 3.52V @ IVDD 6.0V */
.set    FCPL_INJ_T_OTA,    1          /* Injection time for OTA low sub Vth first coarese program = *10us */

;.set    FCPL_GATE_S_OTAREF,    0x2b00          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.1V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTAREF,    0x3300          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.2V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTAREF,    0x3b00          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.3V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTAREF,    0x4300          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.4V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTAREF,    0x4b00          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTAREF,    0x5400          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    FCPL_GATE_S_OTAREF,    0x4e00          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    FCPL_GATE_S_OTAREF,    0x4d00          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.51V @ IVDD 6.0V */
.set    FCPL_INJ_T_OTAREF,    2          /* Injection time for OTAREF low sub Vth measured coarse program = *10us */

;.set    FCPL_GATE_S_MITE,    0x0400          /* Gate_S voltage for MITE low sub Vth first coarese program = 2.62V @ IVDD 6.0V */
.set    FCPL_GATE_S_MITE,    0x0b00          /* Gate_S voltage for MITE low sub Vth first coarese program = 2.72V @ IVDD 6.0V */
.set    FCPL_INJ_T_MITE,    1          /* Injection time for MITE low sub Vth first coarese program = *10us */

/* Measured_Coarse_Program (MCP) */
;.set    MCPS_GATE_S_SWC,    0x4b00          /* Gate_S voltage for SWC sub Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    MCPS_GATE_S_SWC,    0x5400          /* Gate_S voltage for SWC sub Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPS_GATE_S_SWC,    0x5200          /* Gate_S voltage for SWC sub Vth measured coarse program = 3.58V @ IVDD 6.0V */
.set    MCPS_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC sub Vth measured coarse program = 3.55V @ IVDD 6.0V */
.set    MCPS_INJ_T_SWC,    1          /* Injection time for SWC sub Vth measured coarse program = *10us */

;.set    MCPS_GATE_S_OTA,    0x4300          /* Gate_S voltage for OTA sub Vth measured coarse program = 3.4V @ IVDD 6.0V */
;.set    MCPS_GATE_S_OTA,    0x4b00          /* Gate_S voltage for OTA sub Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    MCPS_GATE_S_OTA,    0x5400          /* Gate_S voltage for OTA sub Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPS_GATE_S_OTA,    0x5000          /* Gate_S voltage for OTA sub Vth measured coarse program = 3.55V @ IVDD 6.0V */
.set    MCPS_GATE_S_OTA,    0x4e00          /* Gate_S voltage for OTA sub Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    MCPS_INJ_T_OTA,    7          /* Injection time for OTA sub Vth measured coarse program = *10us */

;.set    MCPS_GATE_S_OTAREF,    0x4300          /* Gate_S voltage for OTAREF sub Vth measured coarse program = 3.4V @ IVDD 6.0V */
;.set    MCPS_GATE_S_OTAREF,    0x4b00          /* Gate_S voltage for OTAREF sub Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    MCPS_GATE_S_OTAREF,    0x5400          /* Gate_S voltage for OTAREF sub Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPS_GATE_S_OTAREF,    0x5000          /* Gate_S voltage for OTAREF sub Vth measured coarse program = 3.55V @ IVDD 6.0V */
.set    MCPS_GATE_S_OTAREF,    0x4e00          /* Gate_S voltage for OTAREF sub Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    MCPS_INJ_T_OTAREF,    7          /* Injection time for OTAREF sub Vth measured coarse program = *10us */

;.set    MCPS_GATE_S_MITE,    0x3b00          /* Gate_S voltage for MITE sub Vth measured coarse program = 3.3V @ IVDD 6.0V */
;.set    MCPS_GATE_S_MITE,    0x4300          /* Gate_S voltage for MITE sub Vth measured coarse program = 3.4V @ IVDD 6.0V */
;.set    MCPS_GATE_S_MITE,    0x4b00          /* Gate_S voltage for MITE sub Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    MCPS_GATE_S_MITE,    0x5400          /* Gate_S voltage for MITE sub Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPS_GATE_S_MITE,    0x5000          /* Gate_S voltage for MITE sub Vth measured coarse program = 3.55V @ IVDD 6.0V */
.set    MCPS_GATE_S_MITE,    0x4e00          /* Gate_S voltage for MITE sub Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    MCPS_INJ_T_MITE,    7          /* Injection time for MITE sub Vth measured coarse program = *10us */

;.set    MCPA_GATE_S_SWC,    0x4b00          /* Gate_S voltage for SWC above Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    MCPA_GATE_S_SWC,    0x5400          /* Gate_S voltage for SWC above Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPA_GATE_S_SWC,    0x5200          /* Gate_S voltage for SWC above Vth measured coarse program = 3.58V @ IVDD 6.0V */
.set    MCPA_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC above Vth measured coarse program = 3.55V @ IVDD 6.0V */
.set    MCPA_INJ_T_SWC,    1          /* Injection time for SWC above Vth measured coarse program = *10us */

;.set    MCPA_GATE_S_OTA,    0x4300          /* Gate_S voltage for OTA above Vth measured coarse program = 3.4V @ IVDD 6.0V */
;.set    MCPA_GATE_S_OTA,    0x4b00          /* Gate_S voltage for OTA above Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    MCPA_GATE_S_OTA,    0x5400          /* Gate_S voltage for OTA above Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPA_GATE_S_OTA,    0x5000          /* Gate_S voltage for OTA above Vth measured coarse program = 3.55V @ IVDD 6.0V */
.set    MCPA_GATE_S_OTA,    0x4e00          /* Gate_S voltage for OTA above Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    MCPA_INJ_T_OTA,   7           /* Injection time for OTA above Vth measured coarse program = *10us */

;.set    MCPA_GATE_S_OTAREF,    0x4300          /* Gate_S voltage for OTAREF above Vth measured coarse program = 3.4V @ IVDD 6.0V */
;.set    MCPA_GATE_S_OTAREF,    0x4b00          /* Gate_S voltage for OTAREF above Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    MCPA_GATE_S_OTAREF,    0x5400          /* Gate_S voltage for OTAREF above Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPA_GATE_S_OTAREF,    0x5000          /* Gate_S voltage for OTAREF above Vth measured coarse program = 3.55V @ IVDD 6.0V */
.set    MCPA_GATE_S_OTAREF,    0x4e00          /* Gate_S voltage for OTAREF above Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    MCPA_INJ_T_OTAREF,    7          /* Injection time for OTAREF above Vth measured coarse program = *10us */

;.set    MCPA_GATE_S_MITE,    0x3b00          /* Gate_S voltage for MITE above Vth measured coarse program = 3.3V @ IVDD 6.0V */
;.set    MCPA_GATE_S_MITE,    0x4300          /* Gate_S voltage for MITE above Vth measured coarse program = 3.4V @ IVDD 6.0V */
;.set    MCPA_GATE_S_MITE,    0x4b00          /* Gate_S voltage for MITE above Vth measured coarse program = 3.5V @ IVDD 6.0V */
;.set    MCPA_GATE_S_MITE,    0x5400          /* Gate_S voltage for MITE above Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPA_GATE_S_MITE,    0x5000          /* Gate_S voltage for MITE above Vth measured coarse program = 3.55V @ IVDD 6.0V */
.set    MCPA_GATE_S_MITE,    0x4e00          /* Gate_S voltage for MITE above Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    MCPA_INJ_T_MITE,    4          /* Injection time for MITE above Vth measured coarse program = *10us */

;.set    MCPL_GATE_S_SWC,    0x3700          /* Gate_S voltage for SWC low sub Vth measured coarse program = 3.26V @ IVDD 6.0V */
;.set    MCPL_GATE_S_SWC,    0x4000          /* Gate_S voltage for SWC low sub Vth measured coarse program = 3.36V @ IVDD 6.0V */
.set    MCPL_GATE_S_SWC,    0x3e00          /* Gate_S voltage for SWC low sub Vth measured coarse program = 3.34V @ IVDD 6.0V */
;.set    MCPL_GATE_S_SWC,    0x3b00          /* Gate_S voltage for SWC low sub Vth measured coarse program = 3.3V @ IVDD 6.0V */
;.set    MCPL_GATE_S_SWC,    0x3d00          /* Gate_S voltage for SWC low sub Vth measured coarse program = 3.32V @ IVDD 6.0V */
.set    MCPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth measured coarse program = *10us */

;.set    MCPL_GATE_S_OTA,    0x2b00          /* Gate_S voltage for OTA low sub Vth measured coarse program = 3.1V @ IVDD 6.0V */
;.set    MCPL_GATE_S_OTA,    0x3300          /* Gate_S voltage for OTA low sub Vth measured coarse program = 3.2V @ IVDD 6.0V */
;.set    MCPL_GATE_S_OTA,    0x5400          /* Gate_S voltage for OTA low sub Vth measured coarse program = 3.6V @ IVDD 6.0V */
;.set    MCPL_GATE_S_OTA,    0x4e00          /* Gate_S voltage for OTA low sub Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    MCPL_GATE_S_OTA,    0x4d00          /* Gate_S voltage for OTA low sub Vth measured coarse program = 3.52V @ IVDD 6.0V */
.set    MCPL_INJ_T_OTA,    1          /* Injection time for OTA low sub Vth measured coarse program = *10us */

;.set    MCPL_GATE_S_OTAREF,    0x2b00          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.1V @ IVDD 6.0V */
;.set    MCPL_GATE_S_OTAREF,    0x3300          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.2V @ IVDD 6.0V */
;.set    MCPL_GATE_S_OTAREF,    0x4e00          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.53V @ IVDD 6.0V */
.set    MCPL_GATE_S_OTAREF,    0x4d00          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.51V @ IVDD 6.0V */
.set    MCPL_INJ_T_OTAREF,    7          /* Injection time for OTAREF low sub Vth measured coarse program = *10us */

;.set    MCPL_GATE_S_MITE,    0x0400          /* Gate_S voltage for MITE low sub Vth measured coarse program = 2.62V @ IVDD 6.0V */
.set    MCPL_GATE_S_MITE,    0x0b00          /* Gate_S voltage for MITE low sub Vth measured coarse program = 2.72V @ IVDD 6.0V */
.set    MCPL_INJ_T_MITE,    3          /* Injection time for MITE low sub Vth measured coarse program = *10us */

/* Fine_Program (FP) */
;.set    FPS_GATE_S_SWC,    0x4b00          /* Gate_S voltage for SWC sub Vth fine program = 3.5V @ IVDD 6.0V */
;.set    FPS_GATE_S_SWC,    0x5400          /* Gate_S voltage for SWC sub Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPS_GATE_S_SWC,    0x5200          /* Gate_S voltage for SWC sub Vth fine program = 3.58V @ IVDD 6.0V */
.set    FPS_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC sub Vth fine program = 3.55V @ IVDD 6.0V */
.set    FPS_INJ_T_SWC,    1          /* Injection time for SWC sub Vth fine program = *10us */

;.set    FPS_GATE_S_OTA,    0x4300          /* Gate_S voltage for OTA sub Vth fine program = 3.4V @ IVDD 6.0V */
;.set    FPS_GATE_S_OTA,    0x4b00          /* Gate_S voltage for OTA sub Vth fine program = 3.5V @ IVDD 6.0V */
;.set    FPS_GATE_S_OTA,    0x5400          /* Gate_S voltage for OTA sub Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPS_GATE_S_OTA,    0x5000          /* Gate_S voltage for OTA sub Vth fine program = 3.55V @ IVDD 6.0V */
.set    FPS_GATE_S_OTA,    0x4e00          /* Gate_S voltage for OTA sub Vth fine program = 3.53V @ IVDD 6.0V */
.set    FPS_INJ_T_OTA,    2          /* Injection time for OTA sub Vth fine program = *10us */

;.set    FPS_GATE_S_OTAREF,    0x4300          /* Gate_S voltage for OTAREF sub Vth fine program = 3.4V @ IVDD 6.0V */
;.set    FPS_GATE_S_OTAREF,    0x4b00          /* Gate_S voltage for OTAREF sub Vth fine program = 3.5V @ IVDD 6.0V */
;.set    FPS_GATE_S_OTAREF,    0x5400          /* Gate_S voltage for OTAREF sub Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPS_GATE_S_OTAREF,    0x5000          /* Gate_S voltage for OTAREF sub Vth fine program = 3.55V @ IVDD 6.0V */
.set    FPS_GATE_S_OTAREF,    0x4e00          /* Gate_S voltage for OTAREF sub Vth fine program = 3.53V @ IVDD 6.0V */
.set    FPS_INJ_T_OTAREF,    7          /* Injection time for OTAREF sub Vth fine program = *10us */

;.set    FPS_GATE_S_MITE,    0x3b00          /* Gate_S voltage for MITE sub Vth fine program = 3.3V @ IVDD 6.0V */
;.set    FPS_GATE_S_MITE,    0x4300          /* Gate_S voltage for MITE sub Vth fine program = 3.4V @ IVDD 6.0V */
;.set    FPS_GATE_S_MITE,    0x4b00          /* Gate_S voltage for MITE sub Vth fine program = 3.5V @ IVDD 6.0V */
;.set    FPS_GATE_S_MITE,    0x5400          /* Gate_S voltage for MITE sub Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPS_GATE_S_MITE,    0x5000          /* Gate_S voltage for MITE sub Vth fine program = 3.55V @ IVDD 6.0V */
.set    FPS_GATE_S_MITE,    0x4e00          /* Gate_S voltage for MITE sub Vth fine program = 3.53V @ IVDD 6.0V */
.set    FPS_INJ_T_MITE,    7          /* Injection time for MITE sub Vth fine program = *10us */

;.set    FPA_GATE_S_SWC,    0x4b00          /* Gate_S voltage for SWC above Vth fine program = 3.5V @ IVDD 6.0V */
;.set    FPA_GATE_S_SWC,    0x5400          /* Gate_S voltage for SWC above Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPA_GATE_S_SWC,    0x5200          /* Gate_S voltage for SWC above Vth fine program = 3.58V @ IVDD 6.0V */
.set    FPA_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC above Vth fine program = 3.55V @ IVDD 6.0V */
.set    FPA_INJ_T_SWC,    1          /* Injection time for SWC above Vth fine program = *10us */

;.set    FPA_GATE_S_OTA,    0x4300          /* Gate_S voltage for OTA above Vth fine program = 3.4V @ IVDD 6.0V */
;.set    FPA_GATE_S_OTA,    0x4b00          /* Gate_S voltage for OTA above Vth fine program = 3.5V @ IVDD 6.0V */
;.set    FPA_GATE_S_OTA,    0x5400          /* Gate_S voltage for OTA above Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPA_GATE_S_OTA,    0x5000          /* Gate_S voltage for OTA above Vth fine program = 3.55V @ IVDD 6.0V */
.set    FPA_GATE_S_OTA,    0x4e00          /* Gate_S voltage for OTA above Vth fine program = 3.53V @ IVDD 6.0V */
.set    FPA_INJ_T_OTA,    2          /* Injection time for OTA above Vth fine program = *10us */

;.set    FPA_GATE_S_OTAREF,    0x4300          /* Gate_S voltage for OTAREF above Vth fine program = 3.4V @ IVDD 6.0V */
;.set    FPA_GATE_S_OTAREF,    0x4b00          /* Gate_S voltage for OTAREF above Vth fine program = 3.5V @ IVDD 6.0V */
;.set    FPA_GATE_S_OTAREF,    0x5400          /* Gate_S voltage for OTAREF above Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPA_GATE_S_OTAREF,    0x5000          /* Gate_S voltage for OTAREF above Vth fine program = 3.55V @ IVDD 6.0V */
.set    FPA_GATE_S_OTAREF,    0x4e00          /* Gate_S voltage for OTAREF above Vth fine program = 3.53V @ IVDD 6.0V */
.set    FPA_INJ_T_OTAREF,    7          /* Injection time for OTAREF above Vth fine program = *10us */

;.set    FPA_GATE_S_MITE,    0x3b00          /* Gate_S voltage for MITE above Vth fine program = 3.3V @ IVDD 6.0V */
;.set    FPA_GATE_S_MITE,    0x4300          /* Gate_S voltage for MITE above Vth fine program = 3.4V @ IVDD 6.0V */
;.set    FPA_GATE_S_MITE,    0x4b00          /* Gate_S voltage for MITE above Vth fine program = 3.5V @ IVDD 6.0V */
;.set    FPA_GATE_S_MITE,    0x5400          /* Gate_S voltage for MITE above Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPA_GATE_S_MITE,    0x5000          /* Gate_S voltage for MITE above Vth fine program = 3.55V @ IVDD 6.0V */
.set    FPA_GATE_S_MITE,    0x4e00          /* Gate_S voltage for MITE above Vth fine program = 3.53V @ IVDD 6.0V */
.set    FPA_INJ_T_MITE,    4          /* Injection time for MITE above Vth fine program = *10us */

;.set    FPL_GATE_S_SWC,    0x3700          /* Gate_S voltage for SWC low sub Vth fine program = 3.26V @ IVDD 6.0V */
;.set    FPL_GATE_S_SWC,    0x4000          /* Gate_S voltage for SWC low sub Vth fine program = 3.36V @ IVDD 6.0V */
;.set    FPL_GATE_S_SWC,    0x3e00          /* Gate_S voltage for SWC low sub Vth fine program = 3.34V @ IVDD 6.0V */
;.set    FPL_GATE_S_SWC,    0x3b00          /* Gate_S voltage for SWC low sub Vth fine program = 3.3V @ IVDD 6.0V */
.set    FPL_GATE_S_SWC,    0x3d00          /* Gate_S voltage for SWC low sub Vth fine program = 3.32V @ IVDD 6.0V */
.set    FPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth fine program = *10us */

;.set    FPL_GATE_S_OTA,    0x2b00          /* Gate_S voltage for OTA low sub Vth fine program = 3.1V @ IVDD 6.0V */
;.set    FPL_GATE_S_OTA,    0x3300          /* Gate_S voltage for OTA low sub Vth fine program = 3.2V @ IVDD 6.0V */
;.set    FPL_GATE_S_OTA,    0x5400          /* Gate_S voltage for OTA low sub Vth fine program = 3.6V @ IVDD 6.0V */
;.set    FPL_GATE_S_OTA,    0x4e00          /* Gate_S voltage for OTA low sub Vth fine program = 3.53V @ IVDD 6.0V */
.set    FPL_GATE_S_OTA,    0x4d00          /* Gate_S voltage for OTA low sub Vth fine program = 3.52V @ IVDD 6.0V */
.set    FPL_INJ_T_OTA,    1          /* Injection time for OTA low sub Vth fine program = *10us */

;.set    FPL_GATE_S_OTAREF,    0x2b00          /* Gate_S voltage for OTAREF low sub Vth fine program = 3.1V @ IVDD 6.0V */
;.set    FPL_GATE_S_OTAREF,    0x3300          /* Gate_S voltage for OTAREF low sub Vth fine program = 3.2V @ IVDD 6.0V */
;.set    FPL_GATE_S_OTAREF,    0x4e00          /* Gate_S voltage for OTAREF low sub Vth fine program = 3.53V @ IVDD 6.0V */
.set    FPL_GATE_S_OTAREF,    0x4d00          /* Gate_S voltage for OTAREF low sub Vth fine program = 3.51V @ IVDD 6.0V */
.set    FPL_INJ_T_OTAREF,    7          /* Injection time for OTAREF low sub Vth fine program = *10us */

;.set    FPL_GATE_S_MITE,    0x0400          /* Gate_S voltage for MITE low sub Vth fine program = 2.63V @ IVDD 6.0V */
.set    FPL_GATE_S_MITE,    0x0c00          /* Gate_S voltage for MITE low sub Vth fine program = 2.73V @ IVDD 6.0V */
.set    FPL_INJ_T_MITE,    3          /* Injection time for MITE low sub Vth fine program = *10us */

