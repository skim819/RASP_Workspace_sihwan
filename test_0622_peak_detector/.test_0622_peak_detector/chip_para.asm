/*---------------------------------------------------------------------------*/
/*                       chip parameters for chip 02                         */ 
/*---------------------------------------------------------------------------*/
/*----------------*/
/* Switch program */
/*----------------*/
.set    TUN_TIME_SP,     3          /* tunneling time for switch programming (ms) */
.set    R_TUN_TIME_SP,     2          /* reverse tunneling time for switch programming (ms) */
.set    INJ_TIME_SP_1,     300          /* injection time for switch programming (ms) (1st pulse)*/


/*----------------*/
/* Target program */
/*----------------*/
/* Tunnel and Reverse Tunnel */
.set    TUN_TIME_TP_CAB,     40          /* tunneling time for target programming (ms) - CAB */
.set    R_TUN_TIME_TP_CAB,   40          /* tunneling time for target programming (ms) - CAB */

/* Recover Inject (RI) */
.set    RI_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC recover injection = gnd */
.set    RI_VC1_SWC,     0x177f          /* Verify Current 1 for SWC recover injection = 30nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_SWC,     0x16c6          /* Verify Current 1 for SWC recover injection = 20nA @ Vgm=0V */
.set    RI_VC3_SWC,     0x145c           /* Verify Current 1 for SWC recover injection = 5nA @ Vgm=0V */
.set    RI_VC4_SWC,     0x1190           /* Verify Current 1 for SWC recover injection = 1nA @ Vgm=0V */

.set    RI_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_OTA,     0x1a2f           /* Verify Current 1 for OTA recover injection = 129nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTA,     0x1976          /* Verify Current 1 for OTA recover injection =  88nA @ Vgm=0V */
.set    RI_VC3_OTA,     0x170c           /* Verify Current 1 for OTA recover injection = 23nA @ Vgm=0V */
.set    RI_VC4_OTA,     0x1440           /* Verify Current 1 for OTA recover injection = 5nA @ Vgm=0V */

.set    RI_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF recover injection = gnd */
.set    RI_VC1_OTAREF,  0x177f              /* Verify Current 1 for OTAREF recover injection = 30nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTAREF,  0x16c6             /* Verify Current 1 for OTAREF recover injection = 20nA @ Vgm=0V */
.set    RI_VC3_OTAREF,  0x145c              /* Verify Current 1 for OTAREF recover injection = 5nA @ Vgm=0V */
.set    RI_VC4_OTAREF,  0x1190              /* Verify Current 1 for OTAREF recover injection = 1nA @ Vgm=0V */

.set    RI_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_MITE,    0x1b2f           /* Verify Current 1 for MITE recover injection = 215nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_MITE,    0x1a76           /* Verify Current 1 for MITE recover injection =  149nA @ Vgm=0V */
.set    RI_VC3_MITE,    0x180c            /* Verify Current 1 for MITE recover injection = 41nA @ Vgm=0V */
.set    RI_VC4_MITE,    0x1540            /* Verify Current 1 for MITE recover injection = 8nA @ Vgm=0V */

.set    RIL_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC low sub Vth recover injection = gnd */
.set    RIL_VC1_SWC,     0x1190          /* Verify Current 1 for SWC low sub Vth recover injection = 1nA @ Vgm = 0V */
.set    RIL_VC2_SWC,     0x10d0          /* Verify Current 1 for SWC low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */

.set    RIL_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF low sub Vth recover injection = gnd */
.set    RIL_VC1_OTAREF,  0x1190              /* Verify Current 1 for OTAREF low sub Vth recover injection = 1nA @ Vgm=0V */
.set    RIL_VC2_OTAREF,  0x1100             /* Verify Current 1 for OTAREF low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */

/* First_Coarse_Program (FCP) */
.set    FCP_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC first coarese program = 3.5V @ IVDD 6.0V */
.set    FCP_INJ_T_SWC,    1          /* Injection time for SWC first coarese program = *10us */

