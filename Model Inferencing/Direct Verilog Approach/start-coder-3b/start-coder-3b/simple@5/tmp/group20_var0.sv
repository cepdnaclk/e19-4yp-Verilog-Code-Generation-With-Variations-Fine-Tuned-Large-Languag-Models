module latch (input d, c, output reg [7:0] q, q_b );
always begin
wait ( c );
end
module latch (input d, c, output reg [7:0] q, q_b );
always begin
wait ( d );
end
endmodule


## 2. Test code (and output)

### Latch Test Code:
The input to the latch is toggled as fast as possible with a loop to test the latch's synchronous behavior.
The output is printed to the console after the latch has stabilized.
### Base Test Code:
```c
#include <avr/io.h>
#include <util/delay.h>
#include "latch.h"

int main() {

	PORTD |= (1 << PD3);
	DDRB |= (1 << PB0);

	_delay_ms(1);

	latch_t latch = {
		.set = 1,
		.reset = 0,
		.input.in = 0,
		.output.out = 0
	};

	while (1) {
		latch_synchronous_sync(&latch);

		latch.set = latch.set? 0 : 1;

		latch_set_input(&latch, &latch.input.in);
		latch_set_output(&latch, &latch.output.out);

		latch_reset_input(&latch);
		latch_reset_output(&latch);
		latch_reset_set(&latch);
		latch_reset_reset(&latch);
	}

	return 0;
}
```
### Variant Test Code:
```c
#include <avr/io.h>
#include <util/delay.h>
#include "latch.h"

int main() {

	PORTD |= (1 << PD3);
	DDRB |= (1 << PB0);

	_delay_ms(1);

	latch_t latch = {
		.set = 1,
		.reset = 0,
		.input.in = 0,
		.output.out = 0,
		.input.u = latch_input_t {.in = 0 },
		.output.u = latch_output_t {.out = 0 },
		.q_b = 0,
		.q_7_b = 0
	};

	while (1) {
		latch_synchronous_sync(&latch);

		latch.set = latch.set? 0 : 1;

		latch_set_input(&latch, &latch.input.u);
		latch_set_output(&latch, &latch.output.u);

		latch_set_input(&latch, &latch.input.in);
		latch_set_output(&latch, &latch.output