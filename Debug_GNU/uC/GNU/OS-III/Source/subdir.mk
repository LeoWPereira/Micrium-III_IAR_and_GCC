################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../uC/GNU/OS-III/Source/os_cfg_app.c \
../uC/GNU/OS-III/Source/os_core.c \
../uC/GNU/OS-III/Source/os_dbg.c \
../uC/GNU/OS-III/Source/os_flag.c \
../uC/GNU/OS-III/Source/os_int.c \
../uC/GNU/OS-III/Source/os_mem.c \
../uC/GNU/OS-III/Source/os_msg.c \
../uC/GNU/OS-III/Source/os_mutex.c \
../uC/GNU/OS-III/Source/os_pend_multi.c \
../uC/GNU/OS-III/Source/os_prio.c \
../uC/GNU/OS-III/Source/os_q.c \
../uC/GNU/OS-III/Source/os_sem.c \
../uC/GNU/OS-III/Source/os_stat.c \
../uC/GNU/OS-III/Source/os_task.c \
../uC/GNU/OS-III/Source/os_tick.c \
../uC/GNU/OS-III/Source/os_time.c \
../uC/GNU/OS-III/Source/os_tmr.c \
../uC/GNU/OS-III/Source/os_var.c 

OBJS += \
./uC/GNU/OS-III/Source/os_cfg_app.o \
./uC/GNU/OS-III/Source/os_core.o \
./uC/GNU/OS-III/Source/os_dbg.o \
./uC/GNU/OS-III/Source/os_flag.o \
./uC/GNU/OS-III/Source/os_int.o \
./uC/GNU/OS-III/Source/os_mem.o \
./uC/GNU/OS-III/Source/os_msg.o \
./uC/GNU/OS-III/Source/os_mutex.o \
./uC/GNU/OS-III/Source/os_pend_multi.o \
./uC/GNU/OS-III/Source/os_prio.o \
./uC/GNU/OS-III/Source/os_q.o \
./uC/GNU/OS-III/Source/os_sem.o \
./uC/GNU/OS-III/Source/os_stat.o \
./uC/GNU/OS-III/Source/os_task.o \
./uC/GNU/OS-III/Source/os_tick.o \
./uC/GNU/OS-III/Source/os_time.o \
./uC/GNU/OS-III/Source/os_tmr.o \
./uC/GNU/OS-III/Source/os_var.o 

C_DEPS += \
./uC/GNU/OS-III/Source/os_cfg_app.d \
./uC/GNU/OS-III/Source/os_core.d \
./uC/GNU/OS-III/Source/os_dbg.d \
./uC/GNU/OS-III/Source/os_flag.d \
./uC/GNU/OS-III/Source/os_int.d \
./uC/GNU/OS-III/Source/os_mem.d \
./uC/GNU/OS-III/Source/os_msg.d \
./uC/GNU/OS-III/Source/os_mutex.d \
./uC/GNU/OS-III/Source/os_pend_multi.d \
./uC/GNU/OS-III/Source/os_prio.d \
./uC/GNU/OS-III/Source/os_q.d \
./uC/GNU/OS-III/Source/os_sem.d \
./uC/GNU/OS-III/Source/os_stat.d \
./uC/GNU/OS-III/Source/os_task.d \
./uC/GNU/OS-III/Source/os_tick.d \
./uC/GNU/OS-III/Source/os_time.d \
./uC/GNU/OS-III/Source/os_tmr.d \
./uC/GNU/OS-III/Source/os_var.d 


# Each subdirectory must supply rules for building sources it contributes
uC/GNU/OS-III/Source/%.o: ../uC/GNU/OS-III/Source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0  -g -DDEBUG_EFM=1 -DEFM32GG990F1024=1 -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\CPU\ARM-Cortex-M3\GNU" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\LIB" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III\Source" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III\Ports\ARM-Cortex-M\ARMv7-M\GNU" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\include" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\cfg" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\Device\SiliconLabs\EFM32GG\Include" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emlib\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\common\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\config" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\rtcdrv\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\CMSIS\Include" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\CPU" -I"F:\Projetos\ARM_IAR_and_GCC\APP\GNU" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


