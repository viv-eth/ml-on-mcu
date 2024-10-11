################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../TFLite/tensorflow/lite/micro/all_ops_resolver.cc \
../TFLite/tensorflow/lite/micro/memory_helpers.cc \
../TFLite/tensorflow/lite/micro/micro_allocator.cc \
../TFLite/tensorflow/lite/micro/micro_error_reporter.cc \
../TFLite/tensorflow/lite/micro/micro_interpreter.cc \
../TFLite/tensorflow/lite/micro/micro_profiler.cc \
../TFLite/tensorflow/lite/micro/micro_string.cc \
../TFLite/tensorflow/lite/micro/micro_time.cc \
../TFLite/tensorflow/lite/micro/micro_utils.cc \
../TFLite/tensorflow/lite/micro/recording_micro_allocator.cc \
../TFLite/tensorflow/lite/micro/recording_simple_memory_allocator.cc \
../TFLite/tensorflow/lite/micro/simple_memory_allocator.cc \
../TFLite/tensorflow/lite/micro/test_helpers.cc 

CC_DEPS += \
./TFLite/tensorflow/lite/micro/all_ops_resolver.d \
./TFLite/tensorflow/lite/micro/memory_helpers.d \
./TFLite/tensorflow/lite/micro/micro_allocator.d \
./TFLite/tensorflow/lite/micro/micro_error_reporter.d \
./TFLite/tensorflow/lite/micro/micro_interpreter.d \
./TFLite/tensorflow/lite/micro/micro_profiler.d \
./TFLite/tensorflow/lite/micro/micro_string.d \
./TFLite/tensorflow/lite/micro/micro_time.d \
./TFLite/tensorflow/lite/micro/micro_utils.d \
./TFLite/tensorflow/lite/micro/recording_micro_allocator.d \
./TFLite/tensorflow/lite/micro/recording_simple_memory_allocator.d \
./TFLite/tensorflow/lite/micro/simple_memory_allocator.d \
./TFLite/tensorflow/lite/micro/test_helpers.d 

OBJS += \
./TFLite/tensorflow/lite/micro/all_ops_resolver.o \
./TFLite/tensorflow/lite/micro/memory_helpers.o \
./TFLite/tensorflow/lite/micro/micro_allocator.o \
./TFLite/tensorflow/lite/micro/micro_error_reporter.o \
./TFLite/tensorflow/lite/micro/micro_interpreter.o \
./TFLite/tensorflow/lite/micro/micro_profiler.o \
./TFLite/tensorflow/lite/micro/micro_string.o \
./TFLite/tensorflow/lite/micro/micro_time.o \
./TFLite/tensorflow/lite/micro/micro_utils.o \
./TFLite/tensorflow/lite/micro/recording_micro_allocator.o \
./TFLite/tensorflow/lite/micro/recording_simple_memory_allocator.o \
./TFLite/tensorflow/lite/micro/simple_memory_allocator.o \
./TFLite/tensorflow/lite/micro/test_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
TFLite/tensorflow/lite/micro/%.o TFLite/tensorflow/lite/micro/%.su TFLite/tensorflow/lite/micro/%.cyclo: ../TFLite/tensorflow/lite/micro/%.cc TFLite/tensorflow/lite/micro/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -c -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Core/tensorflow/lite/micro/tools/make/downloads -I../Core/ -I../Core/Inc -I../Core -I../TFLite -I../TFLite/third_party/flatbuffers/include -I../TFLite/third_party/gemmlowp -I../TFLite/third_party/ruy -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/DSP/Include -I../TFLite/tensorflow/lite/micro/tools/make/downloads/ -I../TFLite/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Include -O3 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-TFLite-2f-tensorflow-2f-lite-2f-micro

clean-TFLite-2f-tensorflow-2f-lite-2f-micro:
	-$(RM) ./TFLite/tensorflow/lite/micro/all_ops_resolver.cyclo ./TFLite/tensorflow/lite/micro/all_ops_resolver.d ./TFLite/tensorflow/lite/micro/all_ops_resolver.o ./TFLite/tensorflow/lite/micro/all_ops_resolver.su ./TFLite/tensorflow/lite/micro/memory_helpers.cyclo ./TFLite/tensorflow/lite/micro/memory_helpers.d ./TFLite/tensorflow/lite/micro/memory_helpers.o ./TFLite/tensorflow/lite/micro/memory_helpers.su ./TFLite/tensorflow/lite/micro/micro_allocator.cyclo ./TFLite/tensorflow/lite/micro/micro_allocator.d ./TFLite/tensorflow/lite/micro/micro_allocator.o ./TFLite/tensorflow/lite/micro/micro_allocator.su ./TFLite/tensorflow/lite/micro/micro_error_reporter.cyclo ./TFLite/tensorflow/lite/micro/micro_error_reporter.d ./TFLite/tensorflow/lite/micro/micro_error_reporter.o ./TFLite/tensorflow/lite/micro/micro_error_reporter.su ./TFLite/tensorflow/lite/micro/micro_interpreter.cyclo ./TFLite/tensorflow/lite/micro/micro_interpreter.d ./TFLite/tensorflow/lite/micro/micro_interpreter.o ./TFLite/tensorflow/lite/micro/micro_interpreter.su ./TFLite/tensorflow/lite/micro/micro_profiler.cyclo ./TFLite/tensorflow/lite/micro/micro_profiler.d ./TFLite/tensorflow/lite/micro/micro_profiler.o ./TFLite/tensorflow/lite/micro/micro_profiler.su ./TFLite/tensorflow/lite/micro/micro_string.cyclo ./TFLite/tensorflow/lite/micro/micro_string.d ./TFLite/tensorflow/lite/micro/micro_string.o ./TFLite/tensorflow/lite/micro/micro_string.su ./TFLite/tensorflow/lite/micro/micro_time.cyclo ./TFLite/tensorflow/lite/micro/micro_time.d ./TFLite/tensorflow/lite/micro/micro_time.o ./TFLite/tensorflow/lite/micro/micro_time.su ./TFLite/tensorflow/lite/micro/micro_utils.cyclo ./TFLite/tensorflow/lite/micro/micro_utils.d ./TFLite/tensorflow/lite/micro/micro_utils.o ./TFLite/tensorflow/lite/micro/micro_utils.su ./TFLite/tensorflow/lite/micro/recording_micro_allocator.cyclo ./TFLite/tensorflow/lite/micro/recording_micro_allocator.d ./TFLite/tensorflow/lite/micro/recording_micro_allocator.o ./TFLite/tensorflow/lite/micro/recording_micro_allocator.su ./TFLite/tensorflow/lite/micro/recording_simple_memory_allocator.cyclo ./TFLite/tensorflow/lite/micro/recording_simple_memory_allocator.d ./TFLite/tensorflow/lite/micro/recording_simple_memory_allocator.o ./TFLite/tensorflow/lite/micro/recording_simple_memory_allocator.su ./TFLite/tensorflow/lite/micro/simple_memory_allocator.cyclo ./TFLite/tensorflow/lite/micro/simple_memory_allocator.d ./TFLite/tensorflow/lite/micro/simple_memory_allocator.o ./TFLite/tensorflow/lite/micro/simple_memory_allocator.su ./TFLite/tensorflow/lite/micro/test_helpers.cyclo ./TFLite/tensorflow/lite/micro/test_helpers.d ./TFLite/tensorflow/lite/micro/test_helpers.o ./TFLite/tensorflow/lite/micro/test_helpers.su

.PHONY: clean-TFLite-2f-tensorflow-2f-lite-2f-micro

