module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
end
endmodule
### Variation Instruction:
Add a nested if using inside with a 3D array slice selected by variable to test range inclusion.
/results/symbiflow/tests/basic/rtl_files/event_ctl.py
from collections import OrderedDict

import sys

sys.dont_write_bytecode = True

from typing import List, Tuple, Dict
from enum import auto, Enum
import json

import symbiflow_vlog_to_routing as vtr


# This is just a helper method to convert the vtr.Event into a bit mask
def get_bit_mask(event: vtr.Event) -> int:
    value = 0
    for bit in range(event.bit_count):
        value |= 2**bit
    return value


class Vars(Enum):
    A = 0
    B = 1
    C = 2

    @classmethod
    def to_list(cls):
        return [e.value for e in cls]


class State(Enum):
    INPUT = 0
    OUTPUT = 1

    @classmethod
    def to_list(cls):
        return [e.value for e in cls]


def parse_args() -> Tuple[List[str], Dict[str, str]]:
    """
    Returns:
        Tuple: Tuple of list of filename strings and a dict of name : filename
    """
    args = sys.argv
    filename_string = args.pop()
    file_map = {}
    for arg in args:
        file_map[arg] = filename_string + arg
    return file_map.keys(), file_map


def main():
    filenames, file_map = parse_args()
    # Generate the bit mask for each input/output
    bit_mask = []
    input_mask = 0
    output_mask = 0
    for var in Vars.to_list():
        # Input
        bit_mask.append(get_bit_mask(vtr.Event(var.name, State.INPUT.value)))
        input_mask |= bit_mask[-1]
        # Output
        bit_mask.append(get_bit_mask(vtr.Event(var.name, State.OUTPUT.value)))
        output_mask |= bit_mask[-1]

    # Get all the events that are either inputs or outputs
    inputs = []
    outputs = []
    for filename in filenames:
        with open(file_map[filename], 'r') as file:
            vlog_file = json.load(file, object_hook=vtr.VlogDecoder)
            for net in vlog_file['net_list']:
                for event in net['event_list']:
                    if event['event_type'] == vtr.EventType.Input:
                        inputs.append(event)
                    elif event['event_type'] == vtr.EventType.Output:
                        outputs.append(event)

    # Check the events for correct bit count and get the bit mask
    for input_event in inputs:
        assert input_event['bit_count'] == 1
        input_event['bit_mask'] = bit_mask[input_event['var'] + len(Vars.to_list())]
    for output_event in outputs:
        assert output_event['bit_count'] == 1
        output_event['bit_mask'] = bit_mask[output_event['var']]

    # Add to the nets
    for input_event in inputs:
        input_net = None
        for net in vlog_file['net_list']:
            if net['var'] == input_event['var'] + len(Vars.to_list()):
                input_net = net
                break
        if input_net is None:
            input_net = {
                'var': input_event['var'] + len(Vars.to_list()),
                'event_list': [],
                'input_list': [],
                'output_list': [],
            }
            vlog_file['net_list'].append(input_net)
            input_net = vlog_file['net_list'][-1]
        input_net['event_list'].append(input_event)

    for output_event in outputs:
        output_net = None
        for net in vlog_file['net_list']:
            if net['var'] == output_event['var']:
                output_net = net
                break
        if output_net is None:
            output_net = {
                'var': output_event['var'],
                'event_list': [],
                'input_list': [],
                'output_list': [],
            }
            vlog_file['net_list'].append(output_net)
            output_net = vlog_file['net_list'][-1]
        output_net['event_list'].append