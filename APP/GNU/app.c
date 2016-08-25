/*
*********************************************************************************************************
*                                              EXAMPLE CODE
*
*                          (c) Copyright 2012; Micrium, Inc.; Weston, FL
*
*               All rights reserved.  Protected by international copyright laws.
*               Knowledge of the source code may NOT be used to develop a similar product.
*               Please help us continue to provide the Embedded community with the finest
*               software available.  Your honesty is greatly appreciated.
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*
*                                            EXAMPLE CODE
*
*                                             NXP LPC18xx
*                                               on the
*                                    KEIL MCB1800 Evaluation Board
*
* Filename      : app.c
* Version       : V1.00
* Programmer(s) : FT
*                 FF
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*                                             INCLUDE FILES
*********************************************************************************************************
*/

#include  "includes.h"

#include  <cpu.h>
#include  <lib_mem.h>
#include  <os.h>
#include  <bsp_os.h>
#include  <os_app_hooks.h>
#include  <app_cfg.h>
#include  <bsp_trace.h>
#include  <em_chip.h>
#include  <em_cmu.h>
#include  <em_emu.h>
#include  <rtcdriver.h>
#include  <lib_def.h>


/*
*********************************************************************************************************
*                                            LOCAL DEFINES
*********************************************************************************************************
*/


/*
*********************************************************************************************************
*                                         CONFIGURATION ERROR
*********************************************************************************************************
*/

#if  (OS_CFG_TASK_TICK_EN == DEF_ENABLED)
#error  "The system tick must be disabled by setting OS_CFG_TASK_TICK_EN to DEF_DISABLED in 'os_cfg.h'"
#endif

#if  (OS_CFG_STAT_TASK_EN == DEF_ENABLED)
#error  "The statistics task must be disabled by setting OS_CFG_STAT_TASK_EN to DEF_DISABLED in 'os_cfg.h'"
#endif


/*
*********************************************************************************************************
*                                       LOCAL GLOBAL VARIABLES
*********************************************************************************************************
*/

static  OS_TCB            AppTaskStartTCB;
static  CPU_STK           AppTaskStartStk[APP_CFG_TASK_START_STK_SIZE];
		OS_SEM            sem;
		RTCDRV_TimerID_t  xTimerForWakeUp;


/*
*********************************************************************************************************
*                                         FUNCTION PROTOTYPES
*********************************************************************************************************
*/

static  void  AppTaskStart (void  *p_arg);
static  void  AppTaskCreate(void);
static  void  AppObjCreate (void);

		void  timerCallback(RTCDRV_TimerID_t  id,
							void             *user );


/*
*********************************************************************************************************
*                                                main()
*
* Description : This is the standard entry point for C code.  It is assumed that your code will call
*               main() once you have performed all necessary initialization.
*
* Arguments   : none
*
* Returns     : none
*
* Notes       : none
*********************************************************************************************************
*/

int  main (void)
{
	OS_ERR  err;

	CHIP_Init();                                                /* Chip revision alignment and errata fixes             */
	CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFRCO);           /* Select reference clock for High Freq. clock          */

	Mem_Init();                                                 /* Initialize Memory Managment Module                   */
	CPU_IntDis();                                               /* Disable all Interrupts.                              */

	OSInit(&err);                                               /* Init uC/OS-III.                                      */
	App_OS_SetAllHooks();

	OSTaskCreate(&AppTaskStartTCB,                              /* Create the start task                                */
				  "App Task Start",
				  AppTaskStart,
				  0u,
				  APP_CFG_TASK_START_PRIO,
				 &AppTaskStartStk[0u],
				  AppTaskStartStk[APP_CFG_TASK_START_STK_SIZE / 10u],
				  APP_CFG_TASK_START_STK_SIZE,
				  0u,
				  0u,
				  0u,
				 (OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
				 &err);

	OSStart(&err);                                              /* Start multitasking (i.e. give control to uC/OS-III). */

	while (DEF_ON) {                                            /* Should Never Get Here.                               */
		;
	}
}


