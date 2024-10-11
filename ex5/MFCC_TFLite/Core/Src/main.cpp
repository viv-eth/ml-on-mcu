/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <string.h>

#define ARM_MATH_CM4
#define ARM_MATH_DSP
#define CMSIS_NN
#define TF_LITE_USE_GLOBAL_CMATH_FUNCTIONS
#define TF_LITE_USE_GLOBAL_MAX
#define TF_LITE_USE_GLOBAL_MIN

#ifdef __GNUC__
/* With GCC/RAISONANCE, small msg_info (option LD Linker->Libraries->Small msg_info
   set to 'Yes') calls __io_putchar() */
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#define GETCHAR_PROTOTYPE int __io_getchar(void)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#define GETCHAR_PROTOTYPE int fgetc(FILE *f)
#endif /* __GNUC__ */

#include "tensorflow/lite/micro/kernels/micro_ops.h"
//#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "tensorflow/lite/micro/micro_mutable_op_resolver.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/micro_mutable_op_resolver.h"
#include "tensorflow/lite/version.h"
#include "MFCC.h"
#include "CycleCounter.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart1;

PUTCHAR_PROTOTYPE
{
  /* Place your implementation of fputc here */
  /* e.g. write a character to the serial port and Loop until the end of transmission */
  while (HAL_OK != HAL_UART_Transmit(&huart1, (uint8_t *) &ch, 1, 30000))
  {
    ;
  }
  return ch;
}

/* USER CODE BEGIN PV */


namespace {
  tflite::ErrorReporter* error_reporter = nullptr;
  const tflite::Model* model = nullptr;
  tflite::MicroInterpreter* interpreter = nullptr;
  TfLiteTensor* model_input = nullptr;
  TfLiteTensor* model_output = nullptr;

