################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/add.cc \
../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/conv.cc \
../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/depthwise_conv.cc \
../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/fully_connected.cc \
../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/mul.cc \
../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/pooling.cc \
../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/softmax.cc \
../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/svdf.cc 

CC_DEPS += \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/add.d \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/conv.d \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/depthwise_conv.d \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/fully_connected.d \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/mul.d \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/pooling.d \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/softmax.d \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/svdf.d 

OBJS += \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/add.o \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/conv.o \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/depthwise_conv.o \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/fully_connected.o \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/mul.o \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/pooling.o \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/softmax.o \
./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/svdf.o 


# Each subdirectory must supply rules for building sources it contributes
TFLite/tensorflow/lite/micro/kernels/cmsis-nn/%.o TFLite/tensorflow/lite/micro/kernels/cmsis-nn/%.su TFLite/tensorflow/lite/micro/kernels/cmsis-nn/%.cyclo: ../TFLite/tensorflow/lite/micro/kernels/cmsis-nn/%.cc TFLite/tensorflow/lite/micro/kernels/cmsis-nn/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -c -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Core/tensorflow/lite/micro/tools/make/downloads -I../Core/ -I../Core/Inc -I../Core -I../TFLite -I../TFLite/third_party/flatbuffers/include -I../TFLite/third_party/gemmlowp -I../TFLite/third_party/ruy -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/DSP/Include -I../TFLite/tensorflow/lite/micro/tools/make/downloads/ -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Include -O3 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-TFLite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis-2d-nn

clean-TFLite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis-2d-nn:
	-$(RM) ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/add.cyclo ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/add.d ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/add.o ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/add.su ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/conv.cyclo ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/conv.d ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/conv.o ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/conv.su ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/depthwise_conv.cyclo ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/depthwise_conv.d ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/depthwise_conv.o ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/depthwise_conv.su ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/fully_connected.cyclo ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/fully_connected.d ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/fully_connected.o ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/fully_connected.su ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/mul.cyclo ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/mul.d ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/mul.o ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/mul.su ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/pooling.cyclo ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/pooling.d ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/pooling.o ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/pooling.su ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/softmax.cyclo ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/softmax.d ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/softmax.o ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/softmax.su ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/svdf.cyclo ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/svdf.d ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/svdf.o ./TFLite/tensorflow/lite/micro/kernels/cmsis-nn/svdf.su

.PHONY: clean-TFLite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis-2d-nn

