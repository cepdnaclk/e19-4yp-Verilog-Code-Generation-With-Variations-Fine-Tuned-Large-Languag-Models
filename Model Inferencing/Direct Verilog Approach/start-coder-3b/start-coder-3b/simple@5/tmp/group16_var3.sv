module orfr_tst;
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  typedef struct packed {logic dIn, dOut; string strIn, strOut;} D;
  D d;
  or_fr_rl dd(a,b,c, d.dIn, d.dOut, d.strIn, d.strOut); 
endmodule
y.
/README.md
# Verilog-Designs

This repository contains my personal verilog designs and projects from my university time b/SNAKE/src/main.c
/*
 * Copyright 2011-2015 ARM Limited
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Note: You need to adapt this file to your target hardware platform
 *
 *
 *
 * Author :, ECE 3411 F15
 */ 
#include <stdio.h>
#include "core_cm3.h"
#include "platform_config.h"
#include "platform_types.h"
#include "gpio_api.h"
#include "LED_api.h"
#include "LPI2C_API.h"
#include "LPI2C_drv.h"
#include "UART_api.h"
#include "sys_time.h"
#include "I2C_API.h"
#include "LPS25H_API.h"
#include "math.h"
#include "l1_uart.h"

#define PIT_IRQHandler PIT0_IRQHandler
#define PIT_IRQn PIT0_IRQn
#define PIT_IRQ_PRIORITY 1
#define PIT_IRQ_NUMBER 25
#define PIT_IRQ_CHANNEL 0
#define UART0_RX_TX_IRQHandler UART0_RX_TX_IRQHandler
#define UART0_RX_TX_IRQn UART0_RX_TX_IRQn
#define UART0_RX_TX_IRQ_PRIORITY 1
#define UART0_RX_TX_IRQ_NUMBER 15
#define UART0_RX_TX_IRQ_CHANNEL 0
#define UART0_RX_TX_BAUDRATE 115200
#define UART0_RX_TX_PIN_RX GPIO_PIN_0
#define UART0_RX_TX_PIN_TX GPIO_PIN_1
#define UART0_RX_TX_PORT PORTE_BASE
#define UART0_RX_TX_PORT_PIN_MASK (1 << UART0_RX_TX_PIN_RX) | (1 << UART0_RX_TX_PIN_TX)


#define PIT_MAX_COUNTER 0xFFFFFFFF
#define PIT_CLOCK_FREQUENCY 1200000

/*
#define PIT_MAX_COUNTER 0xFFFFFFFF
#define PIT_CLOCK_FREQUENCY 1600000


#define PIT_MAX_COUNTER 0xFFFFFFFF
#define PIT_CLOCK_FREQUENCY 1600000
*/

/*
 * This variable is used to indicate application state.
 */
typedef enum {
	Init,
	Idle,
	Running,
	Error
} AppState_t;

/*
 * State structure used to pass data between application tasks.
 */
typedef struct {
	AppState_t state;
	uint32_t timer;
} AppData_t;

/*
 * State structure used to pass data between application tasks.
 */
typedef struct {
	uint32_t timer;
} UARTData_t;

/*
 * Global data used to communicate between application tasks.
 */
AppData_t g_AppData;

/*
 * Application error routine.
 */
static void Error(void) {
	g_AppData.state = Error;
}

/*
 * Application init routine.
 */
static void Init(void) {
	g_AppData.state = Init;
	
}

/*
 * Application Idle task.
 */
static void Idle(void) {
	
	g_AppData.state = Idle;
}


/*
 * Application running task.
 */
static void Running(void) {
	UARTData_t uartData;
	int c;
	int i;

	/*
	 * Write some text on the UART.
	 */
	printf("Hello World\r\n");

	/*
	 * Infinite loop.
	 */
	i = 0;
	while (1) {
		
		if(I2C_ReadRegister(accelerometer_write_address, 0x25)==0x55)
		{
			printf("\n\n LPS25HB is operational\r\n");
			I2C_WriteRegister(accelerometer_write_address, 0x20, 0x47);
			
			lps25h_data_t pressure = {0}, temperature={0}, altitude={0};
			lps25h_data_t temp={0};
			lps25h_data_t press={0};
			I2C_ReadRegister(accelerometer_write_address, 0x28, &(temperature.data[0]));
			I2C_ReadRegister(accelerometer_write_address, 0x29, &(temperature.data[1]));
			I2C_ReadRegister(accelerometer_write_address, 0x2A, &(temperature.data[2]));
			I2C_ReadRegister(accelerometer_write_address, 0x2B, &(temperature.data[3]));
			
			I2C_ReadRegister(accelerometer_write_address, 0x2D, &(pressure.data[0]));
			I2C_ReadRegister(accelerometer_write_address, 0x2E, &(pressure.data[1]));
			I2C_ReadRegister(accelerometer_write_address, 0x2F, &(pressure.data[2]));
			I2C_ReadRegister(accelerometer_write_address, 0x30, &(pressure.data[3]));
			//printf("Read Value of pressure is X%x Y%x Z%x\r\n", pressure.data[0], pressure.data[1], pressure.data[2], pressure.data[3]);
			
			/*printf("X: %d Y: %d Z:%d\r\n", (int)temperature.data[0], (int)temperature.data[1], (int)temperature.data[2]);
			printf("X: %d Y: %d Z:%d\r\n", (int)pressure.data[0], (int)pressure.data[1], (int)pressure.data[2]);*/
			//printf("X: %d Y: %d Z:%d\r\n", (int)(((press.data[0] * 0xFF) | (press.data[1] << 8)) / 4096.0), (int)(((pressure.data[0] * 0xFF) | (pressure.data[1] << 8)) / 4096.0), (int)(((pressure.data[2] * 0xFF) | (pressure.data[3] << 8)) / 4096.0));
			//printf("Temp: %f \r\n", (int)(((temperature.data[0] * 0xFF) | (temperature.data[1] << 8)) / 1000));
			//printf("Press: %f \r\n", (int)(((pressure.data[0] * 0xFF) | (pressure.data[1] << 8)) / 4096.0));
			temp.data[0] = (int)temperature.data[0];
			temp.data[1] = (int)temperature.data[1];
			temp.data[2] = (int)temperature.data[2];