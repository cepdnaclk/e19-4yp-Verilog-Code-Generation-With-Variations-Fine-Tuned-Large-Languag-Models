module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
reg y = 2;
reg z = x1[y];
always @(x1 or x2 or x3)
    if (x2 == 1)
        f = x1;
    else
        f = x3;
endmodule
### Variable:
x1, x2, x3, f, y, z
### Variation Type:
Test
### Variation Criteria:
Part-select of a packed array is inside a variable, which is assigned to a variable, which is assigned to a part-select of a packed array
import logging

import pytest

from pyvlog.vlog import VLog
from pyvlog.vlog.exception import VLogError

log = logging.getLogger(__name__)


@pytest.fixture(name="vlog")
def fixture_vlog():
    return VLog()


@pytest.mark.parametrize(
    "src, expected_error, expected_error_msg",
    [
        ["", VLogError, "Empty vlog file"],
        ["\n", VLogError, "Empty vlog file"],
        ["\n\n", VLogError, "Empty vlog file"],
        ["module A(a, b);", VLogError, "Invalid format"],
        ["module A(a, b);endmodule\n\n", VLogError, "Empty vlog file"],
        ["module A(a, b);endmodule\n\nmodule A(a, b);", VLogError, "Empty vlog file"],
    ],
)
def test_vlog_file_exception(vlog, src, expected_error, expected_error_msg):
    with pytest.raises(expected_error) as excinfo:
        vlog.parse(src)
    assert str(excinfo.value) == expected_error_msg


def test_vlog_parse(vlog):
    vlog.parse(
        "module A(a, b);\n"
        "  output a;\n"
        "  input b;\n"
        "endmodule\n"
        "\n"
        "module B(a,b);\n"
        "  output a,\n"
        "         b;\n"
        "endmodule\n"
        "\n"
        "module C(a,b);\n"
        "  input a,\n"
        "         b;\n"
        "endmodule\n"
        "\n"
        "module C(a,b);\n"
        "  input a,\n"
        "         b;\n"
        "endmodule\n"
    )
    assert vlog.module_names == {"A", "B", "C"}
    assert vlog.module_names == {"A", "B", "C"}
    assert vlog.module_a_names == {"A"}
    assert vlog.module_b_names == {"B"}
    assert vlog.module_c_names == {"C"}
    assert vlog.module_c_names == {"C"}
    assert vlog.module_type_names == {"A", "B", "C"}
    assert vlog.module_type_names == {"A", "B", "C"}
    assert vlog.module_a_names & vlog.module_b_names == set()
    assert vlog.module_a_names & vlog.module_c_names == set()
    assert vlog.module_b_names & vlog.module_c_names == set()
    assert vlog.module_names & vlog.module_type_names == vlog.module_names
    assert vlog.module_type_names & vlog.module_names == vlog.module_type_names


def test_vlog_parse_error(vlog):
    with pytest.raises(VLogError) as excinfo:
        vlog.parse(
            "module A(a, b);\n"
            "  output a;\n"
            "  input b;\n"
            "endmodule\n"
            "\n"
            "module B(a,b);\n"
            "  output a,\n"
            "         b;\n"
            "endmodule\n"
            "\n"
            "module C(a,b);\n"
            "  input a,\n"
            "         b;\n"
            "endmodule\n"
            "\n"
            "module C(a,b);\n"
            "  input a,\n"
            "         b;\n"
            "endmodule\n"
            "\n"
            "module C(a,b);\n"
            "  input a,\n"
            "         b;\n"
            "endmodule\n"
        )
    assert str(excinfo.value) == "Duplicate module name: C"
    with pytest.raises(VLogError) as excinfo:
        vlog.parse(
            "module A(a, b);\n"
            "  output a;\n"
            "  input b;\n"
            "endmodule\n"
            "\n"
            "module A(a,b);\n"
            "  output a,\n"
            "         b;\n"
            "endmodule\n"
            "\n"
            "module C(a,b);\n"
            "  input a,\n"
            "         b;\n"
            "endmodule\n"
            "\n"
            "module C(a,b);\n"
            "  input a,\n"
            "         b;\n"
            "endmodule\n"
            "\n"
            "module C(a,b);\n"
            "  input a,\n"
            "         b;\n