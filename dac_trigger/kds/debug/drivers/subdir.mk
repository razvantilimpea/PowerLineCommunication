################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/KSDK_K82/devices/MK82F25615/drivers/fsl_clock.c \
D:/KSDK_K82/devices/MK82F25615/drivers/fsl_common.c \
D:/KSDK_K82/devices/MK82F25615/drivers/fsl_dac.c \
D:/KSDK_K82/devices/MK82F25615/drivers/fsl_gpio.c \
D:/KSDK_K82/devices/MK82F25615/drivers/fsl_lptmr.c \
D:/KSDK_K82/devices/MK82F25615/drivers/fsl_lpuart.c \
D:/KSDK_K82/devices/MK82F25615/drivers/fsl_pdb.c \
D:/KSDK_K82/devices/MK82F25615/drivers/fsl_smc.c 

OBJS += \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_dac.o \
./drivers/fsl_gpio.o \
./drivers/fsl_lptmr.o \
./drivers/fsl_lpuart.o \
./drivers/fsl_pdb.o \
./drivers/fsl_smc.o 

C_DEPS += \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_dac.d \
./drivers/fsl_gpio.d \
./drivers/fsl_lptmr.d \
./drivers/fsl_lpuart.d \
./drivers/fsl_pdb.d \
./drivers/fsl_smc.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/fsl_clock.o: D:/KSDK_K82/devices/MK82F25615/drivers/fsl_clock.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/fsl_common.o: D:/KSDK_K82/devices/MK82F25615/drivers/fsl_common.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/fsl_dac.o: D:/KSDK_K82/devices/MK82F25615/drivers/fsl_dac.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/fsl_gpio.o: D:/KSDK_K82/devices/MK82F25615/drivers/fsl_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/fsl_lptmr.o: D:/KSDK_K82/devices/MK82F25615/drivers/fsl_lptmr.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/fsl_lpuart.o: D:/KSDK_K82/devices/MK82F25615/drivers/fsl_lpuart.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/fsl_pdb.o: D:/KSDK_K82/devices/MK82F25615/drivers/fsl_pdb.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/fsl_smc.o: D:/KSDK_K82/devices/MK82F25615/drivers/fsl_smc.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -DDEBUG -DCPU_MK82FN256VDC15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../../../../../../../devices/MK82F25615/drivers -I../.. -I../../../../../../../devices/MK82F25615/utilities -I../../../../.. -I../../../../../../../devices/MK82F25615 -std=gnu99 -fno-common  -ffreestanding  -fno-builtin  -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