/*
*********************************************************************************************************
*                                          STARTUP TASK
*
* Description : This is an example of a startup task.  As mentioned in the book's text, you MUST
*               initialize the ticker only once multitasking has started.
*
* Arguments   : p_arg   is the argument passed to 'AppTaskStart()' by 'OSTaskCreate()'.
*
* Returns     : none
*
* Notes       : 1) The first line of code is used to prevent a compiler warning because 'p_arg' is not
*                  used.  The compiler should not generate any code for this statement.
*********************************************************************************************************
*/

static  void  AppTaskStart (void *p_arg)
{
	OS_ERR      os_err;
	CPU_INT16U  i;


	(void)p_arg;

	CPU_Init();                                                 /* Initialize the uC/CPU services                       */

	BSP_TraceProfilerSetup();

	RTCDRV_Init();                                              /* Initialize RTC timer.                                */
	RTCDRV_AllocateTimer(&xTimerForWakeUp);

	APP_TRACE_DBG(("Creating Application kernel objects\n\r"));
	AppObjCreate();                                             /* Create Applicaiton kernel objects                    */

	APP_TRACE_DBG(("Creating Application Tasks\n\r"));
	AppTaskCreate();                                            /* Create Application tasks                             */

#if (OS_CFG_TASK_TICK_EN == DEF_DISABLED)
	BSP_OSTickDisable();
#endif

	while (DEF_TRUE) {                                          /* Task body, always written as an infinite loop.       */

		RTCDRV_StartTimer(xTimerForWakeUp,
						  rtcdrvTimerTypeOneshot,
						  1000u,
						  timerCallback,
						  NULL);

		OSSemPend(&sem,
				   0,
				   OS_OPT_PEND_BLOCKING,
				   DEF_NULL,
				  &os_err);

		for (i=0; i < 50; i++) {                                /* Up and down from EM1 each 10 msec                    */
			RTCDRV_StartTimer(xTimerForWakeUp,
							  rtcdrvTimerTypeOneshot,
							  10u,
							  NULL,
							  NULL);
			EMU_EnterEM1();
			RTCDRV_Delay(10);
		}

		for (i=0; i < 500; i++) {                               /* Up and down from EM2 each 2 msec                     */
			RTCDRV_StartTimer(xTimerForWakeUp,
							  rtcdrvTimerTypeOneshot,
							  2u,
							  NULL,
							  NULL);
			EMU_EnterEM2(true);
		}

		for (i=0; i < 1000; i++) {                              /* Up and down from EM1 each msec                       */
			RTCDRV_StartTimer(xTimerForWakeUp,
							  rtcdrvTimerTypeOneshot,
							  1u,
							  NULL,
							  NULL);
			EMU_EnterEM1();
		}
	}
}


/*
*********************************************************************************************************
*                                          timerCallback()
*
* Description : xTimerForWakeUp callback function to post on pending semaphore 'sem' in AppTaskStart.
*
* Argument(s) : id      The timer id.
*
*               user    Extra parameter for user application.
*
* Return(s)   : none
*
* Caller(s)   : RTC timer ISR()
*
* Note(s)     : none.
*********************************************************************************************************
*/

void  timerCallback (RTCDRV_TimerID_t  id,
					 void             *user)
{
	OS_ERR  os_err;


	OSSemPost(&sem,
			   OS_OPT_POST_ALL,
			  &os_err);
}


/*
*********************************************************************************************************
*                                          AppTaskCreate()
*
* Description : Create Application Tasks.
*
* Argument(s) : none
*
* Return(s)   : none
*
* Caller(s)   : AppTaskStart()
*
* Note(s)     : none.
*********************************************************************************************************
*/

static  void  AppTaskCreate (void)
{

}


/*
*********************************************************************************************************
*                                          AppObjCreate()
*
* Description : Create Application Kernel Objects.
*
* Argument(s) : none
*
* Return(s)   : none
*
* Caller(s)   : AppTaskStart()
*
* Note(s)     : none.
*********************************************************************************************************
*/
static  void  AppObjCreate (void)
{
	OS_ERR  os_err;


	OSSemCreate(&sem,
				 DEF_NULL,
				 0,
				&os_err);
}
