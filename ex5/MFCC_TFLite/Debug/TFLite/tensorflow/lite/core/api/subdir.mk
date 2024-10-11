################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../TFLite/tensorflow/lite/core/api/error_reporter.cc \
../TFLite/tensorflow/lite/core/api/flatbuffer_conversions.cc \
../TFLite/tensorflow/lite/core/api/op_resolver.cc \
../TFLite/tensorflow/lite/core/api/tensor_utils.cc 

CC_DEPS += \
./TFLite/tensorflow/lite/core/api/error_reporter.d \
./TFLite/tensorflow/lite/core/api/flatbuffer_conversions.d \
./TFLite/tensorflow/lite/core/api/op_resolver.d \
./TFLite/tensorflow/lite/core/api/tensor_utils.d 

OBJS += \
./TFLite/tensorflow/lite/core/api/error_reporter.o \
./TFLite/tensorflow/lite/core/api/flatbuffer_conversions.o \
./TFLite/tensorflow/lite/core/api/op_resolver.o \
./TFLite/tensorflow/lite/core/api/tensor_utils.o 


# Each subdirectory must supply rules for building sources it contributes
TFLite/tensorflow/lite/core/api/%.o TFLite/tensorflow/lite/core/api/%.su TFLite/tensorflow/lite/core/api/%.cyclo: ../TFLite/tensorflow/lite/core/api/%.cc TFLite/tensorflow/lite/core/api/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -c -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Core/tensorflow/lite/micro/tools/make/downloads -I../Core/ -I../Core/Inc -I../Core -I../TFLite -I../TFLite/third_party/flatbuffers/include -I../TFLite/third_party/gemmlowp -I../TFLite/third_party/ruy -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/DSP/Include -I../TFLite/tensorflow/lite/micro/tools/make/downloads/ -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Include -O3 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-TFLite-2f-tensorflow-2f-lite-2f-core-2f-api

clean-TFLite-2f-tensorflow-2f-lite-2f-core-2f-api:
	-$(RM) ./TFLite/tensorflow/lite/core/api/error_reporter.cyclo ./TFLite/tensorflow/lite/core/api/error_reporter.d ./TFLite/tensorflow/lite/core/api/error_reporter.o ./TFLite/tensorflow/lite/core/api/error_reporter.su ./TFLite/tensorflow/lite/core/api/flatbuffer_conversions.cyclo ./TFLite/tensorflow/lite/core/api/flatbuffer_conversions.d ./TFLite/tensorflow/lite/core/api/flatbuffer_conversions.o ./TFLite/tensorflow/lite/core/api/flatbuffer_conversions.su ./TFLite/tensorflow/lite/core/api/op_resolver.cyclo ./TFLite/tensorflow/lite/core/api/op_resolver.d ./TFLite/tensorflow/lite/core/api/op_resolver.o ./TFLite/tensorflow/lite/core/api/op_resolver.su ./TFLite/tensorflow/lite/core/api/tensor_utils.cyclo ./TFLite/tensorflow/lite/core/api/tensor_utils.d ./TFLite/tensorflow/lite/core/api/tensor_utils.o ./TFLite/tensorflow/lite/core/api/tensor_utils.su

.PHONY: clean-TFLite-2f-tensorflow-2f-lite-2f-core-2f-api

