module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
integer random_integer;
boolean rand_boolean = 1'b0;
real rand_real = 0.5;
string rand_string = "hello";

randomization
structure rand_structure;
rand_structure.integer = random_integer;
rand_structure.boolean = rand_boolean;
rand_structure.real = rand_real;
rand_structure.string = rand_string;
endrandomization

assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule

### Results:

#### RANDOM FUNCTION:
Test results of random function.

![image](https://user-images.githubusercontent.com/65753626/123552020-88a30a00-d772-11eb-955b-70c91b33505f.png)

#### RANDOM NUMBER:
Test results of the random number function.

![image](https://user-images.githubusercontent.com/65753626/123552033-96588f80-d772-11eb-841b-86a82f9a858d.png)

#### RANDOM STRING:
Test results of the random string function with different lengths of the string.

![image](https://user-images.githubusercontent.com/65753626/123552043-a07a8e00-d772-11eb-95e9-17e95e586974.png)

#### RANDOM REAL:
Test results of the random real function.

![image](https://user-images.githubusercontent.com/65753626/123552051-a8d2c900-d772-11eb-8190-27b33c2e02f2.png)

#### RANDOM BOOLEAN:
Test results of the random boolean function.

![image](https://user-images.githubusercontent.com/65753626/123552060-b0926d80-d772-11eb-816d-80f438147b19.png)

#### RANDOM CHARACTER:
Test results of the random character function.

![image](https://user-images.githubusercontent.com/65753626/123552065-bb4d0280-d772-11eb-9f60-05c014b58543.png)

#### RANDOM INTEGER:
Test results of the random integer function.

![image](https://user-images.githubusercontent.com/65753626/123552078-c43dd400-d772-11eb-8c73-d14621748ca5.png)

#### RANDOM STRUCTURE:
Test results of the random structure function.

![image](https://user-images.githubusercontent.com/65753626/123552086-d0299600-d772-11eb-80b6-027a0881fe98.png)


/src/test_bench.py
import sys
from pathlib import Path
from time import time
from functools import wraps
from tempfile import gettempdir
from shutil import rmtree
from contextlib import contextmanager
from subprocess import check_output, CalledProcessError, PIPE, STDOUT
from argparse import ArgumentParser
from random import randint, random, choice

from pyverilog.ast_code_generator import gen_module, gen_code
from pyverilog.parser.parser import parse


def test(func, *args):
    t0, result = time(), func(*args)
    print(f'{func.__name__}, {t0:.0f} ms', end='')
    print(f' [{result}]') if result is not None else print()


def random_func_arg():
    '''Generate a random function name.'''
    n = randint(1, 3)
    return 'random' + ''.join(('integer','real','string', 'boolean',
                               'character', 'integer','real','string',
                               'boolean', 'character')[i] for i in range(n))


def random_string():
    '''Generate a random string.'''
    return''.join(choice('abcdefghijklmnopqrstuvwxyz') for _ in range(randint(1, 5)))


def random_integer():
    '''Generate a random integer.'''
    return randint(-(1 << 32), 1 << 32)


def random_real():
    '''Generate a random real.'''
    return random()


def random_boolean():
    '''Generate a random boolean.'''
    return bool(randint(0, 1))


def random_character():
    '''Generate a random character.'''
    return chr(randint(0, 255))


def random_structure():
    '''Generate a random structure.'''
    return type('random_structure', (object,), {
        'integer': random_integer(),'real': random_real(),
       'string': random_string(), 'boolean': random_boolean(),
        'character': random_character()})


def random_var():
    '''Generate a random variable.'''
    return f'random_{random_func_arg()}'


def random_port():
    '''Generate a random port.'''
    return random_var()


def test_func(func):
    '''Function decorator, add function's name to func attribute.'''
    @wraps(func)
    def wrapper(*args):
        return func(*args)
    wrapper.func = func.__name__
    return wrapper


def remove_temp_files(dir_path):
    '''Remove temporary files and folders.'''
    rmtree(Path(dir_path), ignore_errors=True)


@contextmanager
def temporary_directory():
    '''Create a temporary directory.'''
    try:
        yield gettempdir()
    except OSError:
        return None
    except:
        raise
    else:
        return gettempdir()


def generate_test_file(file_path, content):
    '''Genreate a test file.'''
    with open(file_path, 'w') as f_file:
        f_file.write(content)


def get_test_file_path(file_path):
    return Path(file_path).absolute()


def get_test_file_dir(file_path):
    return get_test_file_path(file_path).parent.absolute()


def compile_test_file(file_path):
    '''Compile an RTL test file.'''
    test_file_dir = get_test_file_dir(file_path)
    code = gen_module(parse(file_path))
    generate_test_file(test_file_dir / 'test_bench_pyverilog.v', code)
    compile_cmd = ['iverilog', '-o', test_file_dir / 'test_bench_pyverilog_compiled.vvp',
                   test_file_dir / 'test_bench_pyverilog.v']
    try:
        check_output(compile_cmd, cwd=test_file_dir, stderr=STDOUT)
    except CalledProcessError as e:
        raise CalledProcessError(e.cmd, e.returncode, e.output)


@test_func
def generate_module(name, content):
    '''Generate an RTL module.'''
    file_path = get_test_file_path(name)
    generate_test_file(file_path, content)
    compile_test_file(file_path)

    @test_func
    def compile_module(name):
        '''Compile an RTL module.'''
        compile_test_file(name)

    @test_func
    def execute_module(name):
        '''Execute an RTL module.'''
        test_file_dir = get_test_file_dir(name)
        run_cmd = ['vvp', '-N', test_file_dir / 'test_bench_pyverilog_compiled.vvp',
                   test_file_dir / 'test_bench_pyverilog.v']
        try:
            check_output(run_cmd, cwd=test_file_dir, stderr=STDOUT)
        except CalledProcessError as e