.set    FCP_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA first coarese program = 3.4V @ IVDD 6.0V */
.set    FCP_INJ_T_OTA,    2          /* Injection time for OTA first coarese program = *10us */

.set    FCP_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF first coarese program = 3.4V @ IVDD 6.0V */
.set    FCP_INJ_T_OTAREF,    7          /* Injection time for OTAREF first coarese program = *10us */

.set    FCP_GATE_S_MITE,    0x4200          /* Gate_S voltage for MITE first coarese program = 3.3V @ IVDD 6.0V */
.set    FCP_INJ_T_MITE,    2          /* Injection time for MITE first coarese program = *10us */

.set    FCPL_GATE_S_SWC,    0x4000          /* Gate_S voltage for SWC low sub Vth first coarese program = 3.26V @ IVDD 6.0V */
.set    FCPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth first coarese program = *10us */

.set    FCPL_GATE_S_OTAREF,    0x3200          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.1V @ IVDD 6.0V */
.set    FCPL_INJ_T_OTAREF,    7          /* Injection time for OTAREF low sub Vth measured coarse program = *10us */

/* Measured_Coarse_Program (MCP) */
.set    MCPS_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC sub Vth measured coarse program = 3.5V @ IVDD 6.0V */
.set    MCPS_INJ_T_SWC,    1          /* Injection time for SWC sub Vth measured coarse program = *10us */

.set    MCPS_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA sub Vth measured coarse program = 3.4V @ IVDD 6.0V */
.set    MCPS_INJ_T_OTA,    2          /* Injection time for OTA sub Vth measured coarse program = *10us */

.set    MCPS_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF sub Vth measured coarse program = 3.4V @ IVDD 6.0V */
.set    MCPS_INJ_T_OTAREF,    7          /* Injection time for OTAREF sub Vth measured coarse program = *10us */

.set    MCPS_GATE_S_MITE,    0x4200          /* Gate_S voltage for MITE sub Vth measured coarse program = 3.3V @ IVDD 6.0V */
.set    MCPS_INJ_T_MITE,    2          /* Injection time for MITE sub Vth measured coarse program = *10us */

.set    MCPA_GATE_S_SWC,    0x5000          /* Gate_S voltage for SWC above Vth measured coarse program = 3.5V @ IVDD 6.0V */
.set    MCPA_INJ_T_SWC,    1          /* Injection time for SWC above Vth measured coarse program = *10us */

.set    MCPA_GATE_S_OTA,    0x4a00          /* Gate_S voltage for OTA above Vth measured coarse program = 3.4V @ IVDD 6.0V */
.set    MCPA_INJ_T_OTA,    2          /* Injection time for OTA above Vth measured coarse program = *10us */

.set    MCPA_GATE_S_OTAREF,    0x4a00          /* Gate_S voltage for OTAREF above Vth measured coarse program = 3.4V @ IVDD 6.0V */
.set    MCPA_INJ_T_OTAREF,    7          /* Injection time for OTAREF above Vth measured coarse program = *10us */

.set    MCPA_GATE_S_MITE,    0x4200          /* Gate_S voltage for MITE above Vth measured coarse program = 3.3V @ IVDD 6.0V */
.set    MCPA_INJ_T_MITE,    2          /* Injection time for MITE above Vth measured coarse program = *10us */

.set    MCPL_GATE_S_SWC,    0x4000          /* Gate_S voltage for SWC low sub Vth measured coarse program = 3.26V @ IVDD 6.0V */
.set    MCPL_INJ_T_SWC,    1          /* Injection time for SWC low sub Vth measured coarse program = *10us */

.set    MCPL_GATE_S_OTAREF,    0x3200          /* Gate_S voltage for OTAREF low sub Vth measured coarse program = 3.1V @ IVDD 6.0V */
.set    MCPL_INJ_T_OTAREF,    7          /* Injection time for OTAREF low sub Vth measured coarse program = *10us */



