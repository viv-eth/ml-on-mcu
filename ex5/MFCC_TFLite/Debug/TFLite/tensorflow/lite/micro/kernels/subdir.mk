################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../TFLite/tensorflow/lite/micro/kernels/activations.cc \
../TFLite/tensorflow/lite/micro/kernels/arg_min_max.cc \
../TFLite/tensorflow/lite/micro/kernels/ceil.cc \
../TFLite/tensorflow/lite/micro/kernels/circular_buffer.cc \
../TFLite/tensorflow/lite/micro/kernels/comparisons.cc \
../TFLite/tensorflow/lite/micro/kernels/concatenation.cc \
../TFLite/tensorflow/lite/micro/kernels/dequantize.cc \
../TFLite/tensorflow/lite/micro/kernels/elementwise.cc \
../TFLite/tensorflow/lite/micro/kernels/ethosu.cc \
../TFLite/tensorflow/lite/micro/kernels/floor.cc \
../TFLite/tensorflow/lite/micro/kernels/hard_swish.cc \
../TFLite/tensorflow/lite/micro/kernels/kernel_runner.cc \
../TFLite/tensorflow/lite/micro/kernels/kernel_util.cc \
../TFLite/tensorflow/lite/micro/kernels/l2norm.cc \
../TFLite/tensorflow/lite/micro/kernels/logical.cc \
../TFLite/tensorflow/lite/micro/kernels/logistic.cc \
../TFLite/tensorflow/lite/micro/kernels/maximum_minimum.cc \
../TFLite/tensorflow/lite/micro/kernels/neg.cc \
../TFLite/tensorflow/lite/micro/kernels/pack.cc \
../TFLite/tensorflow/lite/micro/kernels/pad.cc \
../TFLite/tensorflow/lite/micro/kernels/prelu.cc \
../TFLite/tensorflow/lite/micro/kernels/quantize.cc \
../TFLite/tensorflow/lite/micro/kernels/reduce.cc \
../TFLite/tensorflow/lite/micro/kernels/reshape.cc \
../TFLite/tensorflow/lite/micro/kernels/resize_nearest_neighbor.cc \
../TFLite/tensorflow/lite/micro/kernels/round.cc \
../TFLite/tensorflow/lite/micro/kernels/shape.cc \
../TFLite/tensorflow/lite/micro/kernels/split.cc \
../TFLite/tensorflow/lite/micro/kernels/split_v.cc \
../TFLite/tensorflow/lite/micro/kernels/strided_slice.cc \
../TFLite/tensorflow/lite/micro/kernels/sub.cc \
../TFLite/tensorflow/lite/micro/kernels/tanh.cc \
../TFLite/tensorflow/lite/micro/kernels/unpack.cc 

CC_DEPS += \
./TFLite/tensorflow/lite/micro/kernels/activations.d \
./TFLite/tensorflow/lite/micro/kernels/arg_min_max.d \
./TFLite/tensorflow/lite/micro/kernels/ceil.d \
./TFLite/tensorflow/lite/micro/kernels/circular_buffer.d \
./TFLite/tensorflow/lite/micro/kernels/comparisons.d \
./TFLite/tensorflow/lite/micro/kernels/concatenation.d \
./TFLite/tensorflow/lite/micro/kernels/dequantize.d \
./TFLite/tensorflow/lite/micro/kernels/elementwise.d \
./TFLite/tensorflow/lite/micro/kernels/ethosu.d \
./TFLite/tensorflow/lite/micro/kernels/floor.d \
./TFLite/tensorflow/lite/micro/kernels/hard_swish.d \
./TFLite/tensorflow/lite/micro/kernels/kernel_runner.d \
./TFLite/tensorflow/lite/micro/kernels/kernel_util.d \
./TFLite/tensorflow/lite/micro/kernels/l2norm.d \
./TFLite/tensorflow/lite/micro/kernels/logical.d \
./TFLite/tensorflow/lite/micro/kernels/logistic.d \
./TFLite/tensorflow/lite/micro/kernels/maximum_minimum.d \
./TFLite/tensorflow/lite/micro/kernels/neg.d \
./TFLite/tensorflow/lite/micro/kernels/pack.d \
./TFLite/tensorflow/lite/micro/kernels/pad.d \
./TFLite/tensorflow/lite/micro/kernels/prelu.d \
./TFLite/tensorflow/lite/micro/kernels/quantize.d \
./TFLite/tensorflow/lite/micro/kernels/reduce.d \
./TFLite/tensorflow/lite/micro/kernels/reshape.d \
./TFLite/tensorflow/lite/micro/kernels/resize_nearest_neighbor.d \
./TFLite/tensorflow/lite/micro/kernels/round.d \
./TFLite/tensorflow/lite/micro/kernels/shape.d \
./TFLite/tensorflow/lite/micro/kernels/split.d \
./TFLite/tensorflow/lite/micro/kernels/split_v.d \
./TFLite/tensorflow/lite/micro/kernels/strided_slice.d \
./TFLite/tensorflow/lite/micro/kernels/sub.d \
./TFLite/tensorflow/lite/micro/kernels/tanh.d \
./TFLite/tensorflow/lite/micro/kernels/unpack.d 

