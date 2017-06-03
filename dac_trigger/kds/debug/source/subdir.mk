################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/KSDK_K82/boards/frdmk82f/driver_examples/pdb/dac_trigger/pdb_dac_trigger.c 

OBJS += \
./source/pdb_dac_trigger.o 

C_DEPS += \
./source/pdb_dac_trigger.d 


# Each subdirectory must supply rules for building sources it contributes
source/pdb_dac_trigger.o: D:/KSDK_K82/boards/frdmk82f/driver_examples/pdb/dac_trigger/pdb_dac_trigger.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