  // Create an area of memory to use for input, output, and other TensorFlow
  // arrays. You'll need to adjust this by compiling, running, and looking
  // for errors.

} // namespace
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART1_UART_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
  char buf[50];
  int buf_len = 0;
  TfLiteStatus tflite_status;
  uint32_t num_elements;
  uint32_t num_output_elements;
  int8_t y_val_0;
  int8_t y_val_1;
  const int kTensorArenaSize = 30 * 1024;
  static uint8_t tensor_arena[kTensorArenaSize];
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART1_UART_Init();
  /* USER CODE BEGIN 2 */
  // Set up logging (modify tensorflow/lite/experimental/micro/debug_log.cc)
  static tflite::MicroErrorReporter micro_error_reporter;
  error_reporter = &micro_error_reporter;
  // Say something to test error reporter
  buf_len = sprintf(buf, "START TEST\r\n");
  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
  error_reporter->Report("STM32 TensorFlow Lite test");
  // Map the model into a usable data structure
  model = tflite::GetModel(MFCC);
  if (model->version() != TFLITE_SCHEMA_VERSION)
  {
    error_reporter->Report("Model version does not match Schema");
	while(1);
  }

	 //Pull in only needed operations (should match NN layers). Template parameter
	 //<n> is number of ops to be added. Available ops:
	 //tensorflow/lite/experimental/micro/kernels/micro_ops.h

  //tflite::AllOpsResolver resolver;
  tflite::MicroMutableOpResolver<6> micro_op_resolver;
  //tflite::MicroMutableOpResolver<4>resolver;
	  // Add dense neural network layer operation
  tflite_status = micro_op_resolver.AddFullyConnected();
  if (tflite_status != kTfLiteOk)
  {
	error_reporter->Report("Could not add FULLY CONNECTED op");
	while(1);
  }
  tflite_status = micro_op_resolver.AddConv2D();
  if (tflite_status != kTfLiteOk)
  {
  	error_reporter->Report("Could not add CONV2D op");
  	while(1);
  }

  tflite_status =micro_op_resolver.AddReshape();
  if (tflite_status != kTfLiteOk)
  {
  	error_reporter->Report("Could not add RESHAPE op");
  	while(1);
  }
  tflite_status = micro_op_resolver.AddMaxPool2D();
  if (tflite_status != kTfLiteOk)
  {
	error_reporter->Report("Could not add MaxPool op");
	while(1);
  }
  tflite_status = micro_op_resolver.AddMean();
  if (tflite_status != kTfLiteOk)
  {
	  error_reporter->Report("Could not add Mean op");
	  while(1);
  }
  tflite_status = micro_op_resolver.AddSoftmax();
  if (tflite_status != kTfLiteOk)
	{
	  error_reporter->Report("Could not add Softmax op");
	  while(1);
	}
  buf_len = sprintf(buf, "ALL ADDED RIGHT\r\n");
  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
 //Build an interpreter to run the model with.
  buf_len = sprintf(buf, "Interpreter\r\n");
  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
  static tflite::MicroInterpreter static_interpreter(
	  model, micro_op_resolver, tensor_arena, kTensorArenaSize, error_reporter);
  interpreter = &static_interpreter;
  buf_len = sprintf(buf, "Successful\r\n");
  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
  // Allocate memory from the tensor_arena for the model's tensors.
  buf_len = sprintf(buf, "Tensors\r\n");
  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
  tflite_status = interpreter->AllocateTensors();
  if (tflite_status != kTfLiteOk)
  {
	buf_len = sprintf(buf, "Failed tensors\r\n");
	HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
	error_reporter->Report("AllocateTensors() failed");
	while(1);
  }
  buf_len = sprintf(buf, "Successful\r\n");
  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
  // Assign model input and output buffers (tensors) to pointers
  model_input = interpreter->input(0);
  model_output = interpreter->output(0);
  float input_size = model_input->dims->size;
  buf_len = sprintf(buf, "Model input size: %f\r\n", input_size);
  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
  // Get number of elements in input tensor
  num_elements = model_input->bytes / sizeof(int) * 4;
  buf_len = sprintf(buf, "Number of input elements: %lu\r\n", num_elements);
  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  buf_len = sprintf(buf, "In while loop\r\n");
	  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
	  signed char test[] = {
	   64, 27, 26, 24, 26, 28, 28, 25, 24, 25, 26, 26,
	    25, 63, 27, 25, 23, 26, 29, 29, 26, 24, 25, 26,
	    26, 25, 65, 25, 24, 26, 26, 26, 26, 26, 25, 26,
	    27, 26, 25, 108, 28, 19, 25, 22, 25, 22, 26, 23,
	    26, 23, 25, 24, 110, 24, 18, 26, 22, 26, 23, 26,
	    24, 26, 24, 24, 25, 108, 24, 21, 25, 21, 26, 23,
	    24, 23, 26, 24, 24, 24, 116, 24, 18, 26, 21, 27,
	    24, 25, 24, 27, 24, 24, 23, 113, 26, 20, 25, 20,
	    27, 25, 25, 23, 27, 25, 26, 25, 112, 27, 21, 25,
	    19, 27, 25, 26, 23, 27, 24, 26, 25, 104, 30, 21,
	    25, 21, 25, 24, 26, 23, 26, 24, 26, 25, 92, 32,
	    23, 25, 23, 25, 25, 25, 23, 27, 24, 26, 26, 101,
	    30, 21, 25, 23, 26, 24, 26, 23, 26, 26, 26, 25,
	    102, 28, 21, 26, 21, 27, 25, 26, 23, 26, 25, 25,
	    25, 105, 27, 20, 26, 20, 27, 25, 25, 23, 27, 25,
	    25, 24, 108, 26, 19, 26, 22, 27, 24, 25, 24, 27,
	    25, 24, 24, 106, 25, 19, 28, 23, 26, 23, 26, 25,
	    26, 25, 25, 25, 105, 24, 20, 29, 22, 25, 22, 26,
	    23, 26, 26, 25, 25, 98, 25, 22, 30, 23, 25, 22,
	    26, 23, 27, 25, 25, 25, 91, 26, 23, 29, 23, 25,
	    23, 26, 25, 27, 26, 25, 25, 76, 28, 24, 28, 24,
	    23, 24, 25, 26, 26, 26, 25, 26, 89, 24, 24, 27,
	    23, 26, 23, 25, 24, 26, 25, 25, 24, 106, 27, 18,
	    26, 23, 27, 23, 25, 25, 26, 25, 25, 24, 105, 29,
	    16, 26, 22, 29, 23, 24, 27, 25, 25, 24, 25, 108,
	    26, 17, 26, 22, 28, 23, 25, 25, 26, 25, 24, 24,
	    107, 25, 19, 26, 22, 28, 23, 25, 25, 27, 26, 24,
	    24, 108, 24, 20, 27, 21, 26, 22, 26, 25, 27, 24,
	    24, 25, 104, 24, 21, 28, 20, 26, 24, 25, 24, 26,
	    25, 25, 24, 98, 28, 21, 27, 22, 27, 24, 25, 23,
	    26, 25, 25, 24, 91, 30, 22, 26, 23, 26, 24, 24,
	    24, 25, 25, 25, 25, 83, 31, 22, 24, 23, 27, 25,
	    23, 25, 25, 26, 24, 24, 73, 31, 25, 22, 24, 25,
	    25, 24, 24, 25, 26, 24, 25, 66, 28, 24, 23, 25,
	    26, 24, 24, 26, 26, 25, 25, 25, 62, 24, 24, 23,
	    26, 27, 25, 24, 25, 25, 25, 25, 26, 63, 24, 24,
	    24, 27, 28, 25, 24, 25, 25, 25, 26, 27, 61, 24,
	    23, 23, 27, 28, 27, 25, 25, 25, 25, 26, 27, 63,
	    25, 24, 23, 26, 27, 26, 25, 26, 26, 26, 26, 26,
	    59, 24, 25, 24, 25, 26, 26, 26, 26, 26, 26, 25,
	    26, 89, 25, 27, 25, 23, 25, 23, 25, 22, 26, 25,
	    24, 24, 102, 28, 19, 25, 21, 27, 23, 25, 24, 24,
	    27, 25, 24, 104, 28, 18, 26, 23, 28, 22, 24, 25,
	    25, 26, 25, 25, 108, 23, 24, 26, 24, 26, 22, 25,
	    24, 26, 24, 25, 25, 102, 23, 25, 24, 24, 25, 21,
	    24, 23, 26, 24, 25, 24, 107, 25, 18, 26, 22, 27,
	    23, 25, 24, 27, 25, 25, 24, 105, 28, 18, 27, 23,
	    26, 23, 25, 24, 26, 25, 25, 24, 108, 27, 20, 29,
	    21, 26, 23, 27, 24, 26, 25, 26, 25, 108, 25, 20,
	    30, 20, 25, 23, 27, 24, 26, 25, 25, 25, 110, 25,
	    18, 30, 22, 24, 23, 26, 24, 26, 26, 26, 25, 107,
	    27, 18, 28, 23, 24, 23, 27, 26, 26, 26, 26, 25,
	    107, 30, 16, 28, 23, 26, 22, 26, 27, 25, 26, 25,
	    25, 103, 31, 17, 26, 24, 25, 23, 25, 28, 25, 26,
	    25, 26, 92, 33, 20, 25, 27, 24, 24, 25, 28, 25,
	    24, 25, 24, 81, 31, 19, 24, 27, 24, 23, 25, 26,
	    26, 25, 25, 24, 69, 27, 22, 24, 27, 24, 23, 26,
	    28, 26, 25, 25, 24, 63, 25, 25, 26, 27, 25, 25,
	    27, 28, 27, 26, 26, 26, 54, 23, 26, 26, 26, 26,
	    25, 26, 27, 26, 25, 25, 26, 42, 22, 25, 25, 26,
	    26, 26, 26, 25, 25, 25, 25, 25, 52, 24, 27, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 25, 43, 23, 26,
	    25, 26, 26, 25, 25, 26, 25, 25, 26, 25, 36, 22,
	    26, 25, 26, 25, 26, 25, 26, 25, 26, 26, 26, 36,
	    23, 25, 26, 25, 26, 25, 26, 25, 26, 25, 26, 25,
	    47, 23, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
	    25, 46, 24, 27, 25, 25, 26, 26, 26, 27, 27, 25,
	    25, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79, 26,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, -79,
	    26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
	  };
