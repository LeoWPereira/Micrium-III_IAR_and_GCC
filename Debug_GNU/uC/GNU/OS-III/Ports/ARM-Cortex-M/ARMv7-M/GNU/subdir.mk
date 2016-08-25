################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_a.asm 

C_SRCS += \
../uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_c.c 

OBJS += \
./uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_a.o \
./uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_c.o 

ASM_DEPS += \
./uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_a.d 

C_DEPS += \
./uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_c.d 


# Each subdirectory must supply rules for building sources it contributes
uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/%.o: ../uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0  -g -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/%.o: ../uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0  -g -DDEBUG_EFM=1 -DEFM32GG990F1024=1 -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\CPU\ARM-Cortex-M3\GNU" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\LIB" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III\Source" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III\Ports\ARM-Cortex-M\ARMv7-M\GNU" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\include" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\cfg" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\Device\SiliconLabs\EFM32GG\Include" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emlib\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\common\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\config" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\rtcdrv\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\CMSIS\Include" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\CPU" -I"F:\Projetos\ARM_IAR_and_GCC\APP\GNU" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


