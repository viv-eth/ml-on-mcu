################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Core/Startup/startup_stm32l475vgtx.S 

OBJS += \
./Core/Startup/startup_stm32l475vgtx.o 

S_UPPER_DEPS += \
./Core/Startup/startup_stm32l475vgtx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/%.o: ../Core/Startup/%.S Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32L475xx -DARM_MATH_CM4 -D__FPU_PRESENT=1U -DARM_MATH_DSP -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Core/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/DSP/Include -I../Core/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Include -I../Core/tensorflow/lite/micro/tools/make/downloads/ -I../Core -I../Core/tensorflow/thirdparty/flatbuffers/include -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Startup

clean-Core-2f-Startup:
	-$(RM) ./Core/Startup/startup_stm32l475vgtx.d ./Core/Startup/startup_stm32l475vgtx.o

.PHONY: clean-Core-2f-Startup

