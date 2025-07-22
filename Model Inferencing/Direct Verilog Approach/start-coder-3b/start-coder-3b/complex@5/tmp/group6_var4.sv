module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    case (S)
        2'b00:
            case (S)
                2'b00: f = w0;
                2'b01: f = w1;
                2'b10: f = w2;
                2'b11: f = w3;
                default: f = 1'b0;
            endcase
        2'b01: f = w1;
        2'b10: f = w2;
        2'b11: f = w3;
        default: f = 1'b0;
    endcase
endmodule
```
/python/tests/conftest.py
from py.path import local
from python.generator import Generator
from python.test.utils import (
    get_generated_template_name,
    run_test_and_check,
    setup_venv,
)
import pytest


def get_template_directory(template_name):
    template_directory = (
        Generator.get_template_directory().joinpath(
            f"{template_name}.template"
        )
    )
    assert template_directory.exists()
    return template_directory


def get_test_directory(name):
    test_directory = local(f"tests/{name}")
    test_directory.ensure(dir=True)
    return test_directory


@pytest.fixture
def test_directory(request):
    return get_test_directory(request.function.__name__)


@pytest.fixture
def base_directory(request):
    test_directory = get_test_directory(request.function.__name__)
    return test_directory.joinpath("base")


@pytest.fixture
def modified_directory(request):
    test_directory = get_test_directory(request.function.__name__)
    return test_directory.joinpath("modified")


@pytest.fixture
def generated_directory(request):
    test_directory = get_test_directory(request.function.__name__)
    return test_directory.joinpath("generated")


@pytest.fixture
def templates_directory(request):
    templates_directory = get_template_directory(
        request.function.__name__
    ).parent
    assert templates_directory.exists()
    return templates_directory


@pytest.fixture(scope="session")
def venv(request):
    return setup_venv(request)


@pytest.fixture
def generated_test_file(modified_directory, generated_directory):
    return generated_directory.joinpath(
        get_generated_template_name(modified_directory)
    )


@pytest.fixture
def expected_result_from_test_file(test_directory):
    return test_directory.joinpath("expected_result.txt")


def generate_expected_result_from_test_file(
    expected_result_from_test_file,
    generated_directory,
    modified_directory,
):
    test_file = generated_directory.joinpath(
        get_generated_template_name(modified_directory)
    )
    expected_result_from_test_file.write_text(test_file.read_text())


@pytest.fixture(scope="module")
def modified_test_file(test_directory, modified_directory):
    template_file = get_template_directory(test_directory)
    modified_test_file = modified_directory.joinpath(
        get_generated_template_name(modified_directory)
    )
    modified_test_file.write_text(template_file.read_text())
    return modified_test_file


def check_expected_result_from_test_file(
    expected_result_from_test_file,
    generated_directory,
    modified_directory,
):
    test_file = generated_directory.joinpath(
        get_generated_template_name(modified_directory)
    )
    assert (
        expected_result_from_test_file.read_text().strip()
        == test_file.read_text().strip()
    )


@pytest.fixture(scope="module")
def generated_test_file_with_expected_result(
    modified_test_file,
    generated_directory,
    expected_result_from_test_file,
):
    test_file = generated_directory.joinpath(
        get_generated_template_name(modified_directory)
    )
    test_file.write_text(modified_test_file.read_text())
    return test_file


def generate_expected_result_from_test_file_with_expected_result(
    generated_test_file_with_expected_result,
):
    generated_test_file_with_expected_result.write_text(
        generated_test_file_with_expected_result.read_text()
    )


@pytest.fixture(scope="module")
def generated_test_file_with_test_directory_path_substitution(
    modified_test_file,
    generated_directory,
    expected_result_from_test_file,
):
    test_file = generated_directory.joinpath(
        get_generated_template_name(modified_directory)
    )
    test_file.write_text(modified_test_file.read_text())
    return test_file


def check_expected_result_from_test_file_with_test_directory_path_substitution(
    expected_result_from_test_file,
    generated_directory,
    modified_directory,
):
    test_file = generated_directory.joinpath(