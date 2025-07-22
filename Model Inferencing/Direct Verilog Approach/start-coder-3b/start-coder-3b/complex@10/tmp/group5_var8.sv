```sv
/// @file
///
/// @brief A generic FSM implementation.
///
/// @copyright Copyright (c) 2023. All rights reserved.
///
/// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
///
/// * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
/// * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
/// * Neither the name of the author nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
///
/// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

class FSM;
endclass

class FSM #(
    parameter type T = int,
    parameter enum class FSM_STATE = FSM_S,
    parameter enum class FSM_TRANSITION = FSM_T,
    parameter enum class FSM_TRANSITION_TYPE = FSM_TT,
    parameter enum class FSM_TYPE = FSM_T,
    parameter string FSM_NAME = "",
    parameter string FSM_INSTANCE_NAME = "",
    parameter enum class FSM_STATE_TYPE = FSM_ST,
    parameter enum class FSM_STATE_TYPE_TYPE = FSM_STT,
    parameter type FSM_STATE_TYPE_TYPE = int,
    parameter type FSM_STATE_TYPE = int,
    parameter enum class FSM_TYPE_TYPE = FSM_TT,
    parameter type FSM_TYPE_TYPE = int,
    parameter boolean FSM_HAS_OUTPUT = 0,
    parameter type FSM_OUTPUT_TYPE = int,
    parameter enum class FSM_OUTPUT_TYPE_TYPE = FSM_OTT,
    parameter boolean FSM_HAS_INOUT = 0,
    parameter type FSM_INOUT_TYPE = int,
    parameter enum class FSM_INOUT_TYPE_TYPE = FSM_IOTT,
    parameter type FSM_INOUT_TYPE_TYPE = int,
    parameter boolean FSM_HAS_CLOCK = 0,
    parameter type FSM_CLOCK_TYPE = int,
    parameter enum class FSM_CLOCK_TYPE_TYPE = FSM_CTT,
    parameter boolean FSM_HAS_RESET = 0,
    parameter type FSM_RESET_TYPE = int,
    parameter enum class FSM_RESET_TYPE_TYPE = FSM_RTT,
    parameter boolean FSM_HAS_INPUT_CONTROL = 0,
    parameter type FSM_INPUT_CONTROL_TYPE = int,
    parameter enum class FSM_INPUT_CONTROL_TYPE_TYPE = FSM_IC_T,
    parameter type FSM_INPUT_CONTROL_TYPE_TYPE = int,
    parameter enum class FSM_OUTPUT_TYPE_TYPE_TYPE = FSM_OTTT,
    parameter enum class FSM_STATE_TYPE_TYPE_TYPE = FSM_STTT,
    parameter type FSM_OUTPUT_TYPE_TYPE_TYPE = int,
    parameter type FSM_STATE_TYPE_TYPE_TYPE = int,
    parameter type FSM_INOUT_TYPE_TYPE_TYPE = int,
    parameter type FSM_OUTPUT_TYPE_TYPE_TYPE = int,
    parameter type FSM_CLOCK_TYPE_TYPE = int,
    parameter type FSM_RESET_TYPE_TYPE = int,
    parameter type FSM_INPUT_CONTROL_TYPE_TYPE = int,
    parameter type FSM_OUTPUT_TYPE_TYPE_TYPE = int,
) extends SystemVerilog;

    /// @brief The current state of the FSM.
    ///
    /// @note This should be a valid state according to the FSM specification.
    FSM_STATE state;

    /// @brief The current state of the FSM, a human-readable string version.
    ///
    /// @note This should be a valid state according to the FSM specification.
    string state_string;

    /// @brief The next state, based on the incoming FSM_TYPE.
    ///
    /// @note This should be a valid state according to the FSM specification.
    FSM_TYPE next_state;

    /// @brief The next state as a human-readable string.
    ///
    /// @note This should be a valid state according to the FSM specification.
    string next_state_string;

    /// @brief The next transition, based on the incoming FSM_TRANSITION.
    ///
    /// @note This should be a valid transition according to the FSM specification.
    FSM_TRANSITION next_transition;

    /// @brief The next transition as a human-readable string.
    ///
    /// @note This should be a valid transition according to the FSM specification.
    string next_transition_string;

    /// @brief The next transition type, based on the incoming FSM_TRANSITION_TYPE.
    ///
    /// @note This should be a valid transition type according to the FSM specification.
    FSM_TRANSITION_TYPE transition_type;

    /// @brief The current transition type, a human-readable string version of the transition type.
    ///
    /// @note This should be a valid transition type according to the FSM specification.
    string transition_type_string;

    /// @brief Whether or not the FSM has been reset.
    ///
    /// @note This is used to determine if the FSM is in a valid state.
    /// @note This is typically used to determine if the FSM can execute any transitions.
    boolean has_reset;

    /// @brief The current reset value, based on the incoming FSM_RESET_TYPE.
    ///
    /// @note This should be a valid reset value according to the FSM specification.
    FSM_RESET_TYPE reset_value;

    /// @brief The current reset value as a human-readable string version.
    ///
    /// @note This should be a valid reset value according to the FSM specification.
    string reset_value_string;

    /// @brief The current clock value, based on the incoming FSM_CLOCK_TYPE.
    ///
    /// @note This should be a valid clock value according to the FSM specification.
    FSM_CLOCK_TYPE clock_value;

    /// @brief The current clock value as a human-readable string version.
    ///
    /// @note This should be a valid clock value according to the FSM specification.
    string clock_value_string;

    /// @brief The current input value, based on the incoming FSM_INPUT_CONTROL_TYPE.
    ///
    /// @note This should be a valid input value according to the FSM specification.
    FSM_INPUT_CONTROL_TYPE input_control;

    /// @brief The current input value as a human-readable string version.
    ///
    /// @note This should be a valid input value according to the FSM specification.
    string input_control_string;

    /// @brief The output value, based on the incoming FSM_OUTPUT_TYPE.
    ///
    /// @note This should be a valid output value according to the FSM specification.
    FSM_OUTPUT_TYPE output_value;

    /// @brief The output value as a human-readable string version.
    ///
    /// @note This should be a valid output value according to the FSM specification.
    string output_value_string;

    /// @brief The current FSM_STATE_TYPE, typically this will be the same as the FSM_STATE.
    ///
    /// @note This should be a valid state according to the FSM specification.
    FSM_STATE_TYPE state_type;

    /// @brief The current FSM_STATE_TYPE as a human-readable string.
    ///
    /// @note This should be a valid state according to the FSM specification.
    string state_type_string;

    /// @brief The current FSM_OUTPUT_TYPE_TYPE, typically this will be the same as the FSM_OUTPUT_TYPE.
    ///
    /// @note This should be a valid output value according to the FSM specification.
    FSM_OUTPUT_TYPE_TYPE output_type_type;

    /// @brief The current FSM_OUTPUT_TYPE_TYPE as a human-readable string.
    ///
    /// @note This should be a valid output value according to the FSM specification.
    string output_type_type_string;

    /// @brief The current FSM_INOUT_TYPE_TYPE, typically this will be the same as the FSM_INOUT_TYPE.
    ///
    /// @note This should be a valid state according to the FSM specification.
    FSM_INOUT_TYPE_TYPE inout_type_type;

    /// @brief The current FSM_INOUT_TYPE_TYPE as a human-readable string.
    ///
    /// @note This