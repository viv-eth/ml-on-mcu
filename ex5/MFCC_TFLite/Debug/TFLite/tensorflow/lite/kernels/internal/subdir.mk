################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../TFLite/tensorflow/lite/kernels/internal/quantization_util.cc 

CC_DEPS += \
./TFLite/tensorflow/lite/kernels/internal/quantization_util.d 

OBJS += \
./TFLite/tensorflow/lite/kernels/internal/quantization_util.o 


# Each subdirectory must supply rules for building sources it contributes
TFLite/tensorflow/lite/kernels/internal/%.o TFLite/tensorflow/lite/kernels/internal/%.su TFLite/tensorflow/lite/kernels/internal/%.cyclo: ../TFLite/tensorflow/lite/kernels/internal/%.cc TFLite/tensorflow/lite/kernels/internal/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -c -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Core/tensorflow/lite/micro/tools/make/downloads -I../Core/ -I../Core/Inc -I../Core -I../TFLite -I../TFLite/third_party/flatbuffers/include -I../TFLite/third_party/gemmlowp -I../TFLite/third_party/ruy -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/DSP/Include -I../TFLite/tensorflow/lite/micro/tools/make/downloads/ -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Include -O3 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-TFLite-2f-tensorflow-2f-lite-2f-kernels-2f-internal

clean-TFLite-2f-tensorflow-2f-lite-2f-kernels-2f-internal:
	-$(RM) ./TFLite/tensorflow/lite/kernels/internal/quantization_util.cyclo ./TFLite/tensorflow/lite/kernels/internal/quantization_util.d ./TFLite/tensorflow/lite/kernels/internal/quantization_util.o ./TFLite/tensorflow/lite/kernels/internal/quantization_util.su

.PHONY: clean-TFLite-2f-tensorflow-2f-lite-2f-kernels-2f-internal