OBJS += \
./TFLite/tensorflow/lite/micro/kernels/activations.o \
./TFLite/tensorflow/lite/micro/kernels/arg_min_max.o \
./TFLite/tensorflow/lite/micro/kernels/ceil.o \
./TFLite/tensorflow/lite/micro/kernels/circular_buffer.o \
./TFLite/tensorflow/lite/micro/kernels/comparisons.o \
./TFLite/tensorflow/lite/micro/kernels/concatenation.o \
./TFLite/tensorflow/lite/micro/kernels/dequantize.o \
./TFLite/tensorflow/lite/micro/kernels/elementwise.o \
./TFLite/tensorflow/lite/micro/kernels/ethosu.o \
./TFLite/tensorflow/lite/micro/kernels/floor.o \
./TFLite/tensorflow/lite/micro/kernels/hard_swish.o \
./TFLite/tensorflow/lite/micro/kernels/kernel_runner.o \
./TFLite/tensorflow/lite/micro/kernels/kernel_util.o \
./TFLite/tensorflow/lite/micro/kernels/l2norm.o \
./TFLite/tensorflow/lite/micro/kernels/logical.o \
./TFLite/tensorflow/lite/micro/kernels/logistic.o \
./TFLite/tensorflow/lite/micro/kernels/maximum_minimum.o \
./TFLite/tensorflow/lite/micro/kernels/neg.o \
./TFLite/tensorflow/lite/micro/kernels/pack.o \
./TFLite/tensorflow/lite/micro/kernels/pad.o \
./TFLite/tensorflow/lite/micro/kernels/prelu.o \
./TFLite/tensorflow/lite/micro/kernels/quantize.o \
./TFLite/tensorflow/lite/micro/kernels/reduce.o \
./TFLite/tensorflow/lite/micro/kernels/reshape.o \
./TFLite/tensorflow/lite/micro/kernels/resize_nearest_neighbor.o \
./TFLite/tensorflow/lite/micro/kernels/round.o \
./TFLite/tensorflow/lite/micro/kernels/shape.o \
./TFLite/tensorflow/lite/micro/kernels/split.o \
./TFLite/tensorflow/lite/micro/kernels/split_v.o \
./TFLite/tensorflow/lite/micro/kernels/strided_slice.o \
./TFLite/tensorflow/lite/micro/kernels/sub.o \
./TFLite/tensorflow/lite/micro/kernels/tanh.o \
./TFLite/tensorflow/lite/micro/kernels/unpack.o 


# Each subdirectory must supply rules for building sources it contributes
TFLite/tensorflow/lite/micro/kernels/%.o TFLite/tensorflow/lite/micro/kernels/%.su TFLite/tensorflow/lite/micro/kernels/%.cyclo: ../TFLite/tensorflow/lite/micro/kernels/%.cc TFLite/tensorflow/lite/micro/kernels/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -c -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Core/tensorflow/lite/micro/tools/make/downloads -I../Core/ -I../Core/Inc -I../Core -I../TFLite -I../TFLite/third_party/flatbuffers/include -I../TFLite/third_party/gemmlowp -I../TFLite/third_party/ruy -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/DSP/Include -I../TFLite/tensorflow/lite/micro/tools/make/downloads/ -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Include -O3 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-TFLite-2f-tensorflow-2f-lite-2f-micro-2f-kernels

clean-TFLite-2f-tensorflow-2f-lite-2f-micro-2f-kernels:
	-$(RM) ./TFLite/tensorflow/lite/micro/kernels/activations.cyclo ./TFLite/tensorflow/lite/micro/kernels/activations.d ./TFLite/tensorflow/lite/micro/kernels/activations.o ./TFLite/tensorflow/lite/micro/kernels/activations.su ./TFLite/tensorflow/lite/micro/kernels/arg_min_max.cyclo ./TFLite/tensorflow/lite/micro/kernels/arg_min_max.d ./TFLite/tensorflow/lite/micro/kernels/arg_min_max.o ./TFLite/tensorflow/lite/micro/kernels/arg_min_max.su ./TFLite/tensorflow/lite/micro/kernels/ceil.cyclo ./TFLite/tensorflow/lite/micro/kernels/ceil.d ./TFLite/tensorflow/lite/micro/kernels/ceil.o ./TFLite/tensorflow/lite/micro/kernels/ceil.su ./TFLite/tensorflow/lite/micro/kernels/circular_buffer.cyclo ./TFLite/tensorflow/lite/micro/kernels/circular_buffer.d ./TFLite/tensorflow/lite/micro/kernels/circular_buffer.o ./TFLite/tensorflow/lite/micro/kernels/circular_buffer.su ./TFLite/tensorflow/lite/micro/kernels/comparisons.cyclo ./TFLite/tensorflow/lite/micro/kernels/comparisons.d ./TFLite/tensorflow/lite/micro/kernels/comparisons.o ./TFLite/tensorflow/lite/micro/kernels/comparisons.su ./TFLite/tensorflow/lite/micro/kernels/concatenation.cyclo ./TFLite/tensorflow/lite/micro/kernels/concatenation.d ./TFLite/tensorflow/lite/micro/kernels/concatenation.o ./TFLite/tensorflow/lite/micro/kernels/concatenation.su ./TFLite/tensorflow/lite/micro/kernels/dequantize.cyclo ./TFLite/tensorflow/lite/micro/kernels/dequantize.d ./TFLite/tensorflow/lite/micro/kernels/dequantize.o ./TFLite/tensorflow/lite/micro/kernels/dequantize.su ./TFLite/tensorflow/lite/micro/kernels/elementwise.cyclo ./TFLite/tensorflow/lite/micro/kernels/elementwise.d ./TFLite/tensorflow/lite/micro/kernels/elementwise.o ./TFLite/tensorflow/lite/micro/kernels/elementwise.su ./TFLite/tensorflow/lite/micro/kernels/ethosu.cyclo ./TFLite/tensorflow/lite/micro/kernels/ethosu.d ./TFLite/tensorflow/lite/micro/kernels/ethosu.o ./TFLite/tensorflow/lite/micro/kernels/ethosu.su ./TFLite/tensorflow/lite/micro/kernels/floor.cyclo ./TFLite/tensorflow/lite/micro/kernels/floor.d ./TFLite/tensorflow/lite/micro/kernels/floor.o ./TFLite/tensorflow/lite/micro/kernels/floor.su ./TFLite/tensorflow/lite/micro/kernels/hard_swish.cyclo ./TFLite/tensorflow/lite/micro/kernels/hard_swish.d ./TFLite/tensorflow/lite/micro/kernels/hard_swish.o ./TFLite/tensorflow/lite/micro/kernels/hard_swish.su ./TFLite/tensorflow/lite/micro/kernels/kernel_runner.cyclo ./TFLite/tensorflow/lite/micro/kernels/kernel_runner.d ./TFLite/tensorflow/lite/micro/kernels/kernel_runner.o ./TFLite/tensorflow/lite/micro/kernels/kernel_runner.su ./TFLite/tensorflow/lite/micro/kernels/kernel_util.cyclo ./TFLite/tensorflow/lite/micro/kernels/kernel_util.d ./TFLite/tensorflow/lite/micro/kernels/kernel_util.o ./TFLite/tensorflow/lite/micro/kernels/kernel_util.su ./TFLite/tensorflow/lite/micro/kernels/l2norm.cyclo ./TFLite/tensorflow/lite/micro/kernels/l2norm.d ./TFLite/tensorflow/lite/micro/kernels/l2norm.o ./TFLite/tensorflow/lite/micro/kernels/l2norm.su ./TFLite/tensorflow/lite/micro/kernels/logical.cyclo ./TFLite/tensorflow/lite/micro/kernels/logical.d ./TFLite/tensorflow/lite/micro/kernels/logical.o ./TFLite/tensorflow/lite/micro/kernels/logical.su ./TFLite/tensorflow/lite/micro/kernels/logistic.cyclo ./TFLite/tensorflow/lite/micro/kernels/logistic.d ./TFLite/tensorflow/lite/micro/kernels/logistic.o ./TFLite/tensorflow/lite/micro/kernels/logistic.su ./TFLite/tensorflow/lite/micro/kernels/maximum_minimum.cyclo ./TFLite/tensorflow/lite/micro/kernels/maximum_minimum.d ./TFLite/tensorflow/lite/micro/kernels/maximum_minimum.o ./TFLite/tensorflow/lite/micro/kernels/maximum_minimum.su ./TFLite/tensorflow/lite/micro/kernels/neg.cyclo ./TFLite/tensorflow/lite/micro/kernels/neg.d ./TFLite/tensorflow/lite/micro/kernels/neg.o ./TFLite/tensorflow/lite/micro/kernels/neg.su ./TFLite/tensorflow/lite/micro/kernels/pack.cyclo ./TFLite/tensorflow/lite/micro/kernels/pack.d ./TFLite/tensorflow/lite/micro/kernels/pack.o ./TFLite/tensorflow/lite/micro/kernels/pack.su ./TFLite/tensorflow/lite/micro/kernels/pad.cyclo ./TFLite/tensorflow/lite/micro/kernels/pad.d ./TFLite/tensorflow/lite/micro/kernels/pad.o ./TFLite/tensorflow/lite/micro/kernels/pad.su ./TFLite/tensorflow/lite/micro/kernels/prelu.cyclo ./TFLite/tensorflow/lite/micro/kernels/prelu.d ./TFLite/tensorflow/lite/micro/kernels/prelu.o ./TFLite/tensorflow/lite/micro/kernels/prelu.su ./TFLite/tensorflow/lite/micro/kernels/quantize.cyclo ./TFLite/tensorflow/lite/micro/kernels/quantize.d ./TFLite/tensorflow/lite/micro/kernels/quantize.o ./TFLite/tensorflow/lite/micro/kernels/quantize.su ./TFLite/tensorflow/lite/micro/kernels/reduce.cyclo ./TFLite/tensorflow/lite/micro/kernels/reduce.d ./TFLite/tensorflow/lite/micro/kernels/reduce.o ./TFLite/tensorflow/lite/micro/kernels/reduce.su ./TFLite/tensorflow/lite/micro/kernels/reshape.cyclo ./TFLite/tensorflow/lite/micro/kernels/reshape.d ./TFLite/tensorflow/lite/micro/kernels/reshape.o ./TFLite/tensorflow/lite/micro/kernels/reshape.su ./TFLite/tensorflow/lite/micro/kernels/resize_nearest_neighbor.cyclo ./TFLite/tensorflow/lite/micro/kernels/resize_nearest_neighbor.d ./TFLite/tensorflow/lite/micro/kernels/resize_nearest_neighbor.o ./TFLite/tensorflow/lite/micro/kernels/resize_nearest_neighbor.su ./TFLite/tensorflow/lite/micro/kernels/round.cyclo ./TFLite/tensorflow/lite/micro/kernels/round.d ./TFLite/tensorflow/lite/micro/kernels/round.o ./TFLite/tensorflow/lite/micro/kernels/round.su ./TFLite/tensorflow/lite/micro/kernels/shape.cyclo ./TFLite/tensorflow/lite/micro/kernels/shape.d ./TFLite/tensorflow/lite/micro/kernels/shape.o ./TFLite/tensorflow/lite/micro/kernels/shape.su ./TFLite/tensorflow/lite/micro/kernels/split.cyclo ./TFLite/tensorflow/lite/micro/kernels/split.d ./TFLite/tensorflow/lite/micro/kernels/split.o ./TFLite/tensorflow/lite/micro/kernels/split.su ./TFLite/tensorflow/lite/micro/kernels/split_v.cyclo ./TFLite/tensorflow/lite/micro/kernels/split_v.d ./TFLite/tensorflow/lite/micro/kernels/split_v.o
	-$(RM) ./TFLite/tensorflow/lite/micro/kernels/split_v.su ./TFLite/tensorflow/lite/micro/kernels/strided_slice.cyclo ./TFLite/tensorflow/lite/micro/kernels/strided_slice.d ./TFLite/tensorflow/lite/micro/kernels/strided_slice.o ./TFLite/tensorflow/lite/micro/kernels/strided_slice.su ./TFLite/tensorflow/lite/micro/kernels/sub.cyclo ./TFLite/tensorflow/lite/micro/kernels/sub.d ./TFLite/tensorflow/lite/micro/kernels/sub.o ./TFLite/tensorflow/lite/micro/kernels/sub.su ./TFLite/tensorflow/lite/micro/kernels/tanh.cyclo ./TFLite/tensorflow/lite/micro/kernels/tanh.d ./TFLite/tensorflow/lite/micro/kernels/tanh.o ./TFLite/tensorflow/lite/micro/kernels/tanh.su ./TFLite/tensorflow/lite/micro/kernels/unpack.cyclo ./TFLite/tensorflow/lite/micro/kernels/unpack.d ./TFLite/tensorflow/lite/micro/kernels/unpack.o ./TFLite/tensorflow/lite/micro/kernels/unpack.su

.PHONY: clean-TFLite-2f-tensorflow-2f-lite-2f-micro-2f-kernels

