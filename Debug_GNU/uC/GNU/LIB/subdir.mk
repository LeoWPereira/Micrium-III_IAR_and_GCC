################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../uC/GNU/LIB/lib_ascii.c \
../uC/GNU/LIB/lib_math.c \
../uC/GNU/LIB/lib_mem.c \
../uC/GNU/LIB/lib_str.c 

OBJS += \
./uC/GNU/LIB/lib_ascii.o \
./uC/GNU/LIB/lib_math.o \
./uC/GNU/LIB/lib_mem.o \
./uC/GNU/LIB/lib_str.o 

C_DEPS += \
./uC/GNU/LIB/lib_ascii.d \
./uC/GNU/LIB/lib_math.d \
./uC/GNU/LIB/lib_mem.d \
./uC/GNU/LIB/lib_str.d 


# Each subdirectory must supply rules for building sources it contributes
uC/GNU/LIB/%.o: ../uC/GNU/LIB/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0  -g -DDEBUG_EFM=1 -DEFM32GG990F1024=1 -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\CPU\ARM-Cortex-M3\GNU" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\LIB" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III\Source" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\OS-III\Ports\ARM-Cortex-M\ARMv7-M\GNU" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\include" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\cfg" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\Device\SiliconLabs\EFM32GG\Include" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emlib\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\common\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\config" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\emdrv\rtcdrv\inc" -I"F:\Projetos\ARM_IAR_and_GCC\BSP\third_party\efm32\CMSIS\Include" -I"F:\Projetos\ARM_IAR_and_GCC\uC\GNU\CPU" -I"F:\Projetos\ARM_IAR_and_GCC\APP\GNU" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


