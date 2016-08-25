################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../uC/GNU/LIB/Ports/ARM-Cortex-M3/GNU/lib_mem_a.asm 

OBJS += \
./uC/GNU/LIB/Ports/ARM-Cortex-M3/GNU/lib_mem_a.o 

ASM_DEPS += \
./uC/GNU/LIB/Ports/ARM-Cortex-M3/GNU/lib_mem_a.d 


# Each subdirectory must supply rules for building sources it contributes
uC/GNU/LIB/Ports/ARM-Cortex-M3/GNU/%.o: ../uC/GNU/LIB/Ports/ARM-Cortex-M3/GNU/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0  -g -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