//	  float data_feature_array[] = {
//	  		1,1,1,
//	  };
//	  buf_len = sprintf(buf, "Trying to infer (NEW)\r\n");
//	  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
//  // Fill input buffer (use test value)
//
	  for (uint32_t i = 0; i < num_elements; i++) {
		  model_input->data.f[i] = test[i];
	  }
	  buf_len = sprintf(buf, "Timer reset\r\n");
	  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
	  ResetTimer();
	  StartTimer();
	  tflite_status = interpreter->Invoke();
	  StopTimer();
	  buf_len = sprintf(buf, "Timer result: %u\r\n",getCycles());
	  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
	  if(tflite_status != kTfLiteOk)
	  {
		  buf_len = sprintf(buf, "Invoke failed\r\n");
		  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
		  error_reporter->Report("Invoke failed");
	  }
	  y_val_0 = model_output->data.int8[0];
	  y_val_1 = model_output->data.int8[1];
//	  num_output_elements = model_output->bytes / sizeof(float);
	  num_output_elements = model_output->bytes;
	  buf_len = sprintf(buf, "Number of output elements: %lu\r\n", num_output_elements);
	  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
	  buf_len = sprintf(buf, "Output 0: %i\r\n", y_val_0);
	  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
	  buf_len = sprintf(buf, "Output 1: %i\r\n", y_val_1);
	  HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
//	 for (uint32_t i = 0; i < num_elements; i++)
//	 {
//	  model_input->data.f[i] = 2.0f;
//	}
//
//	// Get current timestamp
//	// Run inference
//	tflite_status = interpreter->Invoke();
//	if (tflite_status != kTfLiteOk)
//	{
//	  error_reporter->Report("Invoke failed");
//	}
//
//	// Read output (predicted y) of neural network
//	y_val = model_output->data.f[0];
//
//	// Print output of neural network along with inference time (microseconds)
//	buf_len = sprintf(buf,
//					  "Output: %f\r\n",
//					  y_val);
//	HAL_UART_Transmit(&huart1, (uint8_t *)buf, buf_len, 100);
//
//	// Wait before doing it again
	  HAL_Delay(2000);
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_MSI;
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.MSICalibrationValue = 0;
  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_6;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_MSI;
  RCC_OscInitStruct.PLL.PLLM = 1;
  RCC_OscInitStruct.PLL.PLLN = 40;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV7;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1;
  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK2;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOB_CLK_ENABLE();

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
