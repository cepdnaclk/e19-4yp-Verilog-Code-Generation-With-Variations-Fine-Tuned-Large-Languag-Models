module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;

structure {
  rand bit w;
}
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule'''

test_code2 = ''''''


class RandomizeTestCase(unittest.TestCase):
    def test_parser(self):
        test = generate_test(test_code1)
        self.assertTrue(test.get_test_type() == TestType.PARSER)
        self.assertEqual(test.get_code(), test_code1)

    def test_randomize_type_normal(self):
        test = generate_test(test_code1)
        test.generate()
        self.assertEqual(test.get_test_type(), TestType.NORMAL)

    def test_randomize_type_random(self):
        test = generate_test(test_code1)
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)

    def test_randomize_type_parser(self):
        test = generate_test(test_code2)
        test.generate()
        self.assertEqual(test.get_test_type(), TestType.PARSER)

    def test_no_randomize_instruction(self):
        with self.assertRaises(AssertionError):
            test = generate_test('module a; endmodule')
            test.generate()

    def test_randomize_module_no_input_no_output(self):
        with self.assertRaises(AssertionError):
            test = generate_test('module a; endmodule')
            test.generate_randomized()

    def test_randomize_module_no_input_yes_output(self):
        test = generate_test('module a(output out); endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_yes_input_no_output(self):
        test = generate_test('module a(input in); endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_yes_input_yes_output(self):
        test = generate_test('module a(input in, output out); endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_yes_input_yes_output_with_parameters(self):
        test = generate_test('module a(input in, output out, parameter a); endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_yes_input_yes_output_with_nettype(self):
        test = generate_test('module a(input in, output out, reg nettype); endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_yes_input_yes_output_with_nettype_and_parameters(self):
        test = generate_test('module a(input in, output out, reg nettype, parameter a); endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_yes_input_yes_output_with_parameters_and_nettype(self):
        test = generate_test('module a(input in, output out, parameter a, reg nettype); endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_yes_input_yes_output_with_parameters_and_nettype_and_parameter(self):
        test = generate_test('module a(input in, output out, parameter a, reg nettype, parameter b); endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_with_no_body(self):
        test = generate_test('module a; endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_with_body(self):
        test = generate_test('module a(input in, output out); case(0) endcase endmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_with_body_multi(self):
        test = generate_test('module a(input in, output out); \ncase(0)\nendcase\nendmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_with_body_multi_multi(self):
        test = generate_test('module a(input in, output out); \ncase(0)\n\nendcase\nendmodule')
        test.generate_randomized()
        self.assertEqual(test.get_test_type(), TestType.RANDOM)
        self.assertTrue(re.match('^\s*\* TEST CASE [0-9]+ \*\\n', test.get_code()))
        self.assertTrue(re.match('^\s*\* TEST INPUT [0-9]+ \*\\n', test.get_code()))

    def test_randomize_module_with_body_multi_multi_multi(self):
        test = generate_test('module a(input in, output out); \ncase(