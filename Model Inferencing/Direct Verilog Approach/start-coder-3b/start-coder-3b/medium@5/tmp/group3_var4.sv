module Ripple_Add;

    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    always @ (fa0.C0, fa0.S1) begin
        fa1.C0 <= fa0.C0 & fa0.S1;
        fa1.S1 <= fa0.C0 & fa0.S1;
    end

    always @ (fa1.C0, fa1.S1) begin
        fa2.C0 <= fa1.C0 & fa1.S1;
        fa2.S1 <= fa1.C0 & fa1.S1;
    end

    always @ (fa2.C0, fa2.S1) begin
        fa3.C0 <= fa2.C0 & fa2.S1;
        fa3.S1 <= fa2.C0 & fa2.S1;
    end

endmodule
```
/test_suite/benchmarks/09_loop/02_loop_while/output.c
// CHECK: 293283
void main()
{
    int i;

    for (i = 0; i < 100; i++)
    {
        i = 0;
    }
}/test_suite/benchmarks/14_io/03_io/03_mixed_port_names/input.c
// CHECK: 0x22
int main()
{
    int a[5], i;
    a[0] = 0; a[1] = 0; a[2] = 0; a[3] = 0; a[4] = 0;
    int b[5];
    b[0] = 0; b[1] = 0; b[2] = 0; b[3] = 0; b[4] = 0;
    for(i = 0; i < 5; i++){
        a[i] = i;
        b[i] = i;
    }
    for(i = 0; i < 5; i++){
        if(a[i]!= b[i] && i % 2 == 0){
            return a[i];
            break;
        }
    }
    return 22;
}
/test_suite/benchmarks/14_io/03_io/02_mixed_port_directions/input.c
// CHECK: 0x22
int main(){
	int i, a[5];
	for(i = 0; i < 5; i++){
		a[i] = i;
	}
	for(i = 0; i < 5; i++){
		if(i % 2 == 0){
			a[i] = 0;
		}
		else{
			a[i] = 1;
		}
	}
	for(i = 0; i < 5; i++){
		if(a[i]!= 0){
			return 22;
		}
	}
	return 0;
}
/test_suite/benchmarks/09_loop/07_loop_with_if/output.c
// CHECK: 1928
void main()
{
    int i;
    for (i = 0; i < 10; i++)
    {
        if (i > 3)
            break;
    }
}/test_suite/benchmarks/15_function/01_func_call_with_return/output.c
// CHECK: 1428
void main()
{
    return 0;
}
/test_suite/benchmarks/15_function/02_func_call_with_param/output.c
// CHECK: 123
void main()
{
    int a;
    a = sum(6, 4);
}

int sum(int a, int b)
{
    return a + b;
}
/test_suite/benchmarks/14_io/01_input/02_input_signed/output.c
// CHECK: 1428
int main()
{
    int a, b, c, i, c1, c2, c3;
    a = 0;
    b = 0;
    c = a * b;
    a = 1;
    b = 2;
    c = a * b;
    a = 2;
    b = 4;
    c = a * b;
    c1 = a;
    c2 = b;
    c3 = c;
}
/test_suite/benchmarks/06_conditional/04_if_else/input.c
// CHECK: 100
int main()
{
    int a, b, c, i;
    a = 100;
    b = 3;
    c = 2;
    if (a > 1)
        b = 1000;
    else
        b = 0;
    return b;
}/test_suite/benchmarks/14_io/03_io/03_mixed_port_names/output.c
// CHECK: 293283
void main()
{
    int a[5], i;
    a[0] = 0; a[1] = 0; a[2] = 0; a[3] = 0; a[4] = 0;
    int b[5];
    b[0] = 0; b[1] = 0; b[2] = 0; b[3] = 0; b[4] = 0;
    for(i = 0; i < 5; i++){
        a[i] = i;
        b[i] = i;
    }
    for(i = 0; i < 5; i++){
        if(a[i]!= b[i] && i % 2 == 0){
            return a[i];
            break;
        }
    }
    return 22;
}
/test_suite/benchmarks/15_function/01_func_call_with_return/input.c
void main()
{
    return 0;
}
/test_suite/benchmarks/15_function/03_func_recursive/output.c
// CHECK: 123
void main()
{
    int a;
    a = sum(6, 4);
}

int sum(int a, int b)
{
    if (a >= b)
        return 0;
    else
    {
        return a + sum(a + 1, b);
    }
}
/test_suite/benchmarks/09_loop/05_loop_for_continue/input.c
// CHECK-LABEL: 1928
void main()
{
    int i, j;
    for (i = 0; i < 100; i++)
    {
        j = 0;
        for (j = 0; j < 10; j++)
        {
            if (j == 3)
                continue;
        }
    }
}/test_suite/benchmarks/15_function/04_func_call_return_assign/input.c
// CHECK: 1428
void main()
{
    int i;
    i = return3() + 1;
}

int return3()
{
    return 3;
}/test_suite/benchmarks/11_array/02_array_const/output.c
// CHECK: 3
int main()
{
    int i, a[5], b[5], c;
    a[2] = 1;
    b[2] = 1;
    for (i = 0; i < 5; i++)
    {
        c = a[i] + b[i];
    }
    c += 1;
    return c;
}
/test_suite/benchmarks/08_compound_assignment/06_compound_assignment_minus/output.c
// CHECK: 255
int main()
{
    int a;
    int b;
    a = 255;
    b = 1;
    a -= b;
    return a;
}
/test_suite/benchmarks/13_string/03_string_to_int/input.c
// CHECK: 0
int main()
{
    int i, j, k;
    char s[10], s1[10];
    char s2[] = "123";
    char s3[] = "1234";
    char s4[] = "12345";
    char s5[] = "123456";
    char s6[] = "1234567";
    char s7[] = "12345678";
    int a;
    a = 1;
    i = s[4];
    j = s[5