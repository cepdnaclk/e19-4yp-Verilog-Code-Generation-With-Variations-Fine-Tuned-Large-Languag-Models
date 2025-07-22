module AndOr (output X, Y, input A, B, C);
localparam N = 8;
reg [N-1:0] a, b, c;
always_ff @(posedge clk)
begin
for(int i = 0; i < N; i++)
begin
X[i] <= a[i] & b[i];
Y[i] <= b[i] | c[i];
end
end
endmodule

### Testbench Code:
`testbench andor_tb

always_ff @(posedge clk)
begin
input <= 8'b01010101;
end

initial
begin

end

initial
begin

end

initial
begin

end

initial
begin

end

initial
begin

end`
#include "include.h"
#include "driverlib/rom_map.h"
#include "driverlib/gpio.h"
#include <string.h>
static void UARTStdioIntHandler(void);

static const uart_config_t uartConfig =
{
   .baudRate = 115200,
   .dataLength = UART_CONFIG_WLEN_8,
   .parityType = UART_CONFIG_PAR_NONE,
   .stopBits = UART_CONFIG_STOP_ONE
};

static const uart_pin_config_t uartPinConfig =
{
   .txPin = GPIO_PIN_1,
   .rxPin = GPIO_PIN_0
};

//static const EUSCI_UART_Config uartConfig =
//{
//    EUSCI_A_UART_CLOCKSOURCE_SMCLK,
//    8,
//    1,
//    EUSCI_A_UART_NO_PARITY,
//    EUSCI_A_UART_LSB_FIRST,
//    EUSCI_A_UART_ONE_STOP_BIT,
//    EUSCI_A_UART_MODE,
//    EUSCI_A_UART_OVERSAMPLING_BAUDRATE_GENERATION
//};

//static const eusci_a_uart_pin_config_t uartPinConfig =
//{
//    EUSCI_A_UART_INPUT_A,
//    EUSCI_A_UART_NO_REDIRECT_RXD
//};

void initUART()
{
    MAP_UART_initModule(EUSCI_A2_BASE, &uartConfig);
    MAP_UART_enableModule(EUSCI_A2_BASE);
    MAP_UART_initRx(EUSCI_A2_BASE, &uartConfig);
    MAP_UART_initTx(EUSCI_A2_BASE, &uartConfig);
    MAP_UART_enableInterrupt(EUSCI_A2_BASE, EUSCI_A_UART_RECEIVE_INTERRUPT);
    MAP_UART_transmitData(EUSCI_A2_BASE, 'S');
    MAP_UART_enableInterrupt(EUSCI_A2_BASE, EUSCI_A_UART_RECEIVE_INTERRUPT);
    MAP_GPIO_setAsPeripheralModuleFunctionInputPin(GPIO_PORT_P2, GPIO_PIN1, GPIO_PRIMARY_MODULE_FUNCTION);
}

void initGPIO()
{
    MAP_GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN0);
    MAP_GPIO_setOutputLowOnPin(GPIO_PORT_P1, GPIO_PIN0);

    MAP_GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN6);
    MAP_GPIO_setOutputLowOnPin(GPIO_PORT_P1, GPIO_PIN6);

    MAP_GPIO_setAsOutputPin(GPIO_PORT_P1, GPIO_PIN7);
    MAP_GPIO_setOutputHighOnPin(GPIO_PORT_P1, GPIO_PIN7);

    MAP_GPIO_setAsOutputPin(GPIO_PORT_P2, GPIO_PIN5);
}

void EUSCIA2_IRQHandler(void)
{
    uint8_t data;

    switch (__even_in_range(MAP_UART_getInterruptStatus(EUSCI_A2_BASE, EUSCI_A_UART_RECEIVE_INTERRUPT_FLAG), EUSCI_A_UART_RECEIVE_INTERRUPT))
    {
        case EUSCI_A_UART_RECEIVE_INTERRUPT:
        {
            MAP_UART_readData(EUSCI_A2_BASE, &data);
            MAP_UART_transmitData(EUSCI_A2_BASE, data);
            if(data == ';')
            {
                MAP_GPIO_setOutputLowOnPin(GPIO_PORT_P1, GPIO_PIN6);
            }
            else if(data == '#')
            {
                MAP_GPIO_setOutputHighOnPin(GPIO_PORT_P1, GPIO_PIN6);
            }
            break;
        }
        default:
            break;
    }
}
#ifndef __INCLUDE_H__
#define __INCLUDE_H__

#include "driverlib.h"
#include "driverlib/uart.h"

#include "msp.h"

void initGPIO();

void initUART();

#endif
#include <msp430.h>

const int N = 10;
const int t_1 = 5000;
const int t_2 = 10000;
const int t_3 = 100;

int main(void)
{
    int i = 0;
    WDTCTL = WDTPW | WDTHOLD;
    P1DIR |= 0x02;
    P2DIR |= 0x01;
    P1SEL1 |= 0x02;
    P1SEL0 |= 0x02;

    P5DIR |= BIT0;
    P5SEL1 |= BIT0;
    P5SEL0 |= BIT0;

    P4DIR |= BIT7;
    P4SEL0 |= BIT7;
    P4SEL1 |= BIT7;

    PJDIR |= BIT6;
    PJOUT |= BIT6;

    P6DIR |= BIT1;
    P6OUT |= BIT1;

    TA0CCTL0 |= CCIE;
    TA0CCR0 = 1000;
    TA0CTL |= TASSEL_2 + MC_1 + ID_3;

    __enable_interrupt();

    for(;;)
    {
        if(i == N)
        {
            i = 0;
        }

        if(i == 0)
        {
            P1OUT &= ~BIT0;
            P6OUT &= ~BIT1;
        }
        else if(i == 1)
        {
            P