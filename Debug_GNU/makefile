################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include uC/GNU/OS-III/Source/subdir.mk
-include uC/GNU/OS-III/Ports/ARM-Cortex-M/ARMv7-M/GNU/subdir.mk
-include uC/GNU/LIB/Ports/ARM-Cortex-M3/GNU/subdir.mk
-include uC/GNU/LIB/subdir.mk
-include uC/GNU/CPU/ARM-Cortex-M3/GNU/subdir.mk
-include uC/GNU/CPU/subdir.mk
-include BSP/third_party/efm32/emlib/src/subdir.mk
-include BSP/third_party/efm32/emdrv/rtcdrv/src/subdir.mk
-include BSP/source/startup/subdir.mk
-include BSP/source/subdir.mk
-include APP/GNU/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
ARM_IAR_and_GCC.hex \

SECONDARY_SIZE += \
ARM_IAR_and_GCC.siz \


# All Target
all: ARM_IAR_and_GCC.out

# Tool invocations
ARM_IAR_and_GCC.out: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross ARM C Linker'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0  -g -Xlinker --gc-sections -Wl,-Map,"ARM_IAR_and_GCC.map" --specs=nosys.specs -o "ARM_IAR_and_GCC.out" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

ARM_IAR_and_GCC.hex: ARM_IAR_and_GCC.out
	@echo 'Invoking: Cross ARM GNU Create Flash Image'
	arm-none-eabi-objcopy -O ihex "ARM_IAR_and_GCC.out"  "ARM_IAR_and_GCC.hex"
	@echo 'Finished building: $@'
	@echo ' '

ARM_IAR_and_GCC.siz: ARM_IAR_and_GCC.out
	@echo 'Invoking: Cross ARM GNU Print Size'
	arm-none-eabi-size --format=berkeley "ARM_IAR_and_GCC.out"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) ARM_IAR_and_GCC.out
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